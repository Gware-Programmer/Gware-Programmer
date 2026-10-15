import Foundation

/// Onde as coisas ficam: a pasta Nous Keiros (no disco KEIROS) e o apoio no Mac.
///
/// Regras para nada se perder:
/// - toda gravação é atômica (escreve num temporário e troca);
/// - o que seria sobrescrito vai antes para `.versoes/`, na mesma pasta;
/// - o progresso ganha uma cópia por dia em `progresso/backups/`;
/// - com o KEIROS desconectado, grava-se no Mac (`espera/`) e tudo é copiado
///   para o disco quando ele volta; uma cópia na espera é sempre a mais nova;
/// - o Mac guarda um espelho do mapa, do progresso e das notas, para o app
///   abrir e continuar de onde parou mesmo sem o disco.
final class Arquivos {
    enum Onde: String { case keiros, espera }
    enum Versao { case nunca, sempre, aCada(TimeInterval) }

    enum Erro: LocalizedError {
        case caminho(String), pedido(String), desconectado, json
        var errorDescription: String? {
            switch self {
            case .caminho(let c): return "caminho recusado: \(c)"
            case .pedido(let p): return "pedido incompleto: falta \(p)"
            case .desconectado: return "o disco KEIROS não está conectado"
            case .json: return "o progresso recebido não é um JSON válido"
            }
        }
    }

    static let chavePasta = "pastaNousKeiros"
    static let padrao = URL(fileURLWithPath: "/Volumes/KEIROS/Nous Keiros", isDirectory: true)

    private let fm = FileManager.default
    private(set) var raiz: URL?
    let apoio: URL
    var espera: URL { apoio.appendingPathComponent("espera", isDirectory: true) }
    var espelho: URL { apoio.appendingPathComponent("espelho", isDirectory: true) }
    private var ultimaVersao: [String: Date] = [:]
    private var pastasConhecidas: [String: String] = [:]

    /// `apoio` só muda nos testes; no app é ~/Library/Application Support/O MAPA.
    init(apoio outroApoio: URL? = nil) {
        let base = (try? fm.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true))
            ?? URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("Library/Application Support", isDirectory: true)
        apoio = outroApoio ?? base.appendingPathComponent("O MAPA", isDirectory: true)
        try? fm.createDirectory(at: apoio, withIntermediateDirectories: true)
        if let p = UserDefaults.standard.string(forKey: Self.chavePasta) {
            raiz = URL(fileURLWithPath: p, isDirectory: true)
        } else if Self.ehNousKeiros(Self.padrao) {
            definirRaiz(Self.padrao)
        }
        if let d = try? Data(contentsOf: espelho.appendingPathComponent("pastas.json")),
           let m = try? JSONSerialization.jsonObject(with: d) as? [String: String] {
            pastasConhecidas = m
        }
    }

    static func ehNousKeiros(_ url: URL) -> Bool {
        FileManager.default.fileExists(atPath: url.appendingPathComponent("mapa/mapa.json").path)
    }

    /// O disco está montado e a pasta tem o mapa.
    var conectado: Bool { raiz.map(Self.ehNousKeiros) ?? false }

    func definirRaiz(_ url: URL) {
        raiz = url
        UserDefaults.standard.set(url.path, forKey: Self.chavePasta)
    }

    // MARK: - caminhos

    /// Junta um caminho relativo a uma base, recusando "..", "." e qualquer saída da base.
    static func dentro(_ base: URL, _ relativo: String) -> URL? {
        let partes = relativo.split(separator: "/").map(String.init)
        guard !partes.isEmpty, !partes.contains(where: { $0 == ".." || $0 == "." }) else { return nil }
        var u = base
        for p in partes { u.appendPathComponent(p) }
        let b = base.standardizedFileURL.path
        return u.standardizedFileURL.path.hasPrefix(b.hasSuffix("/") ? b : b + "/") ? u : nil
    }

    /// Mesmo nome de pasta que ferramentas/gerar.py dá a cada assunto.
    static func nomePasta(_ id: String, _ titulo: String) -> String {
        var t = titulo.replacingOccurrences(of: ": ", with: ", ").replacingOccurrences(of: ":", with: ",")
        let proibidos = "\\/:*?\"<>|".unicodeScalars
        t = String(String.UnicodeScalarView(t.unicodeScalars.filter { !proibidos.contains($0) && $0.value >= 0x20 }))
        t = t.trimmingCharacters(in: .whitespacesAndNewlines)
        while t.hasSuffix(".") { t.removeLast() }
        t = t.split(whereSeparator: { $0.isWhitespace }).joined(separator: " ")
        var nome = "\(id) — \(t)"
        if nome.count > 120 { nome = String(nome.prefix(120)) }
        while let u = nome.last, u == " " || u == "." || u == "," { nome.removeLast() }
        return nome
    }

    private static func idDaPasta(_ nome: String) -> String {
        nome.components(separatedBy: " — ").first ?? nome
    }

    /// Caminho relativo da pasta de um assunto ("assuntos/M01 — Arithmetic…").
    func pastaDoAssunto(_ id: String, _ titulo: String) -> String {
        if conectado, let raiz,
           let nomes = try? fm.contentsOfDirectory(atPath: raiz.appendingPathComponent("assuntos").path) {
            var mapa: [String: String] = [:]
            for n in nomes.sorted() where !n.hasPrefix(".") { mapa[Self.idDaPasta(n)] = n }
            if mapa != pastasConhecidas {
                pastasConhecidas = mapa
                if let d = try? JSONSerialization.data(withJSONObject: mapa, options: [.prettyPrinted, .sortedKeys]) {
                    try? gravarAtomico(d, espelho.appendingPathComponent("pastas.json"), versao: .nunca)
                }
            }
        }
        return "assuntos/" + (pastasConhecidas[id] ?? Self.nomePasta(id, titulo))
    }

    /// Na espera, a pasta do assunto pode ter outro nome; no disco vale a pasta que já existe com o mesmo ID.
    private func resolverNoDisco(_ relativo: String) -> String {
        var partes = relativo.split(separator: "/").map(String.init)
        guard partes.count >= 2, partes[0] == "assuntos", let raiz,
              let nomes = try? fm.contentsOfDirectory(atPath: raiz.appendingPathComponent("assuntos").path) else { return relativo }
        let id = Self.idDaPasta(partes[1])
        if let existente = nomes.sorted().first(where: { !$0.hasPrefix(".") && Self.idDaPasta($0) == id }) { partes[1] = existente }
        return partes.joined(separator: "/")
    }

    // MARK: - leitura e gravação

    /// Lê um arquivo do Nous Keiros. Uma cópia na espera é sempre a mais nova.
    func ler(_ relativo: String) -> Data? {
        if let e = Self.dentro(espera, relativo), let d = try? Data(contentsOf: e) { return d }
        if conectado, let raiz, let u = Self.dentro(raiz, relativo) { return try? Data(contentsOf: u) }
        return nil
    }

    func lerEspelho(_ relativo: String) -> Data? {
        Self.dentro(espelho, relativo).flatMap { try? Data(contentsOf: $0) }
    }

    func espelhar(_ dados: Data, _ relativo: String) {
        if let u = Self.dentro(espelho, relativo) { try? gravarAtomico(dados, u, versao: .nunca) }
    }

    @discardableResult
    func gravar(_ dados: Data, em relativo: String, versao: Versao) throws -> Onde {
        if conectado, let raiz {
            esvaziarEspera()
            guard let destino = Self.dentro(raiz, relativo) else { throw Erro.caminho(relativo) }
            try gravarAtomico(dados, destino, versao: versao)
            if let e = Self.dentro(espera, relativo) { try? fm.removeItem(at: e) }
            return .keiros
        }
        guard let destino = Self.dentro(espera, relativo) else { throw Erro.caminho(relativo) }
        try gravarAtomico(dados, destino, versao: .nunca)
        return .espera
    }

    func gravarAtomico(_ dados: Data, _ destino: URL, versao: Versao) throws {
        try fm.createDirectory(at: destino.deletingLastPathComponent(), withIntermediateDirectories: true)
        if let antigo = try? Data(contentsOf: destino), !antigo.isEmpty, antigo != dados {
            let encolheu = antigo.count > 200 && dados.count < antigo.count / 2
            var guardar: Bool
            switch versao {
            case .nunca: guardar = false
            case .sempre: guardar = true
            case .aCada(let s): guardar = ultimaVersao[destino.path].map { Date().timeIntervalSince($0) > s } ?? true
            }
            if case .nunca = versao {} else if encolheu { guardar = true }
            if guardar {
                let pasta = destino.deletingLastPathComponent().appendingPathComponent(".versoes", isDirectory: true)
                try fm.createDirectory(at: pasta, withIntermediateDirectories: true)
                let ext = destino.pathExtension.isEmpty ? "" : "." + destino.pathExtension
                let nome = destino.deletingPathExtension().lastPathComponent + " " + Self.carimbo() + ext
                try antigo.write(to: pasta.appendingPathComponent(nome), options: .atomic)
                ultimaVersao[destino.path] = Date()
            }
        }
        try dados.write(to: destino, options: .atomic)
    }

    /// Copia para o disco tudo o que ficou guardado no Mac enquanto o KEIROS estava fora.
    @discardableResult
    func esvaziarEspera() -> Int {
        guard conectado, let raiz, fm.fileExists(atPath: espera.path),
              let subs = try? fm.subpathsOfDirectory(atPath: espera.path) else { return 0 }
        var n = 0
        for rel in subs.sorted() {
            var pasta: ObjCBool = false
            let origem = espera.appendingPathComponent(rel)
            guard fm.fileExists(atPath: origem.path, isDirectory: &pasta), !pasta.boolValue,
                  !rel.split(separator: "/").contains(where: { $0.hasPrefix(".") }),
                  let destino = Self.dentro(raiz, resolverNoDisco(rel)),
                  let dados = try? Data(contentsOf: origem) else { continue }
            do {
                if rel == "progresso/progresso.json" { try backupDoDia(raiz) }
                try gravarAtomico(dados, destino, versao: .sempre)
                try fm.removeItem(at: origem)
                n += 1
            } catch { continue }
        }
        return n
    }

    static func carimbo() -> String {
        let f = DateFormatter()
        f.locale = Locale(identifier: "en_US_POSIX")
        f.dateFormat = "yyyy-MM-dd HH-mm-ss"
        return f.string(from: Date())
    }

    static func dia() -> String {
        let f = DateFormatter()
        f.locale = Locale(identifier: "en_US_POSIX")
        f.dateFormat = "yyyy-MM-dd"
        return f.string(from: Date())
    }

    // MARK: - progresso

    private let relProgresso = "progresso/progresso.json"

    /// Antes da primeira gravação do dia, guarda o progresso atual em progresso/backups.
    /// Se o arquivo atual estiver ilegível, ele é guardado à parte em vez de sumir.
    private func backupDoDia(_ raiz: URL) throws {
        let atual = raiz.appendingPathComponent(relProgresso)
        guard let antigo = try? Data(contentsOf: atual), !antigo.isEmpty else { return }
        if (try? JSONSerialization.jsonObject(with: antigo)) == nil {
            try antigo.write(to: raiz.appendingPathComponent("progresso/progresso-ilegivel \(Self.carimbo()).json"), options: .atomic)
            return
        }
        let copia = raiz.appendingPathComponent("progresso/backups/progresso \(Self.dia()).json")
        if !fm.fileExists(atPath: copia.path) {
            try fm.createDirectory(at: copia.deletingLastPathComponent(), withIntermediateDirectories: true)
            try antigo.write(to: copia, options: .atomic)
        }
    }

    func carregarProgresso() -> (json: String?, onde: Onde) {
        if conectado {
            esvaziarEspera()
            let d = ler(relProgresso)
            if let d { espelhar(d, "progresso.json") }
            return (d.flatMap { String(data: $0, encoding: .utf8) }, .keiros)
        }
        let d = ler(relProgresso) ?? lerEspelho("progresso.json")
        return (d.flatMap { String(data: $0, encoding: .utf8) }, .espera)
    }

    func salvarProgresso(_ json: String) throws -> Onde {
        let dados = Data(json.utf8)
        guard (try? JSONSerialization.jsonObject(with: dados)) is [String: Any] else { throw Erro.json }
        if conectado, let raiz { try backupDoDia(raiz) }
        let onde = try gravar(dados, em: relProgresso, versao: .nunca)
        espelhar(dados, "progresso.json")
        return onde
    }

    // MARK: - notas de cada assunto (notas.md na pasta do assunto)

    func lerNota(id: String, titulo: String) -> String? {
        let rel = pastaDoAssunto(id, titulo) + "/notas.md"
        if let e = Self.dentro(espera, rel), let d = try? Data(contentsOf: e) { return String(data: d, encoding: .utf8) }
        if conectado {
            guard let d = ler(rel) else { return nil }
            espelhar(d, "notas/\(id).md")
            return String(data: d, encoding: .utf8)
        }
        return lerEspelho("notas/\(id).md").flatMap { String(data: $0, encoding: .utf8) }
    }

    func salvarNota(id: String, titulo: String, texto: String) throws -> Onde {
        let dados = Data(texto.utf8)
        let onde = try gravar(dados, em: pastaDoAssunto(id, titulo) + "/notas.md", versao: .aCada(600))
        espelhar(dados, "notas/\(id).md")
        return onde
    }

    /// Todas as notas, para exportar: { "M01": "texto…" }.
    func lerNotas() -> [String: String] {
        var notas: [String: String] = [:]
        func varrer(_ base: URL) {
            let assuntos = base.appendingPathComponent("assuntos")
            guard let nomes = try? fm.contentsOfDirectory(atPath: assuntos.path) else { return }
            for n in nomes where !n.hasPrefix(".") {
                let u = assuntos.appendingPathComponent(n).appendingPathComponent("notas.md")
                if let d = try? Data(contentsOf: u), let t = String(data: d, encoding: .utf8), !t.isEmpty {
                    notas[Self.idDaPasta(n)] = t
                }
            }
        }
        if conectado, let raiz { varrer(raiz) }
        else if let nomes = try? fm.contentsOfDirectory(atPath: espelho.appendingPathComponent("notas").path) {
            for n in nomes where n.hasSuffix(".md") {
                if let d = lerEspelho("notas/" + n), let t = String(data: d, encoding: .utf8), !t.isEmpty {
                    notas[String(n.dropLast(3))] = t
                }
            }
        }
        varrer(espera)
        return notas
    }

    /// Cria (se preciso) e devolve a pasta de um assunto no disco.
    func criarPastaDoAssunto(id: String, titulo: String) throws -> URL {
        guard conectado, let raiz else { throw Erro.desconectado }
        guard let u = Self.dentro(raiz, pastaDoAssunto(id, titulo)) else { throw Erro.caminho(id) }
        try fm.createDirectory(at: u, withIntermediateDirectories: true)
        return u
    }

    // MARK: - mapa

    /// O mapa vem do disco; o Mac guarda um espelho para abrir sem o KEIROS.
    func lerMapa(_ relativo: String) -> Data? {
        guard relativo.hasPrefix("mapa/") else { return nil }
        if conectado, let raiz, let u = Self.dentro(raiz, relativo), let d = try? Data(contentsOf: u) {
            espelhar(d, relativo)
            return d
        }
        return lerEspelho(relativo)
    }
}
