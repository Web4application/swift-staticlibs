// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "PaperProject",
    products: [
        // This makes your app runnable
        .executable(name: "paper-app", targets: ["Paper"]),
    ],
    dependencies: [
        // External SemVer dependencies
        .package(url: "https://github.com", from: "5.0.1"),
    ],
    targets: [
        // 1. The System Library Wrapper
        .systemLibrary(
            name: "CGtk3",
            pkgConfig: "gtk+-3.0",
            providers: [
                .brew(["gtk+3"]),
                .apt(["libgtk-3-dev"])
            ]
        ),
        
        // 2. Your App Logic
        .executableTarget(
            name: "Paper",
            dependencies: [
                "CGtk3",      // Links the GTK wrapper
                "SwiftyJSON"  // Links the external JSON library
            ],
            path: "Sources/Paper"
        )
    ]
)
