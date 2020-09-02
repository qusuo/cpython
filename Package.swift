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
            checksum: "fe31b43cceafdc7b16ab7c5fcb9f1af19e22341eeb5fc6d4c84373b596277a56"
        ),
        .binaryTarget(
            name: "pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pythonA.xcframework.zip",
            checksum: "2dc66a61f22bac116f28c07e5ec0a00b581169c83615d3d3ed74cc5fbf4168ae"
        ),
        .binaryTarget(
            name: "pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pythonB.xcframework.zip",
            checksum: "acd83d753ad610816bd7ed99102cd2f1b63f51a84a80f667d6f29bbe7d6247f2"
        ),
        .binaryTarget(
            name: "pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pythonC.xcframework.zip",
            checksum: "b8c246c01ba3b081b482f189e3deff027c05a8907e24faa4a4c89f19a9d2ddc8"
        ),
        .binaryTarget(
            name: "pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pythonD.xcframework.zip",
            checksum: "1e6798bbcaccdc7e504198531f88b55e84baace50cc8edd2e559e000987a936e"
        ),
        .binaryTarget(
            name: "pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pythonE.xcframework.zip",
            checksum: "2c717361d89810f37f287ec5b2890d9a3dcd187bda5dae24dffb2d0709b9423f"
        )
    ]
)
/*
fe31b43cceafdc7b16ab7c5fcb9f1af19e22341eeb5fc6d4c84373b596277a56
2dc66a61f22bac116f28c07e5ec0a00b581169c83615d3d3ed74cc5fbf4168ae
acd83d753ad610816bd7ed99102cd2f1b63f51a84a80f667d6f29bbe7d6247f2
b8c246c01ba3b081b482f189e3deff027c05a8907e24faa4a4c89f19a9d2ddc8
1e6798bbcaccdc7e504198531f88b55e84baace50cc8edd2e559e000987a936e
2c717361d89810f37f287ec5b2890d9a3dcd187bda5dae24dffb2d0709b9423f
*/
