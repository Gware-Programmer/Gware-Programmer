import Foundation
import WebKit

/// Serve a interface do app no endereço omapa://app/…
/// - omapa://app/index.html, estilo.css, mapa.js, fontes/… → pasta UI dentro do app;
/// - omapa://app/nous/mapa/mapa.json → o mapa do Nous Keiros (ou o espelho no Mac, sem o KEIROS).
/// Endereços fixos do app (fora da classe para não herdar isolamento de ator).
enum Endereco {
    static let esquema = "omapa"
    static let inicio = URL(string: "omapa://app/index.html")!
}

final class Esquema: NSObject, WKURLSchemeHandler {

    let arquivos: Arquivos

    init(arquivos: Arquivos) {
        self.arquivos = arquivos
    }

    /// A pasta UI: dentro do O MAPA.app; rodando com `swift run`, a pasta UI ao lado do pacote.
    static var pastaUI: URL {
        if let r = Bundle.main.resourceURL?.appendingPathComponent("UI", isDirectory: true),
           FileManager.default.fileExists(atPath: r.appendingPathComponent("index.html").path) {
            return r
        }
        return URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
            .appendingPathComponent("UI", isDirectory: true)
    }

    private static let tipos: [String: String] = [
        "html": "text/html; charset=utf-8", "css": "text/css; charset=utf-8",
        "js": "text/javascript; charset=utf-8", "json": "application/json; charset=utf-8",
        "ttf": "font/ttf", "otf": "font/otf", "woff2": "font/woff2", "svg": "image/svg+xml",
        "png": "image/png", "txt": "text/plain; charset=utf-8",
    ]

    func webView(_ webView: WKWebView, start tarefa: WKURLSchemeTask) {
        guard let url = tarefa.request.url else { return responder(tarefa, 400, nil, nil) }
        var caminho = url.path
        if caminho.isEmpty || caminho == "/" { caminho = "/index.html" }
        let rel = String(caminho.dropFirst())
        let lido: Data?
        if rel.hasPrefix("nous/") {
            lido = arquivos.lerMapa(String(rel.dropFirst("nous/".count)))
        } else if let u = Arquivos.dentro(Self.pastaUI, rel) {
            lido = try? Data(contentsOf: u)
        } else {
            lido = nil
        }
        guard let dados = lido else { return responder(tarefa, 404, nil, nil) }
        let ext = (rel as NSString).pathExtension.lowercased()
        responder(tarefa, 200, dados, Self.tipos[ext] ?? "application/octet-stream")
    }

    func webView(_ webView: WKWebView, stop tarefa: WKURLSchemeTask) {}

    private func responder(_ tarefa: WKURLSchemeTask, _ codigo: Int, _ dados: Data?, _ tipo: String?) {
        let url = tarefa.request.url ?? Endereco.inicio
        let corpo = dados ?? Data()
        let cabecalhos = [
            "Content-Type": tipo ?? "text/plain; charset=utf-8",
            "Content-Length": String(corpo.count),
            "Cache-Control": "no-store",
        ]
        let http: URLResponse? = HTTPURLResponse(url: url, statusCode: codigo, httpVersion: "HTTP/1.1", headerFields: cabecalhos)
        let resposta = http ?? URLResponse(url: url, mimeType: tipo, expectedContentLength: corpo.count, textEncodingName: nil)
        tarefa.didReceive(resposta)
        tarefa.didReceive(corpo)
        tarefa.didFinish()
    }
}
