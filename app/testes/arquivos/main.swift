// Testa a camada de arquivos (Arquivos.swift) e o contrato da ponte (Despacho.swift) sem tocar nos dados reais.
// Uso, na pasta do repositório:
//   swiftc -o /tmp/teste-arquivos app/testes/arquivos/main.swift app/Sources/OMapa/Arquivos.swift app/Sources/OMapa/Despacho.swift
//   /tmp/teste-arquivos "Nous Keiros" /tmp/area-de-teste
import Foundation

var falhas = 0
func ok(_ c: Bool, _ m: String) { print((c ? "ok    " : "FALHA ") + m); if !c { falhas += 1 } }
let fm = FileManager.default
let args = CommandLine.arguments
let nousOrig = URL(fileURLWithPath: args[1], isDirectory: true)
let tmp = URL(fileURLWithPath: args[2], isDirectory: true)
try? fm.removeItem(at: tmp)
try! fm.createDirectory(at: tmp, withIntermediateDirectories: true)

// ── ajudantes ──
func lerJSON(_ u: URL) -> [String: Any]? {
    (try? Data(contentsOf: u)).flatMap { (try? JSONSerialization.jsonObject(with: $0)) as? [String: Any] }
}
func lerJSON(_ s: String) -> [String: Any] { (try! JSONSerialization.jsonObject(with: Data(s.utf8))) as! [String: Any] }
func texto(_ o: [String: Any]) -> String { String(decoding: try! JSONSerialization.data(withJSONObject: o, options: [.sortedKeys]), as: UTF8.self) }
func n(_ x: Any?) -> Int {
    if let v = x as? NSNumber { return v.intValue }
    if let b = x as? Bool { return b ? 1 : 0 }
    if let i = x as? Int { return i }
    return 0
}
func marca(_ o: [String: Any]?, _ id: String) -> (b: Int, c: [Int])? {
    guard let s = o?["s"] as? [String: Any], let e = s[id] as? [String: Any] else { return nil }
    return (n(e["b"]), ((e["c"] as? [Any]) ?? []).map(n))
}
func versoes(_ pasta: URL) -> [URL] {
    let v = pasta.appendingPathComponent(".versoes")
    return ((try? fm.contentsOfDirectory(atPath: v.path)) ?? []).sorted().map { v.appendingPathComponent($0) }
}
func algumaVersaoCom(_ pasta: URL, _ conteudo: String) -> Bool {
    versoes(pasta).contains { (try? String(contentsOf: $0, encoding: .utf8)) == conteudo }
}

// cópia mínima do Nous Keiros: mapa e pastas dos assuntos
let disco = tmp.appendingPathComponent("KEIROS", isDirectory: true)
let fora = tmp.appendingPathComponent("KEIROS-fora", isDirectory: true)
let raiz = disco.appendingPathComponent("Nous Keiros", isDirectory: true)
let raizFora = fora.appendingPathComponent("Nous Keiros", isDirectory: true)
try! fm.createDirectory(at: raiz.appendingPathComponent("mapa"), withIntermediateDirectories: true)
try! fm.copyItem(at: nousOrig.appendingPathComponent("mapa/mapa.json"), to: raiz.appendingPathComponent("mapa/mapa.json"))
let nomes = try! fm.contentsOfDirectory(atPath: nousOrig.appendingPathComponent("assuntos").path).filter { !$0.hasPrefix(".") }
for n in nomes { try! fm.createDirectory(at: raiz.appendingPathComponent("assuntos").appendingPathComponent(n), withIntermediateDirectories: true) }
func desconectar() { try! fm.moveItem(at: disco, to: fora) }
func reconectar() { try! fm.moveItem(at: fora, to: disco) }
let progURL = raiz.appendingPathComponent("progresso/progresso.json")
let pastaProg = raiz.appendingPathComponent("progresso")

// 1. nome da pasta igual ao do gerar.py
let mapa = try! JSONSerialization.jsonObject(with: Data(contentsOf: raiz.appendingPathComponent("mapa/mapa.json"))) as! [String: Any]
let subs = mapa["subjects"] as! [String: [String: Any]]
func titulo(_ id: String) -> String { subs[id]!["t"] as! String }
func pastaAssunto(_ id: String) -> URL { raiz.appendingPathComponent("assuntos").appendingPathComponent(Arquivos.nomePasta(id, titulo(id))) }
let reais = Set(nomes)
let diferentes = subs.filter { !reais.contains(Arquivos.nomePasta($0.key, $0.value["t"] as! String)) }.map { $0.key }
ok(diferentes.isEmpty && subs.count == 203, "nomePasta igual ao gerar.py nos \(subs.count) assuntos \(diferentes.sorted().prefix(5))")

// 2. caminhos seguros
ok(Arquivos.dentro(raiz, "../fora") == nil && Arquivos.dentro(raiz, "a/../../b") == nil && Arquivos.dentro(raiz, "./x") == nil, "recusa caminhos que saem da pasta")
ok(Arquivos.dentro(raiz, "progresso/progresso.json") != nil, "aceita caminho normal")

let apoio = tmp.appendingPathComponent("apoio", isDirectory: true)
let A = Arquivos(apoio: apoio)
A.definirRaiz(raiz)
ok(A.conectado, "conectado com mapa/mapa.json")
ok(A.espera.path.contains("/raizes/"), "a fila no Mac fica na área desta pasta (\(A.espera.lastPathComponent))")
ok(A.lerMapa("mapa/mapa.json") != nil && A.lerMapa("../etc/passwd") == nil && A.lerMapa("progresso/x") == nil, "serve só o mapa")

// 3. progresso
let p1 = #"{"v":1,"s":{"M01":{"b":1,"c":[1,0]}},"L":{},"at":1}"#
let p2 = #"{"v":1,"s":{"M01":{"b":1,"c":[1,1]}},"L":{},"at":2}"#
let g1 = try? A.salvarProgresso(p1)
ok(g1?.onde == .keiros && g1?.json == nil, "salva progresso no KEIROS")
ok((try? A.salvarProgresso("isto não é json")) == nil, "recusa progresso inválido")
ok((try? A.salvarProgresso("[]")) == nil, "recusa JSON que não é progresso")
_ = try? A.salvarProgresso(p2, versao: g1?.versao)
let backups = (try? fm.contentsOfDirectory(atPath: raiz.appendingPathComponent("progresso/backups").path)) ?? []
ok(backups.count == 1, "uma cópia do dia em progresso/backups \(backups)")
ok((try? A.carregarProgresso())?.texto == p2, "carrega o progresso mais novo")
ok((try? A.carregarProgresso())?.versao == Arquivos.impressao(Data(p2.utf8)), "carregar devolve a impressão do que leu")

// 4. notas na pasta do assunto, com versões
let pastaM01 = pastaAssunto("M01")
ok((try? A.salvarNota(id: "M01", titulo: titulo("M01"), texto: String(repeating: "nota longa ", count: 50)))?.onde == .keiros, "salva nota no KEIROS")
ok(fm.fileExists(atPath: pastaM01.appendingPathComponent("notas.md").path), "notas.md dentro da pasta do assunto")
_ = try? A.salvarNota(id: "M01", titulo: titulo("M01"), texto: String(repeating: "nota longa ", count: 51))
ok(versoes(pastaM01).count == 1, "primeira troca guarda uma versão")
_ = try? A.salvarNota(id: "M01", titulo: titulo("M01"), texto: String(repeating: "nota longa ", count: 52))
ok(versoes(pastaM01).count == 1, "não versiona de novo antes de 10 minutos")
_ = try? A.salvarNota(id: "M01", titulo: titulo("M01"), texto: "curta")
ok(versoes(pastaM01).count == 2, "texto que encolhe pela metade sempre guarda versão")
ok((try? A.lerNota(id: "M01", titulo: titulo("M01")))?.texto == "curta", "lê a nota")

// 5. KEIROS desconectado
desconectar()
ok(!A.conectado, "percebe o KEIROS desconectado")
ok(A.lerMapa("mapa/mapa.json") != nil, "abre o mapa pelo espelho no Mac")
let off = try? A.carregarProgresso()
ok(off?.texto == p2 && off?.onde == .espera, "carrega o progresso do espelho")
ok((try? A.lerNota(id: "M01", titulo: titulo("M01")))?.texto == "curta", "lê a nota do espelho")
let p3 = #"{"v":1,"s":{"M01":{"b":1,"c":[1,1]},"M02":{"b":1,"c":[]}},"L":{},"at":3}"#
ok((try? A.salvarProgresso(p3, versao: off?.versao))?.onde == .espera, "grava o progresso no Mac")
ok((try? A.salvarNota(id: "M02", titulo: titulo("M02"), texto: "escrita sem o disco"))?.onde == .espera, "grava nota no Mac")
ok((try? A.carregarProgresso())?.texto == p3, "a cópia na espera é a mais nova")
ok(A.lerEspelho("progresso.json") == Data(p2.utf8), "o espelho continua sendo o último conteúdo do disco")

// 6. KEIROS volta
reconectar()
ok(A.conectado, "percebe o KEIROS de volta")
ok(A.esvaziarEspera() == 2, "copia os 2 arquivos guardados no Mac")
ok((try? String(contentsOf: progURL, encoding: .utf8)) == p3, "progresso no disco atualizado (sem junção: o disco não mudou por fora)")
ok((try? String(contentsOf: pastaAssunto("M02").appendingPathComponent("notas.md"), encoding: .utf8)) == "escrita sem o disco", "nota escrita sem o disco foi para a pasta do assunto")
ok(A.arquivosNaEspera() == 0, "espera vazia depois de copiar")
ok(A.lerNotas()["M01"] == "curta" && A.lerNotas()["M02"] == "escrita sem o disco", "lerNotas junta todas as notas")
ok((try? A.criarPastaDoAssunto(id: "Z01", titulo: titulo("Z01")))?.lastPathComponent.hasPrefix("Z01 — ") == true, "abre a pasta existente do assunto")
ok(A.lerEspelho("progresso.json") == Data(p3.utf8), "espelho atualizado com o que foi ao disco")

// 7. impressão e junção
ok(Arquivos.impressao(Data()) == "cbf29ce484222325-0", "impressão FNV-1a do vazio")
ok(Arquivos.impressao(Data("a".utf8)) == "af63dc4c8601ec8c-1", "impressão FNV-1a de \"a\"")
let ja = Data(#"{"s":{"M01":{"b":0,"c":[1,0]},"X":5},"L":{"0":1},"at":5}"#.utf8)
let jb = Data(#"{"s":{"M01":{"b":1,"c":[0,0,1]},"M02":{"b":1,"c":[]}},"L":{"1":true},"at":7}"#.utf8)
if let j = Arquivos.juntarProgresso(ja, com: jb) {
    let o = (try! JSONSerialization.jsonObject(with: j.dados)) as! [String: Any]
    let L = o["L"] as! [String: Any]
    ok(marca(o, "M01")?.b == 1 && marca(o, "M01")?.c == [1, 0, 1], "junção: boss e itens ficam com o maior valor")
    ok(marca(o, "M02")?.b == 1 && n(L["0"]) == 1 && n(L["1"]) == 1 && n(o["at"]) == 7 && j.mudou, "junção: assuntos e bosses de nível dos dois, \"at\" mais recente")
    ok(n((o["s"] as! [String: Any])["X"]) == 5, "junção: entradas estranhas do meu lado ficam como estão")
} else { ok(false, "junção devolveu nil") }
ok(Arquivos.juntarProgresso(jb, com: jb)?.mudou == false, "junção com o mesmo conteúdo não muda nada")
ok(Arquivos.juntarProgresso(ja, com: Data("[]".utf8)) == nil, "junção com algo que não é progresso devolve nil")

// 8. outro Mac gravou no disco
let l0 = try! A.carregarProgresso()
let pA = #"{"v":1,"s":{"M01":{"b":1,"c":[1,1]},"M02":{"b":1,"c":[]}},"L":{},"at":10}"#
let gA = try! A.salvarProgresso(pA, versao: l0.versao)
ok(gA.json == nil && (try? String(contentsOf: progURL, encoding: .utf8)) == pA, "sem mudança por fora, grava exatamente o que a página mandou")
let pB = #"{"v":1,"s":{"M01":{"b":1,"c":[1,0]},"M03":{"b":1,"c":[]}},"L":{},"at":11}"#
try! Data(pB.utf8).write(to: progURL)
ok(A.progressoMudouFora(), "percebe que o progresso mudou por fora")
let pA2 = #"{"v":1,"s":{"M01":{"b":1,"c":[1,1]},"M02":{"b":1,"c":[]},"M04":{"b":1,"c":[]}},"L":{},"at":12}"#
let gA2 = try! A.salvarProgresso(pA2, versao: gA.versao)
let depois8 = lerJSON(progURL)
ok(gA2.json != nil, "com mudança por fora, junta e devolve o resultado")
ok(marca(depois8, "M03")?.b == 1 && marca(depois8, "M01")?.c == [1, 1] && marca(depois8, "M04")?.b == 1, "o disco tem as marcações dos dois Macs")
ok(algumaVersaoCom(pastaProg, pB), "a versão do outro Mac fica em .versoes")
ok(gA2.versao == Arquivos.impressao(try! Data(contentsOf: progURL)), "a nova ficha é a impressão do que foi gravado")
var semM04 = lerJSON(gA2.json!)
var s8 = semM04["s"] as! [String: Any]
s8["M04"] = ["b": 0, "c": [Int]()]
semM04["s"] = s8
let pA3 = texto(semM04)
let gA3 = try! A.salvarProgresso(pA3, versao: gA2.versao)
ok(gA3.json == nil && (try? String(contentsOf: progURL, encoding: .utf8)) == pA3, "desmarcar com a ficha em dia grava exatamente o desmarcado")
ok(!A.progressoMudouFora(), "nada mudou por fora depois da última gravação")

// 9. fila velha no Mac
desconectar()
let pQ = #"{"v":1,"s":{"M05":{"b":1,"c":[]}},"L":{},"at":20}"#
_ = try! A.salvarProgresso(pQ)
let pOutro = #"{"v":1,"s":{"M06":{"b":1,"c":[]}},"L":{},"at":21}"#
try! Data(pOutro.utf8).write(to: raizFora.appendingPathComponent("progresso/progresso.json"))
reconectar()
ok(A.esvaziarEspera() == 1, "copia a fila")
let depois9 = lerJSON(progURL)
ok(marca(depois9, "M05")?.b == 1 && marca(depois9, "M06")?.b == 1, "fila velha + disco mudado por fora: junta os dois")
ok(algumaVersaoCom(pastaProg, pOutro), "a versão que estava no disco fica em .versoes")
ok(A.lerEspelho("progresso.json") == (try? Data(contentsOf: progURL)), "espelho igual ao disco depois de copiar a fila")
var q2 = depois9!
var s9 = q2["s"] as! [String: Any]
s9["M06"] = ["b": 0, "c": [Int]()]
q2["s"] = s9
let pQ2 = texto(q2)
desconectar()
_ = try! A.salvarProgresso(pQ2)
reconectar()
_ = A.esvaziarEspera()
ok((try? String(contentsOf: progURL, encoding: .utf8)) == pQ2, "fila com desmarcação e disco sem mudança: o disco fica igual à fila")

// 10. página velha depois de a fila ser juntada
desconectar()
let pP1 = #"{"v":1,"s":{"M05":{"b":1,"c":[]},"M07":{"b":0,"c":[]}},"L":{},"at":30}"#
let gQ = try! A.salvarProgresso(pP1)
let pB2 = #"{"v":1,"s":{"M08":{"b":1,"c":[]}},"L":{},"at":31}"#
try! Data(pB2.utf8).write(to: raizFora.appendingPathComponent("progresso/progresso.json"))
reconectar()
_ = A.esvaziarEspera()
let pP2 = #"{"v":1,"s":{"M05":{"b":1,"c":[]},"M07":{"b":1,"c":[]}},"L":{},"at":32}"#
let gP2 = try! A.salvarProgresso(pP2, versao: gQ.versao)
let depois10 = lerJSON(progURL)
ok(gP2.json != nil && marca(depois10, "M08")?.b == 1 && marca(depois10, "M07")?.b == 1, "página com ficha antiga não apaga o que veio do outro lado")

// 11. nota mudada por fora
let n1 = try! A.salvarNota(id: "M04", titulo: titulo("M04"), texto: "um")
let n2 = try! A.salvarNota(id: "M04", titulo: titulo("M04"), texto: "dois", versao: n1.versao)
try! Data("fora".utf8).write(to: pastaAssunto("M04").appendingPathComponent("notas.md"))
let n3 = try! A.salvarNota(id: "M04", titulo: titulo("M04"), texto: "tres", versao: n2.versao)
ok(n3.conflito && !n2.conflito, "nota mudada por fora é marcada como conflito")
ok(algumaVersaoCom(pastaAssunto("M04"), "fora"), "o texto de fora fica em .versoes mesmo dentro dos 10 minutos")

// 12. arquivo que existe mas não abre
let guardado = try! Data(contentsOf: progURL)
try! fm.removeItem(at: progURL)
try! fm.createDirectory(at: progURL, withIntermediateDirectories: true)
ok((try? A.carregarProgresso()) == nil, "progresso ilegível dá erro em vez de vir vazio")
var ilegivel = lerJSON(String(decoding: guardado, as: UTF8.self))
var s12 = ilegivel["s"] as! [String: Any]
s12["M09"] = ["b": 1, "c": [Int]()]
ilegivel["s"] = s12
let pZ = texto(ilegivel)
let gZ = try? A.salvarProgresso(pZ, versao: Arquivos.impressao(guardado))
var pasta12: ObjCBool = false
ok(gZ?.onde == .espera && gZ?.aviso != nil, "não passa por cima do ilegível: vai para o Mac com aviso")
ok(fm.fileExists(atPath: progURL.path, isDirectory: &pasta12) && pasta12.boolValue, "o arquivo ilegível ficou intocado")
try! fm.removeItem(at: progURL)
try! guardado.write(to: progURL)
ok(A.esvaziarEspera() == 1 && marca(lerJSON(progURL), "M09")?.b == 1, "com o arquivo de volta, a fila vai para o disco")
try! Data([0xFF, 0xFE, 0xFD]).write(to: pastaAssunto("M05").appendingPathComponent("notas.md"))
ok((try? A.lerNota(id: "M05", titulo: titulo("M05"))) == nil, "nota que não é UTF-8 dá erro")
try! fm.removeItem(at: pastaAssunto("M05").appendingPathComponent("notas.md"))
let antes12 = try! Data(contentsOf: progURL)
try! Data("[]".utf8).write(to: progURL)
_ = try? A.salvarProgresso(String(decoding: antes12, as: UTF8.self))
let ilegiveis = ((try? fm.contentsOfDirectory(atPath: pastaProg.path)) ?? []).filter { $0.hasPrefix("progresso-ilegivel") }
ok(ilegiveis.contains { (try? String(contentsOf: pastaProg.appendingPathComponent($0), encoding: .utf8)) == "[]" }, "conteúdo que não é progresso é guardado à parte")

// 13. disco recusando escrita
let progAntes = try! Data(contentsOf: progURL)
let pastaGuardada = raiz.appendingPathComponent("progresso-real")
try! fm.moveItem(at: pastaProg, to: pastaGuardada)
try! Data("arquivo no lugar da pasta".utf8).write(to: pastaProg)
var o13 = lerJSON(String(decoding: progAntes, as: UTF8.self))
var s13 = o13["s"] as! [String: Any]
s13["M10"] = ["b": 1, "c": [Int]()]
o13["s"] = s13
let pZ2 = texto(o13)
let gZ2 = try? A.salvarProgresso(pZ2, versao: Arquivos.impressao(progAntes))
ok(gZ2?.onde == .espera && gZ2?.aviso != nil && A.erroNoDisco != nil, "disco recusando escrita: grava no Mac e avisa")
let l13 = try? A.carregarProgresso()
ok(l13?.texto == pZ2 && l13?.onde == .espera, "carrega o que está na fila do Mac")
try! fm.removeItem(at: pastaProg)
try! fm.moveItem(at: pastaGuardada, to: pastaProg)
ok(A.esvaziarEspera() == 1 && marca(lerJSON(progURL), "M10")?.b == 1, "disco de volta ao normal: a fila vai para ele")

// 14. restauração pelo espelho
let antes14 = try! String(contentsOf: progURL, encoding: .utf8)
try! fm.removeItem(at: progURL)
let l14 = try? A.carregarProgresso()
ok(l14?.restaurado == true && l14?.texto == antes14 && fm.fileExists(atPath: progURL.path), "pasta sem progresso.json: restaura do espelho e avisa")
try! fm.removeItem(at: pastaM01.appendingPathComponent("notas.md"))
let n14 = try? A.lerNota(id: "M01", titulo: titulo("M01"))
ok(n14?.restaurado == true && n14?.texto == "curta" && fm.fileExists(atPath: pastaM01.appendingPathComponent("notas.md").path), "notas.md sumido: restaura do espelho")

// 15. duas pastas Nous Keiros
let raiz2 = tmp.appendingPathComponent("OUTRO/Nous Keiros", isDirectory: true)
try! fm.createDirectory(at: raiz2.appendingPathComponent("mapa"), withIntermediateDirectories: true)
try! fm.copyItem(at: raiz.appendingPathComponent("mapa/mapa.json"), to: raiz2.appendingPathComponent("mapa/mapa.json"))
try! fm.createDirectory(at: raiz2.appendingPathComponent("assuntos").appendingPathComponent(Arquivos.nomePasta("M01", titulo("M01"))), withIntermediateDirectories: true)
desconectar()
_ = try! A.salvarProgresso(#"{"v":1,"s":{"M11":{"b":1,"c":[]}},"L":{},"at":40}"#)
let esperaDe1 = A.espera
A.definirRaiz(raiz2)
ok(A.espera != esperaDe1, "cada pasta tem a sua fila no Mac")
ok(A.esvaziarEspera() == 0 && !fm.fileExists(atPath: raiz2.appendingPathComponent("progresso/progresso.json").path), "a fila da pasta antiga não vai para a nova")
let l15 = try? A.carregarProgresso()
ok(l15 != nil && l15?.texto == nil && l15?.restaurado == false, "a pasta nova não herda o espelho da antiga")
ok((try? A.lerNota(id: "M01", titulo: titulo("M01")))?.texto == "", "nem as notas da antiga")
ok((try? A.conferirRaiz(raiz.path)) == nil, "recusa gravação vinda da página da pasta antiga")
ok((try? A.conferirRaiz(nil)) != nil && (try? A.conferirRaiz(raiz2.path)) != nil, "aceita sem ficha ou com a ficha certa")
A.definirRaiz(raiz)
reconectar()
ok(A.esvaziarEspera() == 1 && marca(lerJSON(progURL), "M11")?.b == 1, "de volta à pasta antiga, a fila dela vai para o disco certo")

// 16. migração da fila antiga (antes das áreas por pasta)
let apoioVelho = tmp.appendingPathComponent("apoio-velho", isDirectory: true)
try! fm.createDirectory(at: apoioVelho.appendingPathComponent("espera/progresso"), withIntermediateDirectories: true)
let atual16 = try! String(contentsOf: progURL, encoding: .utf8)
var o16 = lerJSON(atual16)
var s16 = o16["s"] as! [String: Any]
s16["M12"] = ["b": 1, "c": [Int]()]
o16["s"] = s16
try! Data(texto(o16).utf8).write(to: apoioVelho.appendingPathComponent("espera/progresso/progresso.json"))
try! fm.createDirectory(at: apoioVelho.appendingPathComponent("espelho"), withIntermediateDirectories: true)
try! Data(atual16.utf8).write(to: apoioVelho.appendingPathComponent("espelho/progresso.json"))
UserDefaults.standard.set(raiz.path, forKey: Arquivos.chavePasta)
let V = Arquivos(apoio: apoioVelho)
ok(!fm.fileExists(atPath: apoioVelho.appendingPathComponent("espera").path) && V.espera.path.contains("/raizes/"), "a fila antiga foi para a área da pasta")
ok(V.esvaziarEspera() == 1 && marca(lerJSON(progURL), "M12")?.b == 1, "e chega ao disco")

// 17. pastas duplicadas com o mesmo ID
let dup = raiz.appendingPathComponent("assuntos/M03 — Aaa duplicada", isDirectory: true)
try! fm.createDirectory(at: dup, withIntermediateDirectories: true)
try! Data("nota na duplicada".utf8).write(to: dup.appendingPathComponent("notas.md"))
ok(A.pastaDoAssunto("M03", titulo("M03")) == "assuntos/M03 — Aaa duplicada", "escolhe a pasta duplicada que já tem notas")
ok((try? A.lerNota(id: "M03", titulo: titulo("M03")))?.texto == "nota na duplicada", "lê a nota da pasta escolhida")
desconectar()
_ = try? A.salvarNota(id: "M03", titulo: titulo("M03"), texto: "escrita sem disco na duplicada")
reconectar()
_ = A.esvaziarEspera()
ok((try? String(contentsOf: dup.appendingPathComponent("notas.md"), encoding: .utf8)) == "escrita sem disco na duplicada", "a fila vai para a mesma pasta escolhida")
ok(A.lerNotas()["M03"] == "escrita sem disco na duplicada", "lerNotas usa a mesma regra")
ok(A.pastaDoAssunto("M06", titulo("M06")) == "assuntos/" + Arquivos.nomePasta("M06", titulo("M06")), "sem duplicata, usa o nome exato")

// 18. contrato da ponte (Despacho)
let D = Despacho(arquivos: A)
var aberto: URL? = nil
D.abrir = { u, _ in aberto = u }
func pedir(_ corpo: [String: Any]) -> (r: [String: Any]?, e: String?) {
    var saida: ([String: Any]?, String?) = (nil, nil)
    D.atender(corpo) { r, e in saida = (r, e) }
    return saida
}
let c = pedir(["acao": "carregar"])
ok(c.r?["json"] is String && c.r?["onde"] as? String == "keiros" && c.r?["versao"] is String && c.r?["raiz"] as? String == raiz.path && c.r?["restaurado"] as? Bool == false, "carregar: json, onde, versao, raiz, restaurado")
let sp = pedir(["acao": "salvarProgresso", "json": c.r!["json"] as! String, "versao": c.r!["versao"] as! String, "raiz": raiz.path, "versionar": true])
ok(sp.e == nil && sp.r?["onde"] as? String == "keiros" && sp.r?["versao"] is String && sp.r?["json"] is NSNull, "salvarProgresso: onde, versao, json nulo sem junção")
ok(pedir(["acao": "salvarProgresso", "json": c.r!["json"] as! String, "raiz": "/outra/pasta"]).e != nil, "salvarProgresso recusa ficha de outra pasta")
let ln = pedir(["acao": "lerNota", "id": "M01", "titulo": titulo("M01")])
ok(ln.r?["texto"] as? String == "curta" && ln.r?["restaurada"] as? Bool == false && ln.r?["versao"] is String, "lerNota: texto, versao, restaurada")
let sn = pedir(["acao": "salvarNota", "id": "M01", "titulo": titulo("M01"), "texto": "pela ponte", "versao": ln.r!["versao"] as! String, "raiz": raiz.path])
ok(sn.r?["onde"] as? String == "keiros" && sn.r?["conflito"] as? Bool == false, "salvarNota: onde, conflito")
ok((pedir(["acao": "lerNotas"]).r?["notas"] as? [String: String])?["M01"] == "pela ponte", "lerNotas: notas")
ok(pedir(["acao": "abrir", "url": "file:///etc/passwd"]).e != nil && aberto == nil, "abrir recusa o que não é http/https")
ok(pedir(["acao": "abrir", "url": "https://arxiv.org/abs/1706.03762"]).r?["ok"] as? Bool == true && aberto?.host == "arxiv.org", "abrir: manda para o leitor")
ok(pedir(["acao": "exportar", "texto": "{}", "nome": "x.json"]).r?["ok"] as? Bool == false, "exportar sem painel responde ok falso")
ok(pedir(["acao": "inventada"]).e != nil && pedir(["sem": "acao"]).e != nil, "pedido desconhecido ou sem ação dá erro")

print(falhas == 0 ? "tudo certo" : "\(falhas) falha(s)")
exit(falhas == 0 ? 0 : 1)
