// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "KeyboardAvoider",
    defaultLocalization: "en",
    platforms: [
        .iOS("13.4")
    ],
    products: [
        .library(name: "KeyboardAvoider", targets: ["KeyboardAvoider"])
    ],
    targets: [
        .target(
            name: "KeyboardAvoider",
            path: "KeyboardAvoider",
            exclude: [
                "Info.plist",
            ]
        )
    ]
)
