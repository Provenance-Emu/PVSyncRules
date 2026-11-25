// swift-tools-version:5.9
import Foundation
import PackageDescription

// A version tag resolves to the prebuilt XCFramework from that tag's GitHub release;
// `main` always builds from source. The release workflow fills this in on the tagged
// commit only, so it stays `nil` on every branch.
// Set PV_BUILD_FROM_SOURCE=1 to build a tagged version from source instead.
let binaryRelease: (version: String, checksums: [String: String])? = ("1.0.3", ["PVSyncRules": "54681353580538195f5dc9dd0b596d5d4dfc8ade8fd09a3259e6610ca49a452f"])

let environment = ProcessInfo.processInfo.environment
let buildFromSource = binaryRelease == nil || environment["PV_BUILD_FROM_SOURCE"] != nil
// The release workflow builds the framework it publishes from a dynamic product.
let libraryType: Product.Library.LibraryType? = environment["PV_XCFRAMEWORK_BUILD"] != nil ? .dynamic : nil

let sourceTargets: [Target] = [
    .target(name: "PVSyncRules"),
    .testTarget(name: "PVSyncRulesTests", dependencies: ["PVSyncRules"])
]

let binaryTargets: [Target] = binaryRelease.map { release in
    release.checksums.sorted { $0.key < $1.key }.map { module, checksum in
        .binaryTarget(
            name: module,
            url: "https://github.com/Provenance-Emu/PVSyncRules/releases/download/\(release.version)/\(module).xcframework.zip",
            checksum: checksum
        )
    }
} ?? []

let package = Package(
    name: "PVSyncRules",
    platforms: [.iOS(.v17), .tvOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "PVSyncRules", type: buildFromSource ? libraryType : nil, targets: ["PVSyncRules"])
    ],
    targets: buildFromSource ? sourceTargets : binaryTargets
)
