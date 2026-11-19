// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name: "BidmadSDK",
  platforms: [.iOS(.v15)],
  products: [
    .library(name: "BidmadSDK", targets: ["BidmadSDKTarget"]),
    .library(name: "OpenBiddingHelper", targets: ["OpenBiddingHelperTarget"]),
    // Optional: leave this product out to opt out of the GDPR (UMP) adapter.
    .library(name: "BidmadGoogleGDPRAdapter", targets: ["BidmadGoogleGDPRAdapterLoader"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git",
      exact: "3.1.0"
    ),
  ],
  targets: [
    .target(name: "BidmadSDKTarget", dependencies: ["BidmadSDK"]),
    .target(name: "OpenBiddingHelperTarget", dependencies: ["OpenBiddingHelper", "BidmadSDKTarget"]),
    .target(
      name: "BidmadGoogleGDPRAdapterLoader",
      dependencies: [
        "BidmadGoogleGDPRAdapter",
        "BidmadSDKTarget",
        .product(name: "GoogleUserMessagingPlatform", package: "swift-package-manager-google-user-messaging-platform"),
      ]
    ),
    .binaryTarget(
      name: "BidmadSDK",
      url: "https://github.com/bidmad/BidmadSDK-SPM/releases/download/7.2.0-dev.1/BidmadSDK.xcframework.zip",
      checksum: "77018a85cc8717144eebd728387d72554a5e6cddc3b5a2e616defd4d29ab1461"
    ),
    .binaryTarget(
      name: "OpenBiddingHelper",
      url: "https://github.com/bidmad/BidmadSDK-SPM/releases/download/7.2.0-dev.1/OpenBiddingHelper.xcframework.zip",
      checksum: "df500a85d07a79171a0e117eb922861e6f0f1c977f9d6fd89bef3d2ba096d94c"
    ),
    .binaryTarget(
      name: "BidmadGoogleGDPRAdapter",
      url: "https://github.com/bidmad/BidmadSDK-SPM/releases/download/7.2.0-dev.1/BidmadGoogleGDPRAdapter.xcframework.zip",
      checksum: "727246873f4180097459c1ddbff2ddebcebda19b539f0a78a19a8b4a05b7e9cb"
    ),
  ]
)
