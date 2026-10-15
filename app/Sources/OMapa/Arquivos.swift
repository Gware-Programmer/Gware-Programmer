import Foundation

/// Onde as coisas ficam: a pasta Nous Keiros (no disco KEIROS) e o apoio no Mac.
///
/// Regras para nada se perder:
/// - toda gravação é atômica (escreve num temporário e troca) e nunca passa por cima
///   de um arquivo que existe mas não pôde ser lido;
/// - o que seria sobrescrito vai antes para `.versoes/`, na mesma pasta;
/// - o progresso ganha uma cópia por dia em `progresso/backups/`;
/// - se o progresso no disco mudou por fora (outro Mac, outra cópia), as marcações
///   são juntadas em vez de sobrescritas;
/// - com o KEIROS desconectado (ou recusando escrita), grava-se no Mac (`espera/`) e
///   tudo é copiado para o disco quando ele volta; uma cópia na espera é sempre a mais nova;
/// - o Mac guarda um espelho do que veio do disco (mapa, progresso, notas), para o app
///   abrir sem o disco e para restaurar o que sumir da pasta;
/// - espera e espelho são separados por pasta Nous Keiros (`apoio/raizes/<chave>`).
final class Arquivos {
    enum Onde: String { case keiros, espera }
    enum Versao { case nunca, sempre, aCada(TimeInterval) }

    enum Erro: LocalizedError {
        case caminho(String), pedido(String), desconectado, json, ilegivel(String), pastaTrocada
        var errorDescription: String? {
            switch self {
            case .caminho(let c): return "caminho recusado: \(c)"
            case .pedido(let p): return "pedido incompleto: falta \(p)"
            case .desconectado: return "o disco KEIROS não está conectado"
            case .json: return "o progresso recebido não é um JSON válido"
            case .ilegivel(let a): return "não consegui ler \(a) (o arquivo existe, mas não abriu)"
            case .pastaTrocada: return "a pasta Nous Keiros foi trocada; recarregue a página"
            }
        }
    }

    /// Resultado de uma leitura: o texto, de onde veio e a impressão do conteúdo.
    struct Leitura {
        var texto: String?
        var onde: Onde
        var versao: String?
        var restaurado = false
    }

    /// Resultado de uma gravação. `json` só vem quando o progresso foi juntado com o do disco.
    struct Gravacao {
        var onde: Onde
        var versao: String
        var json: String? = nil
        var conflito = false
        var aviso: String? = nil
    }

    static let chavePasta = "pastaNousKeiros"
    static let padrao = URL(fileURLWithPath: "/Volumes/KEIROS/Nous Keiros", isDirectory: true)

    private let fm = FileManager.default
    private(set) var raiz: URL?
    let apoio: URL
    /// Último erro de escrita com o disco conectado (a gravação foi para a espera).
    private(set) var erroNoDisco: String?
    private var ultimaVersao: [String: Date] = [:]
    private var pastasConhecidas: [String: String] = [:]

    /// Área de apoio desta pasta Nous Keiros, no Mac.
    var pastaDaRaiz: URL {
        apoio.appendingPathComponent("raizes", isDirectory: true)
            .appendingPathComponent(raiz.map(Self.chave) ?? "_sem-pasta", isDirectory: true)
    }
    var espera: URL { pastaDaRaiz.appendingPathComponent("espera", isDirectory: true) }
    var espelho: URL { pastaDaRaiz.appendingPathComponent("espelho", isDirectory: true) }

    /// `apoio` só muda nos testes; no app é ~/Library/Application Support/O MAPA.
    init(apoio outroApoio: URL? = nil) {
        let base = (try? fm.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true))
            ?? URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("Library/Application Support", isDirectory: true)
        apoio = outroApoio ?? base.appendingPathComponent("O MAPA", isDirectory: true)
        try? fm.createDirectory(at: apoio, withIntermediateDirectories: true)
        if let p = UserDefaults.standard.string(forKey: Self.chavePasta) {
            raiz = URL(fileURLWithPath: p, isDirectory: true)
        } else if Self.ehNousKeiros(Self.padrao) {
            raiz = Self.padrao
            UserDefaults.standard.set(Self.padrao.path, forKey: Self.chavePasta)
        }
        if raiz != nil { migrarApoioAntigo() }
        carregarPastas()
    }

    static func ehNousKeiros(_ url: URL) -> Bool {
        FileManager.default.fileExists(atPath: url.appendingPathComponent("mapa/mapa.json").path)
    }

    /// O disco está montado e a pasta tem o mapa.
    var conectado: Bool { raiz.map(Self.ehNousKeiros) ?? false }

    func definirRaiz(_ url: URL) {
        if raiz?.standardizedFileURL.path == url.standardizedFileURL.path { return }
        raiz = url
        UserDefaults.standard.set(url.path, forKey: Self.chavePasta)
        migrarApoioAntigo()
        carregarPastas()
        erroNoDisco = nil
    }

    /// Recusa gravações que vêm de uma página aberta para outra pasta (depois de uma troca).
    func conferirRaiz(_ token: String?) throws {
        if let token, token != raiz?.path { throw Erro.pastaTrocada }
    }

    // MARK: - impressão (FNV-1a 64 bits) e chaves

    static func impressao(_ d: Data) -> String {
        var h: UInt64 = 0xcbf29ce484222325
        for b in d {
            h ^= UInt64(b)
            h = h &* 0x100000001b3
        }
        return String(format: "%016llx", h) + "-\(d.count)"
    }

    static func chave(_ raiz: URL) -> String {
        let caminho = raiz.standardizedFileURL.path
        return raiz.lastPathComponent + " " + String(impressao(Data(caminho.utf8)).prefix(8))
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

    static func idDaPasta(_ nome: String) -> String {
        nome.components(separatedBy: " — ").first ?? nome
    }

    /// Uma só regra para escolher a pasta de um assunto quando há mais de uma com o mesmo ID:
    /// entre as candidatas, as que já têm notas.md; dentre essas, a preferida, senão a primeira em ordem.
    private func escolherPasta(id: String, preferida: String?, base: URL) -> String? {
        guard let nomes = try? fm.contentsOfDirectory(atPath: base.path) else { return nil }
        var candidatas = nomes.filter { !$0.hasPrefix(".") && Self.idDaPasta($0) == id }.sorted()
        if candidatas.count >= 2 {
            let comNotas = candidatas.filter {
                fm.fileExists(atPath: base.appendingPathComponent($0).appendingPathComponent("notas.md").path)
            }
            if !comNotas.isEmpty { candidatas = comNotas }
        }
        if let preferida, candidatas.contains(preferida) { return preferida }
        return candidatas.first
    }

    private func carregarPastas() {
        pastasConhecidas = [:]
        if let d = try? Data(contentsOf: espelho.appendingPathComponent("pastas.json")),
           let m = (try? JSONSerialization.jsonObject(with: d)) as? [String: String] {
            pastasConhecidas = m
        }
    }

    private func guardarPastas() {
        if let d = try? JSONSerialization.data(withJSONObject: pastasConhecidas, options: [.prettyPrinted, .sortedKeys]) {
            try? gravarAtomico(d, espelho.appendingPathComponent("pastas.json"), versao: .nunca)
        }
    }

    /// Caminho relativo da pasta de um assunto ("assuntos/M01 — Arithmetic…").
    func pastaDoAssunto(_ id: String, _ titulo: String) -> String {
        let exato = Self.nomePasta(id, titulo)
        if conectado, let raiz {
            let base = raiz.appendingPathComponent("assuntos", isDirectory: true)
            if let escolhida = escolherPasta(id: id, preferida: exato, base: base) {
                if pastasConhecidas[id] != escolhida {
                    pastasConhecidas[id] = escolhida
                    guardarPastas()
                }
                return "assuntos/" + escolhida
            }
            return "assuntos/" + exato
        }
        return "assuntos/" + (pastasConhecidas[id] ?? exato)
    }

    /// Na espera, a pasta do assunto pode ter outro nome; no disco vale a regra de escolha.
    private func resolverNoDisco(_ relativo: String) -> String {
        var partes = relativo.split(separator: "/").map(String.init)
        guard partes.count >= 2, partes[0] == "assuntos", let raiz else { return relativo }
        let base = raiz.appendingPathComponent("assuntos", isDirectory: true)
        partes[1] = escolherPasta(id: Self.idDaPasta(partes[1]), preferida: partes[1], base: base) ?? partes[1]
        return partes.joined(separator: "/")
    }

    /// Onde fica, no espelho, a cópia de um arquivo do disco.
    private func relEspelho(_ relativo: String) -> String? {
        if relativo == relProgresso { return "progresso.json" }
        let partes = relativo.split(separator: "/").map(String.init)
        if partes.count == 3, partes[0] == "assuntos", partes[2] == "notas.md" {
            return "notas/\(Self.idDaPasta(partes[1])).md"
        }
        if partes.first == "mapa" { return relativo }
        return nil
    }

    // MARK: - leitura

    /// Lê um arquivo. Devolve nil se ele não existe; dá erro se existe mas não abre.
    func lerSeExistir(_ u: URL) throws -> Data? {
        do {
            return try Data(contentsOf: u)
        } catch {
            if !fm.fileExists(atPath: u.path) { return nil }
            throw Erro.ilegivel(u.lastPathComponent)
        }
    }

    private func texto(_ d: Data, _ nome: String) throws -> String {
        guard let t = String(data: d, encoding: .utf8) else { throw Erro.ilegivel(nome) }
        return t
    }

    func lerEspelho(_ relativo: String) -> Data? {
        Self.dentro(espelho, relativo).flatMap { try? Data(contentsOf: $0) }
    }

    func espelhar(_ dados: Data, _ relativo: String) {
        if let u = Self.dentro(espelho, relativo) { try? gravarAtomico(dados, u, versao: .nunca) }
    }

    // MARK: - gravação

    /// Grava no disco (ou, se não der, na espera do Mac). `preparar` recebe o conteúdo atual
    /// do disco e decide o que gravar e com que regra de versão (usado para juntar progresso).
    private func gravarComFila(_ dados: Data, em relativo: String, versao: Versao,
                               preparar: ((Data?) throws -> (Data, Versao))? = nil) throws -> (onde: Onde, gravado: Data) {
        if conectado, let raiz {
            esvaziarEspera()
            guard let destino = Self.dentro(raiz, relativo) else { throw Erro.caminho(relativo) }
            do {
                let atual = try lerSeExistir(destino)
                var final = dados
                var regra = versao
                if let preparar { (final, regra) = try preparar(atual) }
                try gravarAtomico(final, destino, versao: regra, atual: atual)
                if let e = Self.dentro(espera, relativo) { try? fm.removeItem(at: e) }
                if let r = relEspelho(relativo) { espelhar(final, r) }
                erroNoDisco = nil
                return (.keiros, final)
            } catch {
                erroNoDisco = error.localizedDescription
            }
        }
        guard let destino = Self.dentro(espera, relativo) else { throw Erro.caminho(relativo) }
        try gravarAtomico(dados, destino, versao: .nunca)
        return (.espera, dados)
    }

    func gravarAtomico(_ dados: Data, _ destino: URL, versao: Versao) throws {
        try gravarAtomico(dados, destino, versao: versao, atual: try lerSeExistir(destino))
    }

    private func gravarAtomico(_ dados: Data, _ destino: URL, versao: Versao, atual: Data?) throws {
        try fm.createDirectory(at: destino.deletingLastPathComponent(), withIntermediateDirectories: true)
        if let antigo = atual, !antigo.isEmpty, antigo != dados {
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
                var nome = destino.deletingPathExtension().lastPathComponent + " " + Self.carimbo() + ext
                var n = 2
                while fm.fileExists(atPath: pasta.appendingPathComponent(nome).path) {
                    nome = destino.deletingPathExtension().lastPathComponent + " " + Self.carimbo() + " (\(n))" + ext
                    n += 1
                }
                try antigo.write(to: pasta.appendingPathComponent(nome), options: .atomic)
                ultimaVersao[destino.path] = Date()
            }
        }
        try dados.write(to: destino, options: .atomic)
    }

    /// Copia para o disco tudo o que ficou guardado no Mac enquanto o KEIROS estava fora.
    /// O progresso é juntado com o do disco se este mudou por fora desde a última leitura.
    @discardableResult
    func esvaziarEspera() -> Int {
        guard conectado, let raiz, fm.fileExists(atPath: espera.path),
              let subs = try? fm.subpathsOfDirectory(atPath: espera.path) else { return 0 }
        var n = 0
        for rel in subs.sorted() {
            var pasta: ObjCBool = false
            let origem = espera.appendingPathComponent(rel)
            guard fm.fileExists(atPath: origem.path, isDirectory: &pasta), !pasta.boolValue,
                  !rel.split(separator: "/").contains(where: { $0.hasPrefix(".") }) else { continue }
            let relDisco = resolverNoDisco(rel)
            guard let destino = Self.dentro(raiz, relDisco), let dados = try? Data(contentsOf: origem) else { continue }
            do {
                let atual = try lerSeExistir(destino)
                var final = dados
                if relDisco == relProgresso {
                    if let atual, atual != dados, Self.progressoValido(atual),
                       atual != lerEspelho("progresso.json"),
                       let j = Self.juntarProgresso(dados, com: atual), j.mudou {
                        final = j.dados
                    }
                    try backupDoDia(raiz, atual: atual)
                }
                try gravarAtomico(final, destino, versao: .sempre, atual: atual)
                try fm.removeItem(at: origem)
                if let r = relEspelho(relDisco) { espelhar(final, r) }
                n += 1
            } catch { continue }
        }
        return n
    }

    /// Quantos arquivos esperam no Mac para ir ao disco.
    func arquivosNaEspera() -> Int {
        guard let subs = try? fm.subpathsOfDirectory(atPath: espera.path) else { return 0 }
        return subs.filter { rel in
            var pasta: ObjCBool = false
            return !rel.split(separator: "/").contains(where: { $0.hasPrefix(".") })
                && fm.fileExists(atPath: espera.appendingPathComponent(rel).path, isDirectory: &pasta) && !pasta.boolValue
        }.count
    }

    /// Versões antigas (antes das áreas por pasta) da espera e do espelho vão para a área da pasta atual.
    /// Nada é apagado: se a área nova já tiver conteúdo, a antiga é guardada à parte.
    private func migrarApoioAntigo() {
        for nome in ["espera", "espelho"] {
            let antiga = apoio.appendingPathComponent(nome, isDirectory: true)
            guard fm.fileExists(atPath: antiga.path) else { continue }
            let nova = pastaDaRaiz.appendingPathComponent(nome, isDirectory: true)
            let vazia = ((try? fm.contentsOfDirectory(atPath: nova.path)) ?? []).filter { !$0.hasPrefix(".") }.isEmpty
            do {
                try fm.createDirectory(at: pastaDaRaiz, withIntermediateDirectories: true)
                if vazia {
                    if fm.fileExists(atPath: nova.path) { try fm.removeItem(at: nova) }
                    try fm.moveItem(at: antiga, to: nova)
                } else {
                    try fm.moveItem(at: antiga, to: apoio.appendingPathComponent("\(nome) antiga \(Self.carimbo())", isDirectory: true))
                }
            } catch { continue }
        }
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

    /// O progresso é um objeto JSON com "s" (assuntos) e "L" (bosses de nível) como objetos.
    static func progressoValido(_ d: Data) -> Bool {
        guard let o = (try? JSONSerialization.jsonObject(with: d)) as? [String: Any] else { return false }
        return o["s"] is [String: Any] && o["L"] is [String: Any]
    }

    private static func numero(_ x: Any?) -> Int64 {
        if let n = x as? NSNumber { return n.int64Value }
        if let b = x as? Bool { return b ? 1 : 0 }
        if let i = x as? Int { return Int64(i) }
        if let d = x as? Double, d.isFinite { return Int64(d) }
        return 0
    }

    /// Junta dois progressos sem perder marcação: em cada assunto, boss e itens ficam com o maior
    /// valor dos dois; bosses de nível também; "at" fica com o mais recente.
    /// `mudou` diz se `outro` acrescentou alguma marcação a `meu`. Nil se algum dos dois não é válido.
    static func juntarProgresso(_ meu: Data, com outro: Data) -> (dados: Data, mudou: Bool)? {
        guard progressoValido(meu), progressoValido(outro),
              var a = (try? JSONSerialization.jsonObject(with: meu)) as? [String: Any],
              let b = (try? JSONSerialization.jsonObject(with: outro)) as? [String: Any],
              var sa = a["s"] as? [String: Any], let sb = b["s"] as? [String: Any],
              var la = a["L"] as? [String: Any], let lb = b["L"] as? [String: Any] else { return nil }
        var mudou = false
        for (id, vb) in sb {
            guard let eb = vb as? [String: Any] else { continue }
            var ea = (sa[id] as? [String: Any]) ?? [:]
            let bA = numero(ea["b"]), bB = numero(eb["b"])
            let cA = (ea["c"] as? [Any])?.map { numero($0) } ?? []
            let cB = (eb["c"] as? [Any])?.map { numero($0) } ?? []
            var c: [Int64] = []
            for i in 0..<max(cA.count, cB.count) {
                let x = i < cA.count ? cA[i] : 0, y = i < cB.count ? cB[i] : 0
                if y > x { mudou = true }
                c.append(max(x, y))
            }
            if bB > bA { mudou = true }
            ea["b"] = max(bA, bB)
            ea["c"] = c
            sa[id] = ea
        }
        for (k, v) in lb {
            let x = numero(la[k]), y = numero(v)
            if y > x { mudou = true }
            la[k] = max(x, y)
        }
        a["s"] = sa
        a["L"] = la
        a["at"] = max(numero(a["at"]), numero(b["at"]))
        guard let dados = try? JSONSerialization.data(withJSONObject: a, options: [.sortedKeys]) else { return nil }
        return (dados, mudou)
    }

    /// Antes da primeira gravação do dia, guarda o progresso atual em progresso/backups.
    /// Se o arquivo atual não for um progresso válido, ele é guardado à parte em vez de sumir.
    private func backupDoDia(_ raiz: URL, atual: Data?) throws {
        guard let antigo = atual, !antigo.isEmpty else { return }
        if !Self.progressoValido(antigo) {
            try antigo.write(to: raiz.appendingPathComponent("progresso/progresso-ilegivel \(Self.carimbo()).json"), options: .atomic)
            return
        }
        let copia = raiz.appendingPathComponent("progresso/backups/progresso \(Self.dia()).json")
        if !fm.fileExists(atPath: copia.path) {
            try fm.createDirectory(at: copia.deletingLastPathComponent(), withIntermediateDirectories: true)
            try antigo.write(to: copia, options: .atomic)
        }
    }

    func carregarProgresso() throws -> Leitura {
        if conectado, let raiz {
            esvaziarEspera()
            if let e = Self.dentro(espera, relProgresso), let d = try lerSeExistir(e) {
                return Leitura(texto: try texto(d, "progresso.json"), onde: .espera, versao: Self.impressao(d))
            }
            let u = raiz.appendingPathComponent(relProgresso)
            if let d = try lerSeExistir(u) {
                espelhar(d, "progresso.json")
                return Leitura(texto: try texto(d, "progresso.json"), onde: .keiros, versao: Self.impressao(d))
            }
            if let m = lerEspelho("progresso.json"), Self.progressoValido(m) {
                try? gravarAtomico(m, u, versao: .nunca)
                return Leitura(texto: try texto(m, "progresso.json"), onde: .keiros, versao: Self.impressao(m), restaurado: true)
            }
            return Leitura(texto: nil, onde: .keiros, versao: nil)
        }
        var d: Data? = nil
        if let e = Self.dentro(espera, relProgresso) { d = try lerSeExistir(e) }
        if d == nil { d = lerEspelho("progresso.json") }
        return Leitura(texto: try d.map { try texto($0, "progresso.json") }, onde: .espera, versao: d.map(Self.impressao))
    }

    /// Grava o progresso. `versao` é a impressão do último progresso que a página leu ou gravou:
    /// se o disco tiver outra coisa, alguém mudou por fora e as marcações são juntadas.
    func salvarProgresso(_ json: String, versao base: String? = nil, versionar: Bool = false) throws -> Gravacao {
        let meu = Data(json.utf8)
        guard Self.progressoValido(meu) else { throw Erro.json }
        let baseEfetiva = base ?? lerEspelho("progresso.json").map(Self.impressao)
        var juntou = false
        let r = try gravarComFila(meu, em: relProgresso, versao: .aCada(3600)) { [self] atual in
            var final = meu
            var forcar = versionar
            if let atual, atual != meu, Self.impressao(atual) != baseEfetiva {
                forcar = true
                if let j = Self.juntarProgresso(meu, com: atual), j.mudou {
                    final = j.dados
                    juntou = true
                }
            }
            if let raiz { try backupDoDia(raiz, atual: atual) }
            return (final, forcar ? .sempre : .aCada(3600))
        }
        return Gravacao(onde: r.onde, versao: Self.impressao(r.gravado),
                        json: juntou ? String(decoding: r.gravado, as: UTF8.self) : nil,
                        aviso: r.onde == .espera && conectado ? erroNoDisco : nil)
    }

    /// Verdadeiro se o progresso no disco não é o último que o app leu ou gravou.
    func progressoMudouFora() -> Bool {
        guard conectado, let raiz else { return false }
        do {
            let d = try lerSeExistir(raiz.appendingPathComponent(relProgresso))
            return d != lerEspelho("progresso.json") && d != nil
        } catch {
            return true
        }
    }

    // MARK: - notas de cada assunto (notas.md na pasta do assunto)

    func lerNota(id: String, titulo: String) throws -> Leitura {
        let rel = pastaDoAssunto(id, titulo) + "/notas.md"
        if let e = Self.dentro(espera, rel), let d = try lerSeExistir(e) {
            return Leitura(texto: try texto(d, "notas.md"), onde: .espera, versao: Self.impressao(d))
        }
        if conectado, let raiz, let u = Self.dentro(raiz, rel) {
            if let d = try lerSeExistir(u) {
                espelhar(d, "notas/\(id).md")
                return Leitura(texto: try texto(d, "notas.md"), onde: .keiros, versao: Self.impressao(d))
            }
            if let m = lerEspelho("notas/\(id).md"), !m.isEmpty {
                try? gravarAtomico(m, u, versao: .nunca)
                return Leitura(texto: try texto(m, "notas.md"), onde: .keiros, versao: Self.impressao(m), restaurado: true)
            }
            return Leitura(texto: "", onde: .keiros, versao: Self.impressao(Data()))
        }
        let m = lerEspelho("notas/\(id).md") ?? Data()
        return Leitura(texto: try texto(m, "notas.md"), onde: .espera, versao: Self.impressao(m))
    }

    /// Grava a nota. Se o notas.md do disco mudou por fora desde a última leitura da página,
    /// a versão do disco é sempre guardada em .versoes antes (`conflito`).
    func salvarNota(id: String, titulo: String, texto: String, versao base: String? = nil) throws -> Gravacao {
        let dados = Data(texto.utf8)
        let baseEfetiva = base ?? lerEspelho("notas/\(id).md").map(Self.impressao)
        var conflito = false
        let r = try gravarComFila(dados, em: pastaDoAssunto(id, titulo) + "/notas.md", versao: .aCada(600)) { atual in
            if let atual, !atual.isEmpty, atual != dados, Self.impressao(atual) != baseEfetiva {
                conflito = true
                return (dados, .sempre)
            }
            return (dados, .aCada(600))
        }
        return Gravacao(onde: r.onde, versao: Self.impressao(r.gravado), conflito: conflito,
                        aviso: r.onde == .espera && conectado ? erroNoDisco : nil)
    }

    /// Todas as notas, para exportar: { "M01": "texto…" }.
    func lerNotas() -> [String: String] {
        var notas: [String: String] = [:]
        if conectado, let raiz {
            let base = raiz.appendingPathComponent("assuntos", isDirectory: true)
            let nomes = ((try? fm.contentsOfDirectory(atPath: base.path)) ?? []).filter { !$0.hasPrefix(".") }
            for id in Set(nomes.map(Self.idDaPasta)) {
                guard let pasta = escolherPasta(id: id, preferida: pastasConhecidas[id], base: base),
                      let d = try? Data(contentsOf: base.appendingPathComponent(pasta).appendingPathComponent("notas.md")),
                      let t = String(data: d, encoding: .utf8), !t.isEmpty else { continue }
                notas[id] = t
            }
        } else if let nomes = try? fm.contentsOfDirectory(atPath: espelho.appendingPathComponent("notas").path) {
            for n in nomes where n.hasSuffix(".md") {
                if let d = lerEspelho("notas/" + n), let t = String(data: d, encoding: .utf8), !t.isEmpty {
                    notas[String(n.dropLast(3))] = t
                }
            }
        }
        let filaAssuntos = espera.appendingPathComponent("assuntos", isDirectory: true)
        for n in ((try? fm.contentsOfDirectory(atPath: filaAssuntos.path)) ?? []) where !n.hasPrefix(".") {
            if let d = try? Data(contentsOf: filaAssuntos.appendingPathComponent(n).appendingPathComponent("notas.md")),
               let t = String(data: d, encoding: .utf8) {
                notas[Self.idDaPasta(n)] = t
            }
        }
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
