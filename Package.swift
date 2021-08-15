// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HSLayout",
    platforms: [
        .iOS(.v11), .macOS(.v11), .tvOS(.v11)
    ],
    products: [
        .library(
            name: "HSLayout",
            targets: ["HSLayout"]),
    ],
    targets: [
        .target(
            name: "HSLayout",
            path: "Sources")
    ]
)
