import AppKit
import UniformTypeIdentifiers
import WebKit

/// Recebe os pedidos da interface (window.webkit.messageHandlers.mapa.postMessage) e responde.
/// Só aceita pedidos da página principal do app (omapa://), nunca de páginas abertas no leitor.
final class Ponte: NSObject, WKScriptMessageHandlerWithReply {
    static let nome = "mapa"

    let arquivos: Arquivos
    var abrirNoLeitor: (URL, String?) -> Void = { _, _ in }

    init(arquivos: Arquivos) {
        self.arquivos = arquivos
    }

    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage,
                               replyHandler: @escaping (Any?, String?) -> Void) {
        guard message.frameInfo.isMainFrame,
              message.frameInfo.securityOrigin.protocol == Esquema.nome,
              let corpo = message.body as? [String: Any],
              let acao = corpo["acao"] as? String
        else {
            replyHandler(nil, "pedido recusado")
            return
        }
        do {
            switch acao {
            case "carregar":
                let r = arquivos.carregarProgresso()
                let json: Any = r.json.map { $0 as Any } ?? NSNull()
                replyHandler(["json": json, "onde": r.onde.rawValue] as [String: Any], nil)

            case "salvarProgresso":
                let json = try texto(corpo, "json")
                let onde = try arquivos.salvarProgresso(json)
                replyHandler(["onde": onde.rawValue], nil)

            case "lerNota":
                let id = try texto(corpo, "id")
                let titulo = corpo["titulo"] as? String ?? id
                replyHandler(["texto": arquivos.lerNota(id: id, titulo: titulo) ?? ""], nil)

            case "salvarNota":
                let id = try texto(corpo, "id")
                let titulo = corpo["titulo"] as? String ?? id
                let conteudo = corpo["texto"] as? String ?? ""
                let onde = try arquivos.salvarNota(id: id, titulo: titulo, texto: conteudo)
                replyHandler(["onde": onde.rawValue], nil)

            case "lerNotas":
                replyHandler(["notas": arquivos.lerNotas()], nil)

            case "exportar":
                let conteudo = try texto(corpo, "texto")
                let nome = corpo["nome"] as? String ?? "o-mapa-progresso.json"
                exportar(conteudo, nome: nome, janela: message.webView?.window, replyHandler: replyHandler)

            case "abrir":
                let endereco = try texto(corpo, "url")
                guard let url = URL(string: endereco), ["http", "https"].contains(url.scheme?.lowercased() ?? "") else {
                    throw Arquivos.Erro.caminho(endereco)
                }
                abrirNoLeitor(url, corpo["titulo"] as? String)
                replyHandler(["ok": true], nil)

            case "abrirPasta":
                let id = try texto(corpo, "id")
                let pasta = try arquivos.criarPastaDoAssunto(id: id, titulo: corpo["titulo"] as? String ?? id)
                NSWorkspace.shared.open(pasta)
                replyHandler(["ok": true], nil)

            default:
                replyHandler(nil, "ação desconhecida: \(acao)")
            }
        } catch {
            replyHandler(nil, error.localizedDescription)
        }
    }

    private func texto(_ corpo: [String: Any], _ chave: String) throws -> String {
        guard let v = corpo[chave] as? String else { throw Arquivos.Erro.pedido(chave) }
        return v
    }

    private func exportar(_ conteudo: String, nome: String, janela: NSWindow?, replyHandler: @escaping (Any?, String?) -> Void) {
        let painel = NSSavePanel()
        painel.nameFieldStringValue = nome
        painel.allowedContentTypes = [.json]
        painel.canCreateDirectories = true
        if arquivos.conectado, let raiz = arquivos.raiz {
            painel.directoryURL = raiz.appendingPathComponent("progresso", isDirectory: true)
        }
        let concluir: (NSApplication.ModalResponse) -> Void = { resposta in
            guard resposta == .OK, let url = painel.url else {
                replyHandler(["ok": false], nil)
                return
            }
            do {
                try Data(conteudo.utf8).write(to: url, options: .atomic)
                replyHandler(["ok": true], nil)
            } catch {
                replyHandler(nil, error.localizedDescription)
            }
        }
        if let janela {
            painel.beginSheetModal(for: janela, completionHandler: concluir)
        } else {
            painel.begin(completionHandler: concluir)
        }
    }
}
