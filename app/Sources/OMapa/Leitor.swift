import AppKit
import SwiftUI
import WebKit

/// Janelas do leitor: tudo o que é link (páginas, PDFs, arXiv, vídeos) abre aqui dentro.
final class Leitores: NSObject, NSWindowDelegate {
    static let compartilhado = Leitores()
    private var janelas: [NSWindow] = []

    func abrir(_ url: URL, titulo: String?) {
        let janela = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 1100, height: 780),
                              styleMask: [.titled, .closable, .miniaturizable, .resizable],
                              backing: .buffered, defer: false)
        janela.isReleasedWhenClosed = false
        let nome = (titulo ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        janela.title = nome.isEmpty ? (url.host ?? "Leitor") : nome
        let hospedeiro = NSHostingController(rootView: LeitorView(endereco: url) { [weak janela] t in
            janela?.title = t
        })
        hospedeiro.sizingOptions = [.minSize]
        janela.contentViewController = hospedeiro
        janela.setContentSize(NSSize(width: 1100, height: 780))
        if let ultima = janelas.last, ultima.isVisible {
            janela.setFrameTopLeftPoint(NSPoint(x: ultima.frame.minX + 28, y: ultima.frame.maxY - 28))
        } else {
            janela.center()
        }
        janela.delegate = self
        janelas.append(janela)
        janela.makeKeyAndOrderFront(nil)
    }

    func windowWillClose(_ notification: Notification) {
        guard let janela = notification.object as? NSWindow else { return }
        DispatchQueue.main.async { self.janelas.removeAll { $0 === janela } }
    }
}

/// Vídeos do YouTube: tocam no player oficial embutido. O YouTube exige que o app se identifique
/// pelo Referer (desde 09/07/2025); por isso a página do player é carregada com a origem do app.
enum YouTube {
    static let origem = URL(string: "https://br.keiros.omapa/")!

    static func video(_ u: URL) -> (id: String, inicio: Int)? {
        guard let host = u.host?.lowercased() else { return nil }
        let itens = URLComponents(url: u, resolvingAgainstBaseURL: false)?.queryItems ?? []
        let inicio = itens.first(where: { $0.name == "t" || $0.name == "start" })?.value.flatMap(segundos) ?? 0
        if host == "youtu.be", let id = u.pathComponents.dropFirst().first {
            return (id, inicio)
        }
        guard host == "youtube.com" || host.hasSuffix(".youtube.com") else { return nil }
        if u.path == "/watch", let v = itens.first(where: { $0.name == "v" })?.value {
            return (v, inicio)
        }
        let p = u.pathComponents
        if p.count >= 3, ["shorts", "embed", "live"].contains(p[1]) {
            return (p[2], inicio)
        }
        return nil
    }

    /// "90", "90s", "1m30s", "1h2m3s" → segundos.
    static func segundos(_ s: String) -> Int? {
        if let n = Int(s) { return n }
        var total = 0, numero = ""
        for c in s {
            if c.isNumber { numero.append(c); continue }
            guard let n = Int(numero) else { return nil }
            switch c {
            case "h": total += n * 3600
            case "m": total += n * 60
            case "s": total += n
            default: return nil
            }
            numero = ""
        }
        return total
    }

    static func pagina(id: String, inicio: Int) -> String {
        let seguro = String(id.filter { $0.isASCII && ($0.isLetter || $0.isNumber || $0 == "-" || $0 == "_") })
        return """
        <!doctype html><html><head><meta charset="utf-8">
        <meta name="referrer" content="strict-origin-when-cross-origin">
        <style>html,body{margin:0;height:100%;background:#0A0812}iframe{border:0;display:block;width:100%;height:100%}</style>
        </head><body>
        <iframe src="https://www.youtube.com/embed/\(seguro)?start=\(inicio)&rel=0&playsinline=1"
          allow="autoplay; encrypted-media; picture-in-picture; fullscreen" allowfullscreen
          referrerpolicy="strict-origin-when-cross-origin"></iframe>
        </body></html>
        """
    }
}

final class ModeloLeitor: NSObject, ObservableObject, WKNavigationDelegate, WKUIDelegate {
    @Published var endereco: URL?
    @Published var podeVoltar = false
    @Published var podeAvancar = false
    @Published var carregando = false
    @Published var erro: String?
    @Published var video: URL?
    /// O último vídeo carregado no player embutido (para o Voltar restaurar o estado de vídeo).
    private var ultimoVideo: URL?
    weak var web: WKWebView?
    var aoMudarTitulo: (String) -> Void = { _ in }

    func carregar(_ url: URL) {
        guard let web else { return }
        erro = nil
        if let v = YouTube.video(url) {
            video = url
            ultimoVideo = url
            endereco = url
            web.loadHTMLString(YouTube.pagina(id: v.id, inicio: v.inicio), baseURL: YouTube.origem)
        } else {
            video = nil
            web.load(URLRequest(url: url))
        }
    }

    func recarregar() {
        if let video { carregar(video) } else { web?.reload() }
    }

    /// Sai do player embutido e abre a página do vídeo no próprio leitor.
    func abrirPaginaDoVideo() {
        guard let video, let v = YouTube.video(video),
              let url = URL(string: "https://www.youtube.com/watch?v=\(v.id)&t=\(v.inicio)s") else { return }
        self.video = nil
        web?.load(URLRequest(url: url))
    }

    private func atualizar(_ w: WKWebView) {
        podeVoltar = w.canGoBack
        podeAvancar = w.canGoForward
        carregando = w.isLoading
        if let u = w.url, u.host == YouTube.origem.host {
            // a página do player embutido (também ao voltar para ela pelo histórico)
            video = video ?? ultimoVideo
            endereco = video
        } else if let u = w.url, u.scheme != "about" {
            video = nil
            endereco = u
        }
        if video == nil, let t = w.title, !t.isEmpty { aoMudarTitulo(t) }
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) { atualizar(webView) }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) { erro = nil; atualizar(webView) }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) { atualizar(webView) }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) { falhou(webView, error) }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        falhou(webView, error)
    }

    private func falhou(_ w: WKWebView, _ e: Error) {
        let ns = e as NSError
        let cancelado = ns.domain == NSURLErrorDomain && ns.code == NSURLErrorCancelled
        let interrompido = ns.domain == "WebKitErrorDomain" && ns.code == 102  // virou download
        if !cancelado && !interrompido { erro = e.localizedDescription }
        atualizar(w)
    }

    /// O que o WebKit não sabe mostrar (zip, ipynb…) abre, por enquanto, no app padrão do Mac —
    /// mas só quando é a página principal e só endereços http/https (nunca um iframe de anúncio).
    @MainActor
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse) async -> WKNavigationResponsePolicy {
        if navigationResponse.canShowMIMEType { return .allow }
        if navigationResponse.isForMainFrame, let u = navigationResponse.response.url,
           ["http", "https"].contains(u.scheme?.lowercased() ?? "") {
            NSWorkspace.shared.open(u)
        }
        return .cancel
    }

    /// Links que pedem janela nova abrem no mesmo leitor.
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration,
                 for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            video = nil
            webView.load(navigationAction.request)
        }
        return nil
    }
}

struct NavegadorWeb: NSViewRepresentable {
    let modelo: ModeloLeitor
    let inicial: URL

    func makeNSView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.preferences.isElementFullscreenEnabled = true
        config.mediaTypesRequiringUserActionForPlayback = []
        let web = WKWebView(frame: .zero, configuration: config)
        web.navigationDelegate = modelo
        web.uiDelegate = modelo
        web.allowsBackForwardNavigationGestures = true
        #if compiler(>=5.8)
        if #available(macOS 13.3, *) { web.isInspectable = true }
        #endif
        modelo.web = web
        let m = modelo, primeiro = inicial
        DispatchQueue.main.async { m.carregar(primeiro) }
        return web
    }

    func updateNSView(_ web: WKWebView, context: Context) {}
}

struct LeitorView: View {
    let endereco: URL
    var aoMudarTitulo: (String) -> Void = { _ in }
    @StateObject private var modelo = ModeloLeitor()

    init(endereco: URL, aoMudarTitulo: @escaping (String) -> Void = { _ in }) {
        self.endereco = endereco
        self.aoMudarTitulo = aoMudarTitulo
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Button { modelo.web?.goBack() } label: { Image(systemName: "chevron.left") }
                    .disabled(!modelo.podeVoltar).help("Voltar")
                Button { modelo.web?.goForward() } label: { Image(systemName: "chevron.right") }
                    .disabled(!modelo.podeAvancar).help("Avançar")
                Button { modelo.recarregar() } label: { Image(systemName: "arrow.clockwise") }
                    .help("Recarregar")
                Text((modelo.endereco ?? endereco).absoluteString)
                    .font(.system(size: 11, design: .monospaced))
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                    .truncationMode(.middle)
                    .textSelection(.enabled)
                Spacer(minLength: 8)
                if modelo.carregando { ProgressView().controlSize(.small) }
                if modelo.video != nil {
                    Button("Página do vídeo") { modelo.abrirPaginaDoVideo() }
                        .help("Abrir a página do YouTube aqui no leitor")
                }
                Button { NSWorkspace.shared.open(modelo.endereco ?? endereco) } label: { Image(systemName: "safari") }
                    .help("Abrir no navegador do Mac")
            }
            .buttonStyle(.borderless)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            if let erro = modelo.erro {
                Text("Não consegui abrir: \(erro)")
                    .font(.callout)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 12)
                    .padding(.bottom, 6)
            }
            Divider()
            NavegadorWeb(modelo: modelo, inicial: endereco)
        }
        .frame(minWidth: 640, minHeight: 420)
        .onAppear { modelo.aoMudarTitulo = aoMudarTitulo }
    }
}
