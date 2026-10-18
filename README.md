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
