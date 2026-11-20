# Yodo1 MAS iOS SDK - Yodo1MasMediationYso

Yodo1 MAS (Managed Ad Services) iOS SDK for Swift Package Manager.
This package contains the Yodo1MasMediationYso network and its adapters.

## Requirements

| Requirement | Value |
|-------------|-------|
| iOS | 15.0+ |
| Swift tools | 5.6+ |
| Xcode (tested with) | 26.1.1 |

## Installation

To integrate the Yodo1MasMediationYso network using Swift Package Manager:

### 1. Add the package

#### Xcode

1. **File → Add Package Dependencies…**
2. Enter the repository URL:

   ```
   https://github.com/Yodo1Games/MAS-Swift-Package-Yso.git
   ```

3. Choose a dependency rule: an exact version you pick from this repository's tags (every Yodo1 MAS package in a project must pin the same one).
4. Add `Yodo1MasMediationYso` to your target when prompted, then click **Add Package**.

#### Package.swift

```swift
dependencies: [
    .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Yso.git", exact: "<version>")
]
```

> Replace `<version>` with a tag from this repository (listed under **Tags**
> or **Releases**). Prerelease tags carry a `-beta.N` suffix, where `N` is
> the prerelease number.

Then add `Yodo1MasMediationYso` to your target:

```swift
.target(
    name: "MyApp",
    dependencies: [
        .product(name: "Yodo1MasMediationYso", package: "MAS-Swift-Package-Yso"),
    ]
)
```

### 2. Add the `-ObjC` linker flag (required)

The SDK ships as **static** frameworks, so your app must link with `-ObjC`.
This is **required**: without it the linker drops the SDK's mediation adapters
and Objective-C categories, and ads silently fail to load.

In Xcode, go to **Build Settings**, search for **Other Linker Flags**, and add
`-ObjC` (equivalently, set `OTHER_LDFLAGS = $(inherited) -ObjC` in an
`.xcconfig`).

Check out our [iOS integration guide](https://developers.yodo1.com/docs/sdk/guides/ios/integration)
for more info on getting started with the Yodo1 MAS SDK.

## Products

`Yodo1MasMediationYso` contains the network's mediation code and links the ad-network SDK it needs, pulling in `Yodo1MasCore` transitively. Adding the product alone is enough; listing `Yodo1MasCore` as well is harmless but redundant.

Individual adapters are available as separate products. Copy the lines you need into your target's `dependencies` (or select the same products in Xcode):

```swift
// YSO Network
.product(name: "Yodo1MasMediationYso", package: "MAS-Swift-Package-Yso"),
.product(name: "Yodo1MasMediationYso-AppLovinMediationYSONetworkAdapter", package: "MAS-Swift-Package-Yso"),
```

> Only the products you add to your target — and their transitive dependencies
> — are built and linked.

### Combining networks

Each network is its own package, and the `Yodo1MasFull` repository lists every
network package. Add the repository URL of every network you use and keep every
package on the same exact version: the packages pin each other, so a mixed set
must resolve to a single version. For the standard set of networks in a single
dependency, use `Yodo1MasFull` itself from https://github.com/Yodo1Games/MAS-Swift-Package-Full.git.

CSJ, Tencent and ToBid are distributed through CocoaPods only and have no Swift Package Manager product.

## License

Copyright (c) 2020-2026 Yodo1 Games. See [LICENSE](LICENSE).
