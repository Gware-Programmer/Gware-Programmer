@_exported import Foundation
@_exported import Combine
import AppKit

// ── núcleo de View ──
@preconcurrency @MainActor public protocol View {
    associatedtype Body: View
    @ViewBuilder @MainActor var body: Body { get }
}
extension Never: View { public typealias Body = Never; public var body: Never { fatalError() } }
public struct EmptyView: View { public init() {}; public var body: Never { fatalError() } }
public struct TupleView<T>: View { public init(_ v: T) {}; public var body: Never { fatalError() } }
public struct _ConditionalContent<A: View, B: View>: View { public var body: Never { fatalError() } }
extension Optional: View where Wrapped: View { public var body: Never { fatalError() } }
public struct AnyView: View { public init<V: View>(_ v: V) {}; public var body: Never { fatalError() } }

@resultBuilder public enum ViewBuilder {
    public static func buildBlock() -> EmptyView { EmptyView() }
    public static func buildBlock<C: View>(_ c: C) -> C { c }
    public static func buildBlock<each C: View>(_ c: repeat each C) -> TupleView<(repeat each C)> { TupleView((repeat each c)) }
    public static func buildExpression<C: View>(_ c: C) -> C { c }
    public static func buildIf<C: View>(_ c: C?) -> C? { c }
    public static func buildOptional<C: View>(_ c: C?) -> C? { c }
    public static func buildEither<A: View, B: View>(first: A) -> _ConditionalContent<A, B> { _ConditionalContent() }
    public static func buildEither<A: View, B: View>(second: B) -> _ConditionalContent<A, B> { _ConditionalContent() }
    public static func buildLimitedAvailability<C: View>(_ c: C) -> AnyView { AnyView(c) }
}

public struct ModifiedContent<Content: View>: View { public var body: Never { fatalError() } }

// ── estilos e valores ──
public protocol ShapeStyle {}
public struct Color: View, ShapeStyle {
    public init(red: Double, green: Double, blue: Double, opacity: Double = 1) {}
    public init(nsColor: NSColor) {}
    public static let red = Color(red: 1, green: 0, blue: 0), white = Color(red: 1, green: 1, blue: 1), black = Color(red: 0, green: 0, blue: 0)
    public static let accentColor = Color(red: 0, green: 0, blue: 1), clear = Color(red: 0, green: 0, blue: 0, opacity: 0)
    public static let primary = Color(red: 0, green: 0, blue: 0), secondary = Color(red: 0.5, green: 0.5, blue: 0.5), orange = Color(red: 1, green: 0.5, blue: 0)
    public var body: Never { fatalError() }
    public func opacity(_ o: Double) -> Color { self }
}
public struct HierarchicalShapeStyle: ShapeStyle { public static let primary = HierarchicalShapeStyle(), secondary = HierarchicalShapeStyle(), tertiary = HierarchicalShapeStyle() }
extension ShapeStyle where Self == HierarchicalShapeStyle {
    public static var secondary: HierarchicalShapeStyle { HierarchicalShapeStyle() }
    public static var tertiary: HierarchicalShapeStyle { HierarchicalShapeStyle() }
}
public struct Font: Sendable {
    public enum Weight: Sendable { case regular, medium, semibold, bold, heavy, light }
    public enum Design: Sendable { case `default`, monospaced, rounded, serif }
    public static func system(size: CGFloat, weight: Weight = .regular, design: Design = .default) -> Font { Font() }
    public static func system(_ style: Font, design: Design = .default) -> Font { Font() }
    public static let title = Font(), title2 = Font(), title3 = Font(), headline = Font(), body = Font(), callout = Font(), caption = Font(), footnote = Font(), largeTitle = Font(), subheadline = Font()
    public func monospacedDigit() -> Font { self }
    public func weight(_ w: Weight) -> Font { self }
}
public struct Alignment: Sendable { public static let leading = Alignment(), center = Alignment(), trailing = Alignment(), topLeading = Alignment(), top = Alignment(), bottomLeading = Alignment() }
public enum HorizontalAlignment: Sendable { case leading, center, trailing }
public enum VerticalAlignment: Sendable { case top, center, bottom, firstTextBaseline }
public struct Edge { public struct Set: OptionSet, Sendable { public let rawValue: Int; public init(rawValue: Int) { self.rawValue = rawValue }
    public static let top = Set(rawValue: 1), bottom = Set(rawValue: 2), leading = Set(rawValue: 4), trailing = Set(rawValue: 8)
    public static let horizontal: Set = [.leading, .trailing], vertical: Set = [.top, .bottom], all: Set = [.top, .bottom, .leading, .trailing] } }
public enum ColorScheme: Sendable { case light, dark }
public enum ControlSize: Sendable { case mini, small, regular, large }
public struct TextSelectability: Sendable { public static let enabled = TextSelectability(), disabled = TextSelectability() }
public struct KeyEquivalent: ExpressibleByExtendedGraphemeClusterLiteral, Sendable { public init(extendedGraphemeClusterLiteral c: Character) {}; public init(_ c: Character) {}
    public static let `return` = KeyEquivalent("\r"), escape = KeyEquivalent("\u{1b}"), delete = KeyEquivalent("\u{8}"), space = KeyEquivalent(" ") }
public struct EventModifiers: OptionSet, Sendable { public let rawValue: Int; public init(rawValue: Int) { self.rawValue = rawValue }
    public static let command = EventModifiers(rawValue: 1), shift = EventModifiers(rawValue: 2), option = EventModifiers(rawValue: 4), control = EventModifiers(rawValue: 8) }
public struct KeyboardShortcut: Sendable { public static let defaultAction = KeyboardShortcut(), cancelAction = KeyboardShortcut()
    public init() {}; public init(_ key: KeyEquivalent, modifiers: EventModifiers = .command) {} }
public protocol PrimitiveButtonStyle {}
public struct BorderlessButtonStyle: PrimitiveButtonStyle { public init() {} }
public struct BorderedButtonStyle: PrimitiveButtonStyle { public init() {} }
public struct PlainButtonStyle: PrimitiveButtonStyle { public init() {} }
extension PrimitiveButtonStyle where Self == BorderlessButtonStyle { public static var borderless: BorderlessButtonStyle { BorderlessButtonStyle() } }
extension PrimitiveButtonStyle where Self == BorderedButtonStyle { public static var bordered: BorderedButtonStyle { BorderedButtonStyle() } }
extension PrimitiveButtonStyle where Self == PlainButtonStyle { public static var plain: PlainButtonStyle { PlainButtonStyle() } }
public enum Text_TruncationMode: Sendable { case head, middle, tail }
public struct LocalizedStringKey: ExpressibleByStringLiteral, ExpressibleByStringInterpolation { public init(stringLiteral: String) {}; public init(_ s: String) {} }

// ── modificadores ──
extension View {
    public func frame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> ModifiedContent<Self> { ModifiedContent() }
    public func frame(minWidth: CGFloat? = nil, idealWidth: CGFloat? = nil, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, idealHeight: CGFloat? = nil, maxHeight: CGFloat? = nil, alignment: Alignment = .center) -> ModifiedContent<Self> { ModifiedContent() }
    public func padding(_ length: CGFloat? = nil) -> ModifiedContent<Self> { ModifiedContent() }
    public func padding(_ edges: Edge.Set, _ length: CGFloat? = nil) -> ModifiedContent<Self> { ModifiedContent() }
    public func background<S: View>(_ s: S) -> ModifiedContent<Self> { ModifiedContent() }
    public func foregroundStyle<S: ShapeStyle>(_ s: S) -> ModifiedContent<Self> { ModifiedContent() }
    public func foregroundColor(_ c: Color?) -> ModifiedContent<Self> { ModifiedContent() }
    public func font(_ f: Font?) -> ModifiedContent<Self> { ModifiedContent() }
    public func preferredColorScheme(_ c: ColorScheme?) -> ModifiedContent<Self> { ModifiedContent() }
    public func controlSize(_ s: ControlSize) -> ModifiedContent<Self> { ModifiedContent() }
    public func buttonStyle<S: PrimitiveButtonStyle>(_ s: S) -> ModifiedContent<Self> { ModifiedContent() }
    public func help(_ s: String) -> ModifiedContent<Self> { ModifiedContent() }
    public func disabled(_ d: Bool) -> ModifiedContent<Self> { ModifiedContent() }
    public func lineLimit(_ n: Int?) -> ModifiedContent<Self> { ModifiedContent() }
    public func truncationMode(_ m: Text_TruncationMode) -> ModifiedContent<Self> { ModifiedContent() }
    public func textSelection(_ s: TextSelectability) -> ModifiedContent<Self> { ModifiedContent() }
    public func onAppear(perform action: (() -> Void)? = nil) -> ModifiedContent<Self> { ModifiedContent() }
    public func onDisappear(perform action: (() -> Void)? = nil) -> ModifiedContent<Self> { ModifiedContent() }
    public func keyboardShortcut(_ key: KeyEquivalent, modifiers: EventModifiers = .command) -> ModifiedContent<Self> { ModifiedContent() }
    public func keyboardShortcut(_ s: KeyboardShortcut) -> ModifiedContent<Self> { ModifiedContent() }
    public func opacity(_ o: Double) -> ModifiedContent<Self> { ModifiedContent() }
    public func tag<T: Hashable>(_ t: T) -> ModifiedContent<Self> { ModifiedContent() }
    public func labelStyle<S>(_ s: S) -> ModifiedContent<Self> { ModifiedContent() }
    public func multilineTextAlignment(_ a: HorizontalAlignment) -> ModifiedContent<Self> { ModifiedContent() }
    public func fixedSize() -> ModifiedContent<Self> { ModifiedContent() }
}

// ── vistas ──
public struct Text: View {
    public init(_ s: String) {}
    public init(_ k: LocalizedStringKey) {}
    public init(verbatim s: String) {}
    public var body: Never { fatalError() }
    public func bold() -> Text { self }
    public func font(_ f: Font?) -> Text { self }
}
public struct Image: View { public init(systemName: String) {}; public var body: Never { fatalError() } }
public struct Spacer: View { public init(minLength: CGFloat? = nil) {}; public var body: Never { fatalError() } }
public struct Divider: View { public init() {}; public var body: Never { fatalError() } }
public struct ProgressView: View { public init() {}; public init(_ title: String) {}; public var body: Never { fatalError() } }
public struct Group<Content>: View { public init(@ViewBuilder content: () -> Content) where Content: View {}; public var body: Never { fatalError() } }
public struct VStack<Content: View>: View { public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {}; public var body: Never { fatalError() } }
public struct HStack<Content: View>: View { public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {}; public var body: Never { fatalError() } }
public struct Button<Label: View>: View {
    public init(action: @escaping () -> Void, @ViewBuilder label: () -> Label) {}
    public var body: Never { fatalError() }
}
extension Button where Label == Text {
    public init(_ title: String, action: @escaping () -> Void) {}
    public init(_ title: LocalizedStringKey, action: @escaping () -> Void) {}
}
public struct Label<T: View, I: View>: View { public var body: Never { fatalError() } }
extension Label where T == Text, I == Image { public init(_ title: String, systemImage: String) {} }

// ── estado ──
@propertyWrapper public struct StateObject<O: ObservableObject>: DynamicProperty {
    public init(wrappedValue: @autoclosure @escaping () -> O) { make = wrappedValue }
    let make: () -> O
    public var wrappedValue: O { make() }
}
@propertyWrapper public struct ObservedObject<O: ObservableObject>: DynamicProperty {
    public init(wrappedValue: O) { self.wrappedValue = wrappedValue }
    public var wrappedValue: O
}
@propertyWrapper public struct State<V>: DynamicProperty {
    public init(wrappedValue: V) { self.wrappedValue = wrappedValue }
    public var wrappedValue: V
}
public protocol DynamicProperty {}
@propertyWrapper public struct NSApplicationDelegateAdaptor<D: NSObject & NSApplicationDelegate>: DynamicProperty {
    public init(_ t: D.Type) {}
    public var wrappedValue: D { fatalError() }
}
@propertyWrapper public struct Environment<V>: DynamicProperty {
    public init(_ k: KeyPath<EnvironmentValues, V>) {}
    public var wrappedValue: V { fatalError() }
}
public struct EnvironmentValues { public var openWindow: OpenWindowAction { OpenWindowAction() } }
public struct OpenWindowAction { public func callAsFunction(id: String) {}; public func callAsFunction<V: Codable & Hashable>(id: String, value: V) {} }

// ── NSViewRepresentable ──
@preconcurrency @MainActor public protocol NSViewRepresentable: View where Body == Never {
    associatedtype NSViewType: NSView
    associatedtype Coordinator = Void
    typealias Context = NSViewRepresentableContext<Self>
    func makeNSView(context: Context) -> NSViewType
    func updateNSView(_ nsView: NSViewType, context: Context)
    static func dismantleNSView(_ nsView: NSViewType, coordinator: Coordinator)
    func makeCoordinator() -> Coordinator
}
extension NSViewRepresentable where Coordinator == Void { public func makeCoordinator() -> Coordinator { () } }
extension NSViewRepresentable { public static func dismantleNSView(_ nsView: NSViewType, coordinator: Coordinator) {}; public var body: Never { fatalError() } }
public struct NSViewRepresentableContext<R: NSViewRepresentable> { public var coordinator: R.Coordinator { fatalError() } }

public struct NSHostingSizingOptions: OptionSet, Sendable { public let rawValue: Int; public init(rawValue: Int) { self.rawValue = rawValue }
    public static let minSize = NSHostingSizingOptions(rawValue: 1), intrinsicContentSize = NSHostingSizingOptions(rawValue: 2), maxSize = NSHostingSizingOptions(rawValue: 4), preferredContentSize = NSHostingSizingOptions(rawValue: 8) }
@preconcurrency @MainActor open class NSHostingController<Content: View>: NSViewController {
    public init(rootView: Content) {}
    public var rootView: Content { fatalError() }
    public var sizingOptions: NSHostingSizingOptions = []
}

// ── cenas, app e menus ──
@preconcurrency @MainActor public protocol Scene { associatedtype Body: Scene; @SceneBuilder @MainActor var body: Body { get } }
public struct _SceneTuple<T>: Scene { public var body: Never { fatalError() } }
extension Never: Scene {}
@resultBuilder public enum SceneBuilder {
    public static func buildBlock<C: Scene>(_ c: C) -> C { c }
    public static func buildBlock<each C: Scene>(_ c: repeat each C) -> _SceneTuple<(repeat each C)> { _SceneTuple() }
    public static func buildExpression<C: Scene>(_ c: C) -> C { c }
}
public struct ModifiedScene<S: Scene>: Scene { public var body: Never { fatalError() } }
public struct Window<Content: View>: Scene { public init(_ title: String, id: String, @ViewBuilder content: () -> Content) {}; public var body: Never { fatalError() } }
public struct WindowGroup<Content: View>: Scene { public init(@ViewBuilder content: () -> Content) {}; public var body: Never { fatalError() } }
public struct Settings<Content: View>: Scene { public init(@ViewBuilder content: () -> Content) {}; public var body: Never { fatalError() } }
public struct MenuBarExtra<Content: View>: Scene {
    public init(_ title: String, systemImage: String, @ViewBuilder content: () -> Content) {}
    public init(_ title: String, systemImage: String, isInserted: Bool, @ViewBuilder content: () -> Content) {}
    public var body: Never { fatalError() }
}
public enum MenuBarExtraStyleKind { case menu, window }
public protocol Commands {}
public struct _CommandsTuple<T>: Commands {}
@resultBuilder public enum CommandsBuilder {
    public static func buildBlock<C: Commands>(_ c: C) -> C { c }
    public static func buildBlock<each C: Commands>(_ c: repeat each C) -> _CommandsTuple<(repeat each C)> { _CommandsTuple() }
    public static func buildExpression<C: Commands>(_ c: C) -> C { c }
}
public struct CommandGroupPlacement: Sendable { public static let newItem = CommandGroupPlacement(), saveItem = CommandGroupPlacement(), appInfo = CommandGroupPlacement(), help = CommandGroupPlacement(), toolbar = CommandGroupPlacement(), undoRedo = CommandGroupPlacement(), appSettings = CommandGroupPlacement() }
public struct CommandGroup<Content: View>: Commands {
    public init(replacing: CommandGroupPlacement, @ViewBuilder addition: () -> Content) {}
    public init(after: CommandGroupPlacement, @ViewBuilder addition: () -> Content) {}
    public init(before: CommandGroupPlacement, @ViewBuilder addition: () -> Content) {}
}
public struct CommandMenu<Content: View>: Commands { public init(_ name: String, @ViewBuilder content: () -> Content) {} }
extension Scene {
    public func defaultSize(width: CGFloat, height: CGFloat) -> ModifiedScene<Self> { ModifiedScene() }
    public func commands<C: Commands>(@CommandsBuilder content: () -> C) -> ModifiedScene<Self> { ModifiedScene() }
    public func menuBarExtraStyle(_ s: MenuBarExtraStyleKind) -> ModifiedScene<Self> { ModifiedScene() }
}
@preconcurrency @MainActor public protocol App { associatedtype Body: Scene; @SceneBuilder @MainActor var body: Body { get }; init() }
extension App { @MainActor public static func main() {} }
extension ShapeStyle where Self == Color {
    public static var red: Color { Color(red: 1, green: 0, blue: 0) }
    public static var orange: Color { Color(red: 1, green: 0.5, blue: 0) }
    public static var accentColor: Color { Color(red: 0, green: 0, blue: 1) }
    public static var white: Color { Color(red: 1, green: 1, blue: 1) }
    public static var primary: Color { Color(red: 0, green: 0, blue: 0) }
}
