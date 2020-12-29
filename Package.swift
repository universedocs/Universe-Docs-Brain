// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Universe Docs Brain",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/IBM-Swift/Kitura.git", from: "2.9.1"),
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.9.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Universe Docs Brain",
            dependencies: [.product(name: "Kitura", package: "Kitura"),.product(name: "HeliumLogger", package: "HeliumLogger")]),
        .testTarget(
            name: "Universe Docs BrainTests",
            dependencies: ["Universe Docs Brain"]),
    ]
)
