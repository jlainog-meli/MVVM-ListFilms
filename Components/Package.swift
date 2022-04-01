// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Components",
    platforms: [
         .iOS(.v13),
    ],
    products: [
        .library(
            name: "App",
            targets: ["App"]
        ),
        
        .library(
            name: "ListFilms",
            targets: ["ListFilms"]
        ),
        
        .library(
            name: "FilmDetail",
            targets: ["ListFilms"]
        ),
        
        .library(
            name: "FilmsModels",
            targets: ["FilmsModels"]
        ),
        
        .library(
            name: "UIComponents",
            targets: ["UIComponents"]
        ),
        
        .library(
            name: "Helpers",
            targets: ["Helpers"]
        ),
    ],
    dependencies: [
      .package(url: "https://github.com/airbnb/lottie-ios", .upToNextMajor(from: "3.0.0")),
      .package(url: "https://github.com/pointfreeco/combine-schedulers", .upToNextMajor(from: "0.5.0")),
      .package(
        url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
        .upToNextMajor(from: "1.9.0")
      ),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: ["ListFilms", "FilmDetail"]
        ),
        .testTarget(
            name: "AppTests",
            dependencies: [
                "App",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ]
        ),
        
        .target(
            name: "ListFilms",
            dependencies: [
                "FilmsModels", "Helpers", "UIComponents",
                .product(name: "CombineSchedulers", package: "combine-schedulers"),
                
                "FilmDetail" // Optional according to design
            ]
        ),
        .testTarget(
            name: "ListFilmsTests",
            dependencies: [
                "ListFilms",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ]
        ),
        
        .target(
            name: "FilmDetail",
            dependencies: [
                "FilmsModels", "Helpers", "UIComponents",
                .product(name: "CombineSchedulers", package: "combine-schedulers"),
            ]
        ),
        .testTarget(
            name: "FilmDetailTests",
            dependencies: [
                "FilmDetail",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ]
        ),
        
        .target(name: "FilmsModels"),
        
        .target(
            name: "UIComponents",
            dependencies: [
                .product(name: "Lottie", package: "lottie-ios")
            ],
            resources: [.process("Resources")]
        ),
        
        .target(name: "Helpers"),
    ]
)
