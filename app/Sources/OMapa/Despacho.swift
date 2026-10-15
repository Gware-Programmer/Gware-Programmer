import Foundation

/// O que a interface pode pedir ao app, e o que ele responde.
/// Só usa Foundation, para ser testado fora do Mac; a `Ponte` (WebKit) apenas encaminha.
///
/// | ação            | pedido                                  | resposta                                         |
/// |-----------------|-----------------------------------------|--------------------------------------------------|
/// | carregar        | —                                       | json, onde, versao, raiz, restaurado             |
/// | salvarProgresso | json, versao, raiz, versionar           | onde, versao, json (se juntou), aviso            |
/// | lerNota         | id, titulo                              | texto, onde, versao, restaurada                  |
/// | salvarNota      | id, titulo, texto, versao, raiz         | onde, versao, conflito, aviso                    |
/// | lerNotas        | —                                       | notas                                            |
/// | exportar        | texto, nome                             | ok                                               |
/// | abrir           | url, titulo                             | ok                                               |
/// | abrirPasta      | id, titulo                              | ok                                               |
final class Despacho {
    let arquivos: Arquivos
    /// Abre um endereço da web no leitor do app.
    var abrir: (URL, String?) -> Void = { _, _ in }
    /// Mostra uma pasta no Finder.
    var mostrarPasta: (URL) -> Void = { _ in }
    /// Pergunta onde salvar e grava; responde se gravou.
    var exportar: (_ texto: String, _ nome: String, _ fim: @escaping (Result<Bool, Error>) -> Void) -> Void = { _, _, fim in
        fim(.success(false))
    }

    init(arquivos: Arquivos) {
        self.arquivos = arquivos
    }

    private static func valor(_ x: Any?) -> Any { x ?? NSNull() }

    private func texto(_ corpo: [String: Any], _ chave: String) throws -> String {
        guard let v = corpo[chave] as? String else { throw Arquivos.Erro.pedido(chave) }
        return v
    }

    private func gravacao(_ g: Arquivos.Gravacao) -> [String: Any] {
        ["onde": g.onde.rawValue, "versao": g.versao, "json": Self.valor(g.json),
         "conflito": g.conflito, "aviso": Self.valor(g.aviso)]
    }

    /// Atende um pedido e chama `responder(resposta, erro)` uma única vez.
    func atender(_ corpo: [String: Any], responder: @escaping ([String: Any]?, String?) -> Void) {
        guard let acao = corpo["acao"] as? String else {
            responder(nil, "pedido sem ação")
            return
        }
        do {
            switch acao {
            case "carregar":
                let l = try arquivos.carregarProgresso()
                responder(["json": Self.valor(l.texto), "onde": l.onde.rawValue, "versao": Self.valor(l.versao),
                           "raiz": Self.valor(arquivos.raiz?.path), "restaurado": l.restaurado], nil)

            case "salvarProgresso":
                try arquivos.conferirRaiz(corpo["raiz"] as? String)
                let json = try texto(corpo, "json")
                let g = try arquivos.salvarProgresso(json, versao: corpo["versao"] as? String,
                                                     versionar: corpo["versionar"] as? Bool ?? false)
                responder(gravacao(g), nil)

            case "lerNota":
                let id = try texto(corpo, "id")
                let l = try arquivos.lerNota(id: id, titulo: corpo["titulo"] as? String ?? id)
                responder(["texto": l.texto ?? "", "onde": l.onde.rawValue, "versao": Self.valor(l.versao),
                           "restaurada": l.restaurado], nil)

            case "salvarNota":
                try arquivos.conferirRaiz(corpo["raiz"] as? String)
                let id = try texto(corpo, "id")
                let g = try arquivos.salvarNota(id: id, titulo: corpo["titulo"] as? String ?? id,
                                                texto: corpo["texto"] as? String ?? "", versao: corpo["versao"] as? String)
                responder(gravacao(g), nil)

            case "lerNotas":
                responder(["notas": arquivos.lerNotas()], nil)

            case "exportar":
                let conteudo = try texto(corpo, "texto")
                let nome = corpo["nome"] as? String ?? "o-mapa-progresso.json"
                exportar(conteudo, nome) { r in
                    switch r {
                    case .success(let ok): responder(["ok": ok], nil)
                    case .failure(let e): responder(nil, e.localizedDescription)
                    }
                }

            case "abrir":
                let endereco = try texto(corpo, "url")
                guard let url = URL(string: endereco), ["http", "https"].contains(url.scheme?.lowercased() ?? "") else {
                    throw Arquivos.Erro.caminho(endereco)
                }
                abrir(url, corpo["titulo"] as? String)
                responder(["ok": true], nil)

            case "abrirPasta":
                let id = try texto(corpo, "id")
                mostrarPasta(try arquivos.criarPastaDoAssunto(id: id, titulo: corpo["titulo"] as? String ?? id))
                responder(["ok": true], nil)

            default:
                responder(nil, "ação desconhecida: \(acao)")
            }
        } catch {
            responder(nil, error.localizedDescription)
        }
    }
}
