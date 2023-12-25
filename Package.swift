// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SQLiteSwift.swift",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .watchOS(.v4),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "SQLiteSwift",
            targets: ["SQLiteSwift"]
        )
    ],
    targets: [
        .target(
            name: "SQLiteSwift",
            exclude: [
                "Info.plist"
            ]
        ),
        .testTarget(
            name: "SQLiteTests",
            dependencies: [
                "SQLiteSwift"
            ],
            path: "Tests/SQLiteTests",
            exclude: [
                "Info.plist"
            ],
            resources: [
                .copy("Resources")
            ]
        )
    ]
)

#if os(Linux)
package.dependencies = [
    .package(url: "https://github.com/stephencelis/CSQLite.git", from: "0.0.3")
]
package.targets.first?.dependencies += [
    .product(name: "CSQLite", package: "CSQLite")
]
#endif
