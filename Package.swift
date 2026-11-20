// swift-tools-version: 5.6
// Copyright © 2026 Yodo1 Games. All rights reserved.

import PackageDescription

let package = Package(
    name: "Yodo1MasMediationYso",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Yodo1MasMediationYso", targets: ["Yodo1MasMediationYsoTarget"]),
        .library(name: "Yodo1MasMediationYso-AppLovinMediationYSONetworkAdapter", targets: ["Yodo1MasMediationYso-AppLovinMediationYSONetworkAdapterTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: "13.6.4"),
        .package(url: "https://bitbucket.org/ysocorp/ysonetwork-ios-sdk.git", exact: "1.2.1"),
        .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Core.git", exact: "5.0.0-beta.5"),
    ],
    targets: [
        // ==================== Yodo1MasMediationYso ====================
        .target(
            name: "Yodo1MasMediationYsoTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationYso"),
                .product(name: "Yodo1MasCore", package: "MAS-Swift-Package-Core"),
                .product(name: "YsoNetwork", package: "ysonetwork-ios-sdk"),
            ],
            path: "Sources/Yodo1MasMediationYsoTarget",
            resources: [.copy("Yodo1MasYso.plist")]
        ),
        .binaryTarget(
            name: "Yodo1MasMediationYso",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationYso/Yodo1MasMediationYso-5.0.0-beta.5.zip",
            checksum: "5a92e5e470aead90a0ffee5e7e1349551dae9f890d3a6a20fa0f74df0720bf6d"
        ),
        // ==================== Yodo1MasMediationYso-AppLovinMediationYSONetworkAdapter ====================
        .target(
            name: "Yodo1MasMediationYso-AppLovinMediationYSONetworkAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationYsoTarget"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                .target(name: "AppLovinMediationYSONetworkAdapter"),
            ],
            path: "Sources/Yodo1MasMediationYso-AppLovinMediationYSONetworkAdapterTarget"
        ),
        .binaryTarget(
            name: "AppLovinMediationYSONetworkAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationYso/AppLovinMediationYSONetworkAdapter-5.0.0-beta.5.zip",
            checksum: "9c66ec75fc037b8d40b5ecea4d7e95df9406ae910e4380b0d62553ed1fa8362c"
        ),
    ]
)
