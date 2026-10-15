// swift-tools-version:5.9
// O MAPA — app de Mac para estudar e praticar até criar a sua própria IA.
// Construa com ./construir.sh (monta o O MAPA.app em build/).
import PackageDescription

let package = Package(
    name: "OMapa",
    platforms: [.macOS(.v13)],
    targets: [
        .executableTarget(name: "OMapa", path: "Sources/OMapa")
    ]
)
