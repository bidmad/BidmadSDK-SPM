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
      url: "https://github.com/bidmad/BidmadSDK-SPM/releases/download/7.2.0-dev.2/BidmadSDK.xcframework.zip",
      checksum: "1abf9eb63a34c0c57d5d7e42a37851ee7bfdabf0aec17c7f8f3ce487704fdada"
    ),
    .binaryTarget(
      name: "OpenBiddingHelper",
      url: "https://github.com/bidmad/BidmadSDK-SPM/releases/download/7.2.0-dev.2/OpenBiddingHelper.xcframework.zip",
      checksum: "dd1b5279eb0dd8e35a083f63b4a74a583d39c5cf41eb08856b527e5301823e97"
    ),
    .binaryTarget(
      name: "BidmadGoogleGDPRAdapter",
      url: "https://github.com/bidmad/BidmadSDK-SPM/releases/download/7.2.0-dev.2/BidmadGoogleGDPRAdapter.xcframework.zip",
      checksum: "e21d1db50c0a6cd61cbbbdc1a0eb882454e276286dfe14bf2b42493d37d1ec0c"
    ),
  ]
)
