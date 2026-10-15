import AppKit
import SwiftUI
import UniformTypeIdentifiers
import WebKit

/// A janela principal: a interface do mapa numa WKWebView, servida pelo esquema omapa://.
struct PainelWeb: NSViewRepresentable {
    let estado: EstadoDoApp

    func makeCoordinator() -> Coordenador {
        Coordenador(estado: estado)
    }

    func makeNSView(context: Context) -> WKWebView {
        let c = context.coordinator
        let config = WKWebViewConfiguration()
        config.setURLSchemeHandler(c.esquema, forURLScheme: Esquema.nome)
        config.userContentController.addScriptMessageHandler(c.ponte, contentWorld: .page, name: Ponte.nome)
        let web = WKWebView(frame: .zero, configuration: config)
        web.navigationDelegate = c
        web.uiDelegate = c
        web.underPageBackgroundColor = NSColor(red: 10 / 255, green: 8 / 255, blue: 18 / 255, alpha: 1)
        if #available(macOS 13.3, *) { web.isInspectable = true }
        estado.web = web
        web.load(URLRequest(url: Esquema.inicio))
        return web
    }

    func updateNSView(_ web: WKWebView, context: Context) {}
}

final class Coordenador: NSObject, WKNavigationDelegate, WKUIDelegate {
    let esquema: Esquema
    let ponte: Ponte

    init(estado: EstadoDoApp) {
        esquema = Esquema(arquivos: estado.arquivos)
        ponte = Ponte(arquivos: estado.arquivos)
        super.init()
        ponte.abrirNoLeitor = { url, titulo in
            Leitores.compartilhado.abrir(url, titulo: titulo)
        }
    }

    /// A página do mapa nunca sai do omapa://. Links da web abrem no leitor do app.
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url else {
            decisionHandler(.cancel)
            return
        }
        switch url.scheme?.lowercased() ?? "" {
        case Esquema.nome, "about", "blob", "data":
            decisionHandler(.allow)
        case "http", "https":
            decisionHandler(.cancel)
            Leitores.compartilhado.abrir(url, titulo: nil)
        case "mailto":
            decisionHandler(.cancel)
            NSWorkspace.shared.open(url)
        default:
            decisionHandler(.cancel)
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
    func webView(_ webView: WKWebView, runOpenPanelWith parameters: WKOpenPanelParameters,
                 initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping ([URL]?) -> Void) {
        let painel = NSOpenPanel()
        painel.allowsMultipleSelection = parameters.allowsMultipleSelection
        painel.canChooseDirectories = false
        painel.canChooseFiles = true
        painel.allowedContentTypes = [.json]
        let concluir: (NSApplication.ModalResponse) -> Void = { resposta in
            completionHandler(resposta == .OK ? painel.urls : nil)
        }
        if let janela = webView.window {
            painel.beginSheetModal(for: janela, completionHandler: concluir)
        } else {
            painel.begin(completionHandler: concluir)
        }
    }

    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        webView.reload()
    }
}
