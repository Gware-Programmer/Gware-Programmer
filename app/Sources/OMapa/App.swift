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
            CommandGroup(replacing: .saveItem) {
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

/// Estado do app: a pasta Nous Keiros e a página do mapa.
final class EstadoDoApp: ObservableObject {
    static let compartilhado = EstadoDoApp()

    let arquivos = Arquivos()
    @Published private(set) var temPasta: Bool
    weak var web: WKWebView?
    private var observadores: [NSObjectProtocol] = []

    init() {
        temPasta = arquivos.raiz != nil
        let centro = NSWorkspace.shared.notificationCenter
        observadores.append(centro.addObserver(forName: NSWorkspace.didMountNotification, object: nil, queue: .main) { [weak self] _ in
            self?.discoPodeTerVoltado()
        })
        observadores.append(NotificationCenter.default.addObserver(forName: NSApplication.didBecomeActiveNotification, object: nil, queue: .main) { [weak self] _ in
            self?.discoPodeTerVoltado()
        })
    }

    /// Quando o KEIROS volta, copia para ele o que ficou guardado no Mac e regrava o progresso.
    func discoPodeTerVoltado() {
        guard arquivos.conectado else { return }
        if arquivos.esvaziarEspera() > 0 {
            web?.evaluateJavaScript("window.__mapa && void window.__mapa.salvar()", completionHandler: nil)
        }
    }

    func salvar() {
        web?.evaluateJavaScript("window.__mapa && void window.__mapa.salvar()", completionHandler: nil)
    }

    func exportar() {
        web?.evaluateJavaScript("window.__mapa && void window.__mapa.exportar()", completionHandler: nil)
    }

    func testarYouTube() {
        web?.evaluateJavaScript("window.__mapa && void window.__mapa.testarYouTube()", completionHandler: nil)
    }

    /// Grava o que estiver pendente na página e só então segue (trocar de pasta, sair do app).
    func salvarEDepois(_ depois: @escaping () -> Void) {
        guard let web else { return depois() }
        var feito = false
        let seguir = {
            if !feito { feito = true; depois() }
        }
        web.callAsyncJavaScript("return window.__mapa ? await window.__mapa.salvar() : true",
                                arguments: [:], in: nil, in: .page) { _ in seguir() }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { seguir() }
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
        salvarEDepois { [weak self] in
            guard let self else { return }
            self.arquivos.definirRaiz(url)
            self.temPasta = true
            self.web?.load(URLRequest(url: Esquema.inicio))
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
    /// Antes de fechar, grava o que estiver pendente (no máximo 5 segundos de espera).
    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
        let estado = EstadoDoApp.compartilhado
        guard estado.web != nil else { return .terminateNow }
        estado.salvarEDepois { sender.reply(toApplicationShouldTerminate: true) }
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
