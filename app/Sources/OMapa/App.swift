import AppKit
import SwiftUI
import WebKit

@main
struct OMapaApp: App {
    @NSApplicationDelegateAdaptor(Delegado.self) private var delegado
    @StateObject private var estado = EstadoDoApp.compartilhado

    var body: some Scene {
        Window("O MAPA", id: "principal") {
            TelaPrincipal(estado: estado)
                .frame(minWidth: 960, minHeight: 640)
        }
        .defaultSize(width: 1440, height: 920)
        .commands {
            CommandGroup(replacing: .newItem) {}
            // "after" (e não "replacing") mantém Arquivo › Fechar (⌘W).
            CommandGroup(after: .saveItem) {
                Button("Salvar") { estado.salvar() }
                    .keyboardShortcut("s", modifiers: .command)
                Button("Exportar progresso…") { estado.exportar() }
                    .keyboardShortcut("e", modifiers: [.command, .shift])
                Divider()
                Button("Escolher a pasta Nous Keiros…") { estado.escolherPasta() }
                Button("Mostrar a pasta Nous Keiros no Finder") { estado.mostrarPasta() }
                    .disabled(!estado.temPasta)
            }
            CommandMenu("Leitor") {
                Button("Testar vídeo do YouTube") { estado.testarYouTube() }
            }
        }
    }
}

/// Estado do app: a pasta Nous Keiros e a (única) página do mapa.
final class EstadoDoApp: ObservableObject {
    static let compartilhado = EstadoDoApp()

    let arquivos = Arquivos()
    @Published private(set) var temPasta: Bool
    /// A WebView do mapa. Pertence ao estado (referência forte) para sobreviver ao fechar da janela.
    private(set) var web: WKWebView?
    private var coordenador: Coordenador?
    private var discoSaiu = false
    private var observadores: [NSObjectProtocol] = []

    init() {
        temPasta = arquivos.raiz != nil
        let centro = NSWorkspace.shared.notificationCenter
        observadores.append(centro.addObserver(forName: NSWorkspace.didMountNotification, object: nil, queue: .main) { [weak self] _ in
            self?.sincronizar()
        })
        observadores.append(centro.addObserver(forName: NSWorkspace.didUnmountNotification, object: nil, queue: .main) { [weak self] _ in
            self?.discoSaiu = true
        })
        observadores.append(NotificationCenter.default.addObserver(forName: NSApplication.didBecomeActiveNotification, object: nil, queue: .main) { [weak self] _ in
            self?.sincronizar()
        })
    }

    /// Cria (uma vez) a WebView do mapa, com o esquema omapa:// e a ponte.
    func webDoMapa() -> WKWebView {
        if let web { return web }
        let c = Coordenador(arquivos: arquivos)
        let config = WKWebViewConfiguration()
        config.setURLSchemeHandler(c.esquema, forURLScheme: Endereco.esquema)
        config.userContentController.addScriptMessageHandler(c.ponte, contentWorld: .page, name: Ponte.nome)
        let novo = WKWebView(frame: .zero, configuration: config)
        novo.navigationDelegate = c
        novo.uiDelegate = c
        novo.underPageBackgroundColor = NSColor(red: 10 / 255, green: 8 / 255, blue: 18 / 255, alpha: 1)
        #if compiler(>=5.8)
        if #available(macOS 13.3, *) { novo.isInspectable = true }
        #endif
        coordenador = c
        web = novo
        novo.load(URLRequest(url: Endereco.inicio))
        return novo
    }

    /// Ao voltar para o app ou montar um disco: copia a fila do Mac para o KEIROS e,
    /// se o progresso no disco mudou (outro Mac, disco que saiu e voltou), recarrega a página.
    func sincronizar() {
        guard arquivos.conectado else { return }
        let copiados = arquivos.esvaziarEspera()
        if web != nil, copiados > 0 || discoSaiu || arquivos.progressoMudouFora() {
            discoSaiu = false
            web?.evaluateJavaScript("window.__mapa && void window.__mapa.recarregar()", completionHandler: nil)
        }
    }

    func salvar(silencioso: Bool = false) {
        web?.evaluateJavaScript("window.__mapa && void window.__mapa.salvar(\(silencioso))", completionHandler: nil)
    }

    func exportar() {
        web?.evaluateJavaScript("window.__mapa && void window.__mapa.exportar()", completionHandler: nil)
    }

    func testarYouTube() {
        web?.evaluateJavaScript("window.__mapa && void window.__mapa.testarYouTube()", completionHandler: nil)
    }

    /// Grava o que estiver pendente na página e só então segue, dizendo se tudo foi gravado.
    /// Sem página, não há nada pendente. Sem resposta em 10 s, segue como "não gravou".
    func salvarEDepois(_ depois: @escaping (Bool) -> Void) {
        guard let web else { return depois(true) }
        var feito = false
        let seguir: (Bool) -> Void = { ok in
            if !feito { feito = true; depois(ok) }
        }
        web.callAsyncJavaScript("return window.__mapa ? await window.__mapa.salvar(true) : true",
                                arguments: [:], in: nil, in: .page) { resultado in
            if case .success(let valor) = resultado, let ok = valor as? Bool {
                seguir(ok)
            } else {
                seguir(false)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { seguir(false) }
    }

    /// Pergunta se segue mesmo sem ter conseguido gravar tudo. "Cancelar" é o padrão.
    static func confirmarSemSalvar(_ acao: String) -> Bool {
        let alerta = NSAlert()
        alerta.alertStyle = .warning
        alerta.messageText = "Nem tudo foi gravado"
        alerta.informativeText = "Algumas alterações ainda não chegaram ao disco nem à fila do Mac. Veja o aviso no topo do mapa ou use Exportar antes de continuar."
        alerta.addButton(withTitle: "Cancelar")
        alerta.addButton(withTitle: "\(acao) mesmo assim")
        return alerta.runModal() == .alertSecondButtonReturn
    }

    func escolherPasta() {
        let painel = NSOpenPanel()
        painel.canChooseDirectories = true
        painel.canChooseFiles = false
        painel.allowsMultipleSelection = false
        painel.prompt = "Usar esta pasta"
        painel.message = "Escolha a pasta Nous Keiros (a que tem mapa/mapa.json dentro)."
        painel.directoryURL = arquivos.raiz?.deletingLastPathComponent() ?? URL(fileURLWithPath: "/Volumes", isDirectory: true)
        guard painel.runModal() == .OK, let url = painel.url else { return }
        guard Arquivos.ehNousKeiros(url) else {
            let alerta = NSAlert()
            alerta.messageText = "Essa pasta não é a Nous Keiros"
            alerta.informativeText = "Não encontrei mapa/mapa.json dentro de \(url.path)."
            alerta.runModal()
            return
        }
        salvarEDepois { [weak self] ok in
            guard let self else { return }
            guard ok || Self.confirmarSemSalvar("Trocar de pasta") else { return }
            let pendentes = self.arquivos.conectado ? 0 : self.arquivos.arquivosNaEspera()
            self.arquivos.definirRaiz(url)
            self.temPasta = true
            self.web?.load(URLRequest(url: Endereco.inicio))
            if pendentes > 0 {
                let alerta = NSAlert()
                alerta.messageText = "Trabalho da pasta anterior guardado no Mac"
                alerta.informativeText = "\(pendentes) arquivo(s) da pasta anterior continuam guardados no Mac. Eles vão para o disco quando você escolher aquela pasta de novo, com o disco conectado."
                alerta.runModal()
            }
        }
    }

    func mostrarPasta() {
        guard let raiz = arquivos.raiz, arquivos.conectado else {
            let alerta = NSAlert()
            alerta.messageText = "O KEIROS não está conectado"
            alerta.informativeText = "Conecte o disco. Enquanto isso, o app guarda o seu trabalho no Mac e copia tudo quando o disco voltar."
            alerta.runModal()
            return
        }
        NSWorkspace.shared.open(raiz)
    }
}

final class Delegado: NSObject, NSApplicationDelegate {
    /// Antes de fechar, grava o que estiver pendente; se algo não foi gravado, pergunta.
    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
        let estado = EstadoDoApp.compartilhado
        guard estado.web != nil else { return .terminateNow }
        estado.salvarEDepois { ok in
            sender.reply(toApplicationShouldTerminate: ok || EstadoDoApp.confirmarSemSalvar("Sair"))
        }
        return .terminateLater
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }
}

struct TelaPrincipal: View {
    @ObservedObject var estado: EstadoDoApp

    var body: some View {
        Group {
            if estado.temPasta {
                PainelWeb(estado: estado)
            } else {
                BoasVindas(estado: estado)
            }
        }
        .background(Color(red: 10 / 255, green: 8 / 255, blue: 18 / 255))
        .preferredColorScheme(.dark)
    }
}

struct BoasVindas: View {
    @ObservedObject var estado: EstadoDoApp

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("O MAPA")
                .font(.system(size: 34, weight: .bold, design: .monospaced))
            Text("Onde está a pasta Nous Keiros?")
                .font(.title2)
            Text("O app lê o mapa e guarda o seu estudo na pasta Nous Keiros, no disco KEIROS. Conecte o disco e escolha a pasta — a que tem mapa/mapa.json dentro.")
                .foregroundStyle(.secondary)
                .frame(maxWidth: 560, alignment: .leading)
            Button("Escolher a pasta…") { estado.escolherPasta() }
                .keyboardShortcut(.defaultAction)
                .controlSize(.large)
        }
        .padding(56)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}
