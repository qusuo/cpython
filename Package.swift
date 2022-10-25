// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Python",
	products: [
		.library(name: "Python", targets: ["python3_ios", "pythonA", "pythonB", "pythonC", "pythonD", "pythonE"])
	],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/python3_ios.xcframework.zip",
            checksum: "18d17a392f39aea245f5b7235701dd430a49be33f9295acf6f4bb764cb4c297e"
        ),
        .binaryTarget(
            name: "pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pythonA.xcframework.zip",
            checksum: "05497de604e6f2821fb8ddc09118f2e4198a44ffab5ea7c4a2a955ffb9e21353"
        ),
        .binaryTarget(
            name: "pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pythonB.xcframework.zip",
            checksum: "ed588a87941ce589cde8bdfdbced65889bdf0820ffdcbcc86fb0196941dfeb2e"
        ),
        .binaryTarget(
            name: "pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pythonC.xcframework.zip",
            checksum: "8b78c572329e13260ed20b6e8f077de02fd954acb92a7613ce36cc6f812a2a19"
        ),
        .binaryTarget(
            name: "pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pythonD.xcframework.zip",
            checksum: "4840f19d31c1ca18335b46f72f3433c7c35777308f66d4606b2b40b35763f989"
        ),
        .binaryTarget(
            name: "pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pythonE.xcframework.zip",
            checksum: "2110527250db7b943718d4e9e2c091bad98c54dcd9ed17de4e351c0f7d237fe5"
        )
    ]
)

