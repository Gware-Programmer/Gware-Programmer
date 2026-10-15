// Testa a camada de arquivos do app (Arquivos.swift) sem tocar nos dados reais.
// Uso, na pasta do repositório:
//   swiftc -o /tmp/teste-arquivos app/testes/arquivos/main.swift app/Sources/OMapa/Arquivos.swift
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

// cópia mínima do Nous Keiros: mapa e pastas dos assuntos
let raiz = tmp.appendingPathComponent("KEIROS/Nous Keiros", isDirectory: true)
try! fm.createDirectory(at: raiz.appendingPathComponent("mapa"), withIntermediateDirectories: true)
try! fm.copyItem(at: nousOrig.appendingPathComponent("mapa/mapa.json"), to: raiz.appendingPathComponent("mapa/mapa.json"))
let nomes = try! fm.contentsOfDirectory(atPath: nousOrig.appendingPathComponent("assuntos").path).filter { !$0.hasPrefix(".") }
for n in nomes { try! fm.createDirectory(at: raiz.appendingPathComponent("assuntos").appendingPathComponent(n), withIntermediateDirectories: true) }

// 1. nome da pasta igual ao do gerar.py
let mapa = try! JSONSerialization.jsonObject(with: Data(contentsOf: raiz.appendingPathComponent("mapa/mapa.json"))) as! [String: Any]
let subs = mapa["subjects"] as! [String: [String: Any]]
let reais = Set(nomes)
let diferentes = subs.filter { !reais.contains(Arquivos.nomePasta($0.key, $0.value["t"] as! String)) }.map { $0.key }
ok(diferentes.isEmpty && subs.count == 203, "nomePasta igual ao gerar.py nos \(subs.count) assuntos \(diferentes.sorted().prefix(5))")

// 2. caminhos seguros
ok(Arquivos.dentro(raiz, "../fora") == nil && Arquivos.dentro(raiz, "a/../../b") == nil && Arquivos.dentro(raiz, "./x") == nil, "recusa caminhos que saem da pasta")
ok(Arquivos.dentro(raiz, "progresso/progresso.json") != nil, "aceita caminho normal")

let A = Arquivos(apoio: tmp.appendingPathComponent("apoio", isDirectory: true))
A.definirRaiz(raiz)
ok(A.conectado, "conectado com mapa/mapa.json")
ok(A.lerMapa("mapa/mapa.json") != nil && A.lerMapa("../etc/passwd") == nil && A.lerMapa("progresso/x") == nil, "serve só o mapa")

// 3. progresso
let p1 = #"{"v":1,"s":{"M01":{"b":1,"c":[1,0]}},"L":{},"at":1}"#
let p2 = #"{"v":1,"s":{"M01":{"b":1,"c":[1,1]}},"L":{},"at":2}"#
ok((try? A.salvarProgresso(p1)) == .keiros, "salva progresso no KEIROS")
ok((try? A.salvarProgresso("isto não é json")) == nil, "recusa progresso inválido")
_ = try? A.salvarProgresso(p2)
let backups = (try? fm.contentsOfDirectory(atPath: raiz.appendingPathComponent("progresso/backups").path)) ?? []
ok(backups.count == 1, "uma cópia do dia em progresso/backups \(backups)")
ok(A.carregarProgresso().json == p2, "carrega o progresso mais novo")

// 4. notas na pasta do assunto, com versões
let titulo = subs["M01"]!["t"] as! String
let pastaM01 = raiz.appendingPathComponent("assuntos").appendingPathComponent(Arquivos.nomePasta("M01", titulo))
ok((try? A.salvarNota(id: "M01", titulo: titulo, texto: String(repeating: "nota longa ", count: 50))) == .keiros, "salva nota no KEIROS")
ok(fm.fileExists(atPath: pastaM01.appendingPathComponent("notas.md").path), "notas.md dentro da pasta do assunto")
_ = try? A.salvarNota(id: "M01", titulo: titulo, texto: String(repeating: "nota longa ", count: 51))
let v1 = (try? fm.contentsOfDirectory(atPath: pastaM01.appendingPathComponent(".versoes").path)) ?? []
ok(v1.count == 1, "primeira troca guarda uma versão \(v1)")
_ = try? A.salvarNota(id: "M01", titulo: titulo, texto: String(repeating: "nota longa ", count: 52))
let v2 = (try? fm.contentsOfDirectory(atPath: pastaM01.appendingPathComponent(".versoes").path)) ?? []
ok(v2.count == 1, "não versiona de novo antes de 10 minutos")
Thread.sleep(forTimeInterval: 1.1)
_ = try? A.salvarNota(id: "M01", titulo: titulo, texto: "curta")
let v3 = (try? fm.contentsOfDirectory(atPath: pastaM01.appendingPathComponent(".versoes").path)) ?? []
ok(v3.count == 2, "texto que encolhe pela metade sempre guarda versão \(v3.count)")
ok(A.lerNota(id: "M01", titulo: titulo) == "curta", "lê a nota")

// 5. KEIROS desconectado
let fora = tmp.appendingPathComponent("KEIROS-fora", isDirectory: true)
try! fm.moveItem(at: tmp.appendingPathComponent("KEIROS"), to: fora)
ok(!A.conectado, "percebe o KEIROS desconectado")
ok(A.lerMapa("mapa/mapa.json") != nil, "abre o mapa pelo espelho no Mac")
ok(A.carregarProgresso().json == p2 && A.carregarProgresso().onde == .espera, "carrega o progresso do espelho")
ok(A.lerNota(id: "M01", titulo: titulo) == "curta", "lê a nota do espelho")
let p3 = #"{"v":1,"s":{"M01":{"b":1,"c":[1,1]},"M02":{"b":1,"c":[]}},"L":{},"at":3}"#
ok((try? A.salvarProgresso(p3)) == .espera, "grava o progresso no Mac")
ok((try? A.salvarNota(id: "M02", titulo: subs["M02"]!["t"] as! String, texto: "escrita sem o disco")) == .espera, "grava nota no Mac")
ok(A.carregarProgresso().json == p3, "a cópia na espera é a mais nova")

// 6. KEIROS volta
try! fm.moveItem(at: fora, to: tmp.appendingPathComponent("KEIROS"))
ok(A.conectado, "percebe o KEIROS de volta")
ok(A.esvaziarEspera() == 2, "copia os 2 arquivos guardados no Mac")
ok((try? String(contentsOf: raiz.appendingPathComponent("progresso/progresso.json"), encoding: .utf8)) == p3, "progresso no disco atualizado")
let pastaM02 = raiz.appendingPathComponent("assuntos").appendingPathComponent(Arquivos.nomePasta("M02", subs["M02"]!["t"] as! String))
ok((try? String(contentsOf: pastaM02.appendingPathComponent("notas.md"), encoding: .utf8)) == "escrita sem o disco", "nota escrita sem o disco foi para a pasta do assunto")
let restos = ((try? fm.subpathsOfDirectory(atPath: A.espera.path)) ?? []).filter { !$0.hasSuffix("/") && (try? fm.attributesOfItem(atPath: A.espera.appendingPathComponent($0).path)[.type] as? FileAttributeType) == .typeRegular }
ok(restos.isEmpty, "espera vazia depois de copiar \(restos)")
ok(A.lerNotas()["M01"] == "curta" && A.lerNotas()["M02"] == "escrita sem o disco", "lerNotas junta todas as notas")
ok((try? A.criarPastaDoAssunto(id: "Z01", titulo: subs["Z01"]!["t"] as! String))?.lastPathComponent.hasPrefix("Z01 — ") == true, "abre a pasta existente do assunto")

print(falhas == 0 ? "tudo certo" : "\(falhas) falha(s)")
exit(falhas == 0 ? 0 : 1)
