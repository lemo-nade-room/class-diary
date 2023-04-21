// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "api",
    platforms: [
       .macOS(.v12)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
                .product(name: "Vapor", package: "vapor"),
                .target(name: "Storage"),
                .target(name: "Entity"),
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        
        .target(name: "Repository", dependencies: [
            .target(name: "Usecase"),
            .target(name: "Entity")
        ]),
        
        .target(name: "Storage", dependencies: [
            .target(name: "Entity"),
            .target(name: "Usecase"),
            .product(name: "Fluent", package: "fluent"),
        ]),
        .testTarget(name: "StorageTests", dependencies: [
            .target(name: "Storage"),
            .target(name: "App"),
            .product(name: "Vapor", package: "vapor"),
            .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
        ]),
        
        .target(name: "Usecase", dependencies: [
            .target(name: "Entity"),
        ]),
        .testTarget(name: "UsecaseTests", dependencies: [
            .target(name: "Usecase"),
        ]),
        
        .target(name: "Entity"),
        .testTarget(name: "EntityTests", dependencies: [.target(name: "Entity")]),
        
        .executableTarget(name: "Run", dependencies: [.target(name: "App")]),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)
