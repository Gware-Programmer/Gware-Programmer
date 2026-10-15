import AppKit
import UniformTypeIdentifiers
import WebKit

/// Recebe os pedidos da interface (window.webkit.messageHandlers.mapa.postMessage) e encaminha ao `Despacho`.
/// Só aceita pedidos da página principal do app (omapa://), nunca de páginas abertas no leitor.
final class Ponte: NSObject, WKScriptMessageHandlerWithReply {
    static let nome = "mapa"

    let despacho: Despacho
    private weak var janela: NSWindow?

    init(arquivos: Arquivos) {
        despacho = Despacho(arquivos: arquivos)
        super.init()
        despacho.mostrarPasta = { NSWorkspace.shared.open($0) }
        despacho.exportar = { [weak self] conteudo, nome, fim in
            self?.exportar(conteudo, nome: nome, fim: fim)
        }
    }

    /// Versão `async` do pedido com resposta: o compilador deriva a assinatura do protocolo,
    /// então ela vale com SDKs novos e antigos (sem divergência de @Sendable/@MainActor no bloco).
    @MainActor
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) async -> (Any?, String?) {
        guard message.frameInfo.isMainFrame,
              message.frameInfo.securityOrigin.protocol == Endereco.esquema,
              let corpo = message.body as? [String: Any]
        else {
            return (nil, "pedido recusado")
        }
        janela = message.webView?.window
        return await withCheckedContinuation { continuacao in
            despacho.atender(corpo) { resposta, erro in
                continuacao.resume(returning: (resposta.map { $0 as Any }, erro))
            }
        }
    }

    private func exportar(_ conteudo: String, nome: String, fim: @escaping (Result<Bool, Error>) -> Void) {
        let painel = NSSavePanel()
        painel.nameFieldStringValue = nome
        painel.allowedContentTypes = [.json]
        painel.canCreateDirectories = true
        let arquivos = despacho.arquivos
        if arquivos.conectado, let raiz = arquivos.raiz {
            painel.directoryURL = raiz.appendingPathComponent("progresso", isDirectory: true)
        }
        let concluir: (NSApplication.ModalResponse) -> Void = { resposta in
            guard resposta == .OK, let url = painel.url else {
                fim(.success(false))
                return
            }
            do {
                try Data(conteudo.utf8).write(to: url, options: .atomic)
                fim(.success(true))
            } catch {
                fim(.failure(error))
            }
        }
        if let janela {
            painel.beginSheetModal(for: janela, completionHandler: concluir)
        } else {
            painel.begin(completionHandler: concluir)
        }
    }
}
