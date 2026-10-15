@_exported import Foundation
#if canImport(FoundationNetworking)
@_exported import FoundationNetworking
#endif
import UniformTypeIdentifiers

@preconcurrency @MainActor open class NSResponder: NSObject {}
@preconcurrency @MainActor open class NSView: NSResponder {
    public override init() {}
    public init(frame: NSRect) {}
    open var window: NSWindow? { nil }
    open var frame: NSRect = .zero
    open func removeFromSuperview() {}
    open func addSubview(_ v: NSView) {}
}
@preconcurrency @MainActor open class NSViewController: NSResponder {
    open var view: NSView = NSView()
    open var preferredContentSize: NSSize = .zero
}
@preconcurrency @MainActor public protocol NSWindowDelegate: NSObjectProtocol {
    func windowWillClose(_ notification: Notification)
    func windowShouldClose(_ sender: NSWindow) -> Bool
}
extension NSWindowDelegate {
    public func windowWillClose(_ notification: Notification) {}
    public func windowShouldClose(_ sender: NSWindow) -> Bool { true }
}
@preconcurrency @MainActor open class NSWindow: NSResponder {
    public struct StyleMask: OptionSet, Sendable { public let rawValue: UInt; public init(rawValue: UInt) { self.rawValue = rawValue }
        public static let titled = StyleMask(rawValue: 1), closable = StyleMask(rawValue: 2), miniaturizable = StyleMask(rawValue: 4), resizable = StyleMask(rawValue: 8), fullSizeContentView = StyleMask(rawValue: 16) }
    public enum BackingStoreType: UInt, Sendable { case retained, nonretained, buffered }
    public init(contentRect: NSRect, styleMask: StyleMask, backing: BackingStoreType, defer flag: Bool) {}
    public convenience init(contentViewController: NSViewController) { self.init(contentRect: .zero, styleMask: [], backing: .buffered, defer: false) }
    open var isReleasedWhenClosed: Bool = true
    open var title: String = ""
    open var contentViewController: NSViewController?
    open var contentView: NSView?
    open var frame: NSRect = .zero
    open var isVisible: Bool = false
    open weak var delegate: NSWindowDelegate?
    open func setContentSize(_ s: NSSize) {}
    open func setFrameTopLeftPoint(_ p: NSPoint) {}
    open func center() {}
    open func makeKeyAndOrderFront(_ sender: Any?) {}
    open func close() {}
    open func orderFront(_ sender: Any?) {}
}
@preconcurrency @MainActor open class NSColor: NSObject {
    public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {}
    public static var clear: NSColor { NSColor(red: 0, green: 0, blue: 0, alpha: 0) }
}
@preconcurrency @MainActor open class NSImage: NSObject {
    public init?(systemSymbolName: String, accessibilityDescription: String?) {}
}
@preconcurrency @MainActor open class NSWorkspace: NSObject {
    public static let shared = NSWorkspace()
    public static let didMountNotification = Notification.Name("didMount")
    public static let didUnmountNotification = Notification.Name("didUnmount")
    public let notificationCenter = NotificationCenter()
    @discardableResult open func open(_ url: URL) -> Bool { true }
    open func activateFileViewerSelecting(_ urls: [URL]) {}
    open func selectFile(_ path: String?, inFileViewerRootedAtPath root: String) -> Bool { true }
}
@preconcurrency @MainActor public protocol NSApplicationDelegate: NSObjectProtocol {
    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool
    func applicationDidFinishLaunching(_ notification: Notification)
    func application(_ application: NSApplication, open urls: [URL])
}
extension NSApplicationDelegate {
    public func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply { .terminateNow }
    public func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool { false }
    public func applicationDidFinishLaunching(_ notification: Notification) {}
    public func application(_ application: NSApplication, open urls: [URL]) {}
}
@preconcurrency @MainActor open class NSApplication: NSResponder {
    public static let shared = NSApplication()
    public static let didBecomeActiveNotification = Notification.Name("didBecomeActive")
    public static let willTerminateNotification = Notification.Name("willTerminate")
    public enum TerminateReply: UInt, Sendable { case terminateCancel, terminateNow, terminateLater }
    public struct ModalResponse: Equatable, Sendable { public let rawValue: Int; public init(rawValue: Int) { self.rawValue = rawValue }
        public static let OK = ModalResponse(rawValue: 1), cancel = ModalResponse(rawValue: 0)
        public static let alertFirstButtonReturn = ModalResponse(rawValue: 1000), alertSecondButtonReturn = ModalResponse(rawValue: 1001), alertThirdButtonReturn = ModalResponse(rawValue: 1002) }
    open func reply(toApplicationShouldTerminate shouldTerminate: Bool) {}
    open func activate(ignoringOtherApps flag: Bool) {}
    open func terminate(_ sender: Any?) {}
    open var windows: [NSWindow] { [] }
    open var keyWindow: NSWindow? { nil }
}
public var NSApp: NSApplication! { NSApplication.shared }
@preconcurrency @MainActor open class NSSavePanel: NSObject {
    open var nameFieldStringValue: String = ""
    open var allowedContentTypes: [UTType] = []
    open var canCreateDirectories: Bool = false
    open var directoryURL: URL?
    open var url: URL?
    open var message: String = ""
    open var prompt: String = ""
    open var title: String = ""
    @discardableResult open func runModal() -> NSApplication.ModalResponse { .OK }
    open func begin(completionHandler: @escaping (NSApplication.ModalResponse) -> Void) {}
    open func beginSheetModal(for window: NSWindow, completionHandler: @escaping (NSApplication.ModalResponse) -> Void) {}
}
@preconcurrency @MainActor open class NSOpenPanel: NSSavePanel {
    open var canChooseDirectories: Bool = false
    open var canChooseFiles: Bool = true
    open var allowsMultipleSelection: Bool = false
    open var urls: [URL] = []
}
@preconcurrency @MainActor open class NSAlert: NSObject {
    public enum Style: UInt, Sendable { case warning, informational, critical }
    open var alertStyle: Style = .warning
    open var messageText: String = ""
    open var informativeText: String = ""
    @discardableResult open func addButton(withTitle title: String) -> NSObject { NSObject() }
    @discardableResult open func runModal() -> NSApplication.ModalResponse { .alertFirstButtonReturn }
}
@preconcurrency @MainActor open class NSPasteboard: NSObject {
    public static let general = NSPasteboard()
    open func clearContents() -> Int { 0 }
    open func setString(_ s: String, forType t: NSPasteboard.PasteboardType) -> Bool { true }
    public struct PasteboardType: Sendable { public let rawValue: String; public static let string = PasteboardType(rawValue: "public.utf8-plain-text") }
}
