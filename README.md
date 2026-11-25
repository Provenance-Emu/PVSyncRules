# PVSyncRules

The rules for what an emulator app syncs: `SyncClassifier` decides what a file is
(save state, battery save, ROM, BIOS, …), `SyncableFileType` names the kinds, and
`SyncPolicy` holds the user's sync switches. Pure value types, no I/O; shared by iCube,
Provenance and the PV* sync packages (PVCloudSync, PVContinuity).

```swift
.package(url: "https://github.com/Provenance-Emu/PVSyncRules.git", .upToNextMajor(from: "1.0.0"))
```

Extracted on 2026-10-17 from iCube's `Source/iOS/PVSyncRules` (Provenance-Emu/iCube
`093cefdccc`), with history.

## Prebuilt XCFramework

A version tag resolves to a prebuilt XCFramework: the tag's `Package.swift` is a
`binaryTarget` pointing at the tag's GitHub Release, so an app that depends on a version
compiles none of this package. `main` and every other branch build from source.

To build a tagged version from source (to step into it in the debugger, say), set
`PV_BUILD_FROM_SOURCE=1` in the environment `xcodebuild` or Xcode starts in, then resolve
packages again.

To release, run **Release XCFramework** from the Actions tab with the new version. Do not
push version tags by hand: such a tag has no binary and builds from source.
[How releases work](https://github.com/Provenance-Emu/.github/blob/main/docs/xcframework-releases.md).
