// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "QuickRecorder",
    defaultLocalization: "en",
    platforms: [
        .macOS("12.3")
    ],
    products: [
        .executable(
            name: "QuickRecorder",
            targets: ["QuickRecorder"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/sparkle-project/Sparkle", from: "2.6.4"),
        .package(url: "https://github.com/sindresorhus/KeyboardShortcuts", from: "2.0.1"),
        .package(url: "https://github.com/hidden-spectrum/SwiftLAME", branch: "main"),
        .package(url: "https://github.com/lihaoyun6/MatrixColorSelector.git", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: "QuickRecorder",
            dependencies: [
                "Sparkle",
                "KeyboardShortcuts",
                "SwiftLAME",
                "MatrixColorSelector" 
            ],
            path: "QuickRecorder",
            exclude: ["Info.plist", "QuickRecorder.entitlements"],
            sources: [
                "QuickRecorderApp.swift",
                "RecordEngine.swift", 
                "SCContext.swift",
                "AVContext.swift",
                "Sparkle.swift",
                "ViewModel"
            ],
            resources: [
                .process("Assets.xcassets"),
                .process("Preview Content"),
                .process("zh-Hans.lproj")
            ]
        )
    ]
)
