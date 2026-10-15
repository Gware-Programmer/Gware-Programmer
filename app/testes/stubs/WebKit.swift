@_exported import Foundation
#if canImport(FoundationNetworking)
@_exported import FoundationNetworking
#endif
import AppKit

@preconcurrency @MainActor open class WKSecurityOrigin: NSObject { open var `protocol`: String { "" }; open var host: String { "" } }
@preconcurrency @MainActor open class WKFrameInfo: NSObject { open var isMainFrame: Bool { true }; open var securityOrigin: WKSecurityOrigin { WKSecurityOrigin() }; open var request: URLRequest { URLRequest(url: URL(string: "about:blank")!) } }
@preconcurrency @MainActor open class WKContentWorld: NSObject { public static var page: WKContentWorld { WKContentWorld() }; public static var defaultClient: WKContentWorld { WKContentWorld() } }
@preconcurrency @MainActor open class WKScriptMessage: NSObject {
    open var body: Any { 0 }
    open var frameInfo: WKFrameInfo { WKFrameInfo() }
    open weak var webView: WKWebView?
    open var name: String { "" }
}
@preconcurrency @MainActor public protocol WKScriptMessageHandler: NSObjectProtocol {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage)
}
@preconcurrency @MainActor public protocol WKScriptMessageHandlerWithReply: NSObjectProtocol {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) async -> (Any?, String?)
}
public enum WKUserScriptInjectionTime: Int, Sendable { case atDocumentStart, atDocumentEnd }
@preconcurrency @MainActor open class WKUserScript: NSObject {
    public init(source: String, injectionTime: WKUserScriptInjectionTime, forMainFrameOnly: Bool) {}
}
@preconcurrency @MainActor open class WKUserContentController: NSObject {
    open func add(_ handler: WKScriptMessageHandler, name: String) {}
    open func addScriptMessageHandler(_ handler: WKScriptMessageHandlerWithReply, contentWorld: WKContentWorld, name: String) {}
    open func addUserScript(_ s: WKUserScript) {}
    open func removeAllScriptMessageHandlers() {}
}
@preconcurrency @MainActor open class WKPreferences: NSObject { open var isElementFullscreenEnabled: Bool = false; open var javaScriptCanOpenWindowsAutomatically: Bool = false }
public struct WKAudiovisualMediaTypes: OptionSet, Sendable { public let rawValue: UInt; public init(rawValue: UInt) { self.rawValue = rawValue }
    public static let audio = WKAudiovisualMediaTypes(rawValue: 1), video = WKAudiovisualMediaTypes(rawValue: 2), all = WKAudiovisualMediaTypes(rawValue: 3) }
@preconcurrency @MainActor open class WKWebsiteDataStore: NSObject { public static func `default`() -> WKWebsiteDataStore { WKWebsiteDataStore() }; public static func nonPersistent() -> WKWebsiteDataStore { WKWebsiteDataStore() } }
@preconcurrency @MainActor open class WKWebViewConfiguration: NSObject {
    open var userContentController = WKUserContentController()
    open var preferences = WKPreferences()
    open var mediaTypesRequiringUserActionForPlayback: WKAudiovisualMediaTypes = .all
    open var websiteDataStore = WKWebsiteDataStore()
    open func setURLSchemeHandler(_ h: WKURLSchemeHandler?, forURLScheme s: String) {}
}
@preconcurrency @MainActor public protocol WKURLSchemeTask: NSObjectProtocol {
    var request: URLRequest { get }
    func didReceive(_ response: URLResponse)
    func didReceive(_ data: Data)
    func didFinish()
    func didFailWithError(_ error: Error)
}
@preconcurrency @MainActor public protocol WKURLSchemeHandler: NSObjectProtocol {
    func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask)
    func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask)
}
@preconcurrency @MainActor open class WKNavigation: NSObject {}
@preconcurrency @MainActor open class WKNavigationAction: NSObject {
    open var request: URLRequest { URLRequest(url: URL(string: "about:blank")!) }
    open var targetFrame: WKFrameInfo? { nil }
    open var sourceFrame: WKFrameInfo { WKFrameInfo() }
    public enum NavigationType: Int, Sendable { case linkActivated, formSubmitted, backForward, reload, formResubmitted, other = -1 }
    open var navigationType: NavigationType { .other }
}
@preconcurrency @MainActor open class WKNavigationResponse: NSObject {
    open var canShowMIMEType: Bool { true }
    open var isForMainFrame: Bool { true }
    open var response: URLResponse { URLResponse(url: URL(string: "about:blank")!, mimeType: nil, expectedContentLength: 0, textEncodingName: nil) }
}
public enum WKNavigationActionPolicy: Int, Sendable { case cancel, allow, download }
public enum WKNavigationResponsePolicy: Int, Sendable { case cancel, allow, download }
@preconcurrency @MainActor public protocol WKNavigationDelegate: NSObjectProtocol {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse) async -> WKNavigationResponsePolicy
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!)
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error)
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error)
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView)
}
extension WKNavigationDelegate {
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy { .allow }
    public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse) async -> WKNavigationResponsePolicy { .allow }
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {}
    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {}
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {}
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {}
    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {}
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {}
}
@preconcurrency @MainActor open class WKWindowFeatures: NSObject {}
@preconcurrency @MainActor open class WKOpenPanelParameters: NSObject { open var allowsMultipleSelection: Bool { false }; open var allowsDirectories: Bool { false } }
@preconcurrency @MainActor public protocol WKUIDelegate: NSObjectProtocol {
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView?
    func webView(_ webView: WKWebView, runOpenPanelWith parameters: WKOpenPanelParameters, initiatedByFrame frame: WKFrameInfo) async -> [URL]?
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping @MainActor @Sendable () -> Void)
}
extension WKUIDelegate {
    public func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? { nil }
    public func webView(_ webView: WKWebView, runOpenPanelWith parameters: WKOpenPanelParameters, initiatedByFrame frame: WKFrameInfo) async -> [URL]? { nil }
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping @MainActor @Sendable () -> Void) { completionHandler() }
}
@preconcurrency @MainActor open class WKWebView: NSView {
    public init(frame: CGRect, configuration: WKWebViewConfiguration) { super.init() }
    open weak var navigationDelegate: WKNavigationDelegate?
    open weak var uiDelegate: WKUIDelegate?
    open var underPageBackgroundColor: NSColor! = nil
    @available(macOS 13.3, *) open var isInspectable: Bool { get { false } set {} }
    open var allowsBackForwardNavigationGestures: Bool = false
    open var configuration: WKWebViewConfiguration { WKWebViewConfiguration() }
    open var url: URL? { nil }
    open var title: String? { nil }
    open var canGoBack: Bool { false }
    open var canGoForward: Bool { false }
    open var isLoading: Bool { false }
    @discardableResult open func load(_ request: URLRequest) -> WKNavigation? { nil }
    @discardableResult open func loadHTMLString(_ string: String, baseURL: URL?) -> WKNavigation? { nil }
    @discardableResult open func loadFileURL(_ url: URL, allowingReadAccessTo: URL) -> WKNavigation? { nil }
    @discardableResult open func reload() -> WKNavigation? { nil }
    @discardableResult open func goBack() -> WKNavigation? { nil }
    @discardableResult open func goForward() -> WKNavigation? { nil }
    open func stopLoading() {}
    open func evaluateJavaScript(_ js: String, completionHandler: (@MainActor @Sendable (Any?, Error?) -> Void)? = nil) {}
    open func callAsyncJavaScript(_ functionBody: String, arguments: [String: Any] = [:], in frame: WKFrameInfo? = nil, in contentWorld: WKContentWorld, completionHandler: (@MainActor @Sendable (Result<Any, Error>) -> Void)? = nil) {}
}
