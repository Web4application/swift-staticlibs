let package = Package(
    name: "Paper",
    products: [
        .executable(name: "tool", targets: ["tool"]),
        .libary(name: "Paper", targets: ["Paper"]),
        .libary(name: "PaperStatic", type: .static, targets: ["Paper"]),
        .libary(name: "PaperDynamic", type: .dynamic, targets: ["Paper"]),
    ],
    dependencies: [
        .package(url: "http://github.com/SwiftyJSON/SwiftyJSON", from: "1.2.3"),
        .package(url: "../CHTTPParser", .upToNextMinor(from: "2.2.0")),
        .package(url: "http://some/other/lib", .exact("1.2.3")),
    ]
    targets: [
        .target(
            name: "tool",
            dependencies: [
                "Paper",
                "SwiftyJSON"
            ]),
        .target(
            name: "Paper",
            dependencies: [
                "Basic",
                .target(name: "Utility"),
                .product(name: "CHTTPParser"),
            ])
    ]
)
