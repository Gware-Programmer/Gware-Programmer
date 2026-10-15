import AppKit
import SwiftUI
import UniformTypeIdentifiers
import WebKit

/// A janela principal mostra a WebView do mapa. A WebView pertence ao `EstadoDoApp` (uma só,
/// criada uma vez), para que fechar e reabrir a janela não destrua a página nem o que ela
/// ainda não gravou. Por isso este painel serve para um único `Window`, nunca um `WindowGroup`.
struct PainelWeb: NSViewRepresentable {
    let estado: EstadoDoApp

    func makeNSView(context: Context) -> WKWebView {
        estado.webDoMapa()
    }

    func updateNSView(_ web: WKWebView, context: Context) {}

    /// A janela vai fechar: grava já o que estiver pendente. A WebView continua viva no estado.
    static func dismantleNSView(_ web: WKWebView, coordinator: ()) {
        EstadoDoApp.compartilhado.salvar(silencioso: true)
    }
}

/// Delegado de navegação e de interface da WebView do mapa.
final class Coordenador: NSObject, WKNavigationDelegate, WKUIDelegate {
    let esquema: Esquema
    let ponte: Ponte

    init(arquivos: Arquivos) {
        esquema = Esquema(arquivos: arquivos)
        ponte = Ponte(arquivos: arquivos)
        super.init()
        ponte.despacho.abrir = { url, titulo in
            Leitores.compartilhado.abrir(url, titulo: titulo)
        }
    }

    /// A página do mapa nunca sai do omapa://. Links da web abrem no leitor do app.
    /// (Versões `async` dos métodos do delegado: valem com SDKs novos e antigos.)
    @MainActor
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        guard let url = navigationAction.request.url else { return .cancel }
        switch url.scheme?.lowercased() ?? "" {
        case Endereco.esquema, "about", "blob", "data":
            return .allow
        case "http", "https":
            Leitores.compartilhado.abrir(url, titulo: nil)
            return .cancel
        case "mailto":
            NSWorkspace.shared.open(url)
            return .cancel
        default:
            return .cancel
        }
    }

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration,
                 for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if let url = navigationAction.request.url, ["http", "https"].contains(url.scheme?.lowercased() ?? "") {
            Leitores.compartilhado.abrir(url, titulo: nil)
        }
        return nil
    }

    /// "Importar arquivo" na aba Progresso.
    @MainActor
    func webView(_ webView: WKWebView, runOpenPanelWith parameters: WKOpenPanelParameters,
                 initiatedByFrame frame: WKFrameInfo) async -> [URL]? {
        let painel = NSOpenPanel()
        painel.allowsMultipleSelection = parameters.allowsMultipleSelection
        painel.canChooseDirectories = false
        painel.canChooseFiles = true
        painel.allowedContentTypes = [.json]
        let janela = webView.window
        let resposta: NSApplication.ModalResponse = await withCheckedContinuation { continuacao in
            if let janela {
                painel.beginSheetModal(for: janela) { continuacao.resume(returning: $0) }
            } else {
                painel.begin { continuacao.resume(returning: $0) }
            }
        }
        return resposta == .OK ? painel.urls : nil
    }

    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        webView.reload()
    }
}
