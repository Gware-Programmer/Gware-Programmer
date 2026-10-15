public struct UTType: Hashable, Sendable {
    public let identifier: String
    public init(_ id: String) { identifier = id }
    public static let json = UTType("public.json")
    public static let pdf = UTType("com.adobe.pdf")
    public static let folder = UTType("public.folder")
    public static let plainText = UTType("public.plain-text")
    public static let zip = UTType("public.zip-archive")
    public static let item = UTType("public.item")
    public init?(filenameExtension: String) { identifier = filenameExtension }
}
