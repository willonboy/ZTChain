// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ZTChain",
    platforms: [
        .iOS(.v11), .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "ZTChain",
            targets: ["ZTChain"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ZTChain",
            dependencies: []),
    ],
    swiftLanguageVersions: [.v4_2, .v5]
)
