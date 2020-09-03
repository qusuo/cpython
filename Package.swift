// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Python",
	products: [
		.library(name: "Python", targets: ["python3_ios", "pythonA", "pythonB", "pythonC", "pythonD", "pythonE",                  "_asyncio-python3_ios",                  "_asyncio-pythonA",                  "_asyncio-pythonB",                  "_asyncio-pythonC",                  "_asyncio-pythonD",                  "_asyncio-pythonE",                  "_bisect-python3_ios",                  "_bisect-pythonA",                  "_bisect-pythonB",                  "_bisect-pythonC",                  "_bisect-pythonD",                  "_bisect-pythonE",                  "_blake2-python3_ios",                  "_blake2-pythonA",                  "_blake2-pythonB",                  "_blake2-pythonC",                  "_blake2-pythonD",                  "_blake2-pythonE",                  "_bz2-python3_ios",                  "_bz2-pythonA",                  "_bz2-pythonB",                  "_bz2-pythonC",                  "_bz2-pythonD",                  "_bz2-pythonE",                  "_codecs_cn-python3_ios",                  "_codecs_cn-pythonA",                  "_codecs_cn-pythonB",                  "_codecs_cn-pythonC",                  "_codecs_cn-pythonD",                  "_codecs_cn-pythonE",                  "_codecs_hk-python3_ios",                  "_codecs_hk-pythonA",                  "_codecs_hk-pythonB",                  "_codecs_hk-pythonC",                  "_codecs_hk-pythonD",                  "_codecs_hk-pythonE",                  "_codecs_iso2022-python3_ios",                  "_codecs_iso2022-pythonA",                  "_codecs_iso2022-pythonB",                  "_codecs_iso2022-pythonC",                  "_codecs_iso2022-pythonD",                  "_codecs_iso2022-pythonE",                  "_codecs_jp-python3_ios",                  "_codecs_jp-pythonA",                  "_codecs_jp-pythonB",                  "_codecs_jp-pythonC",                  "_codecs_jp-pythonD",                  "_codecs_jp-pythonE",                  "_codecs_kr-python3_ios",                  "_codecs_kr-pythonA",                  "_codecs_kr-pythonB",                  "_codecs_kr-pythonC",                  "_codecs_kr-pythonD",                  "_codecs_kr-pythonE",                  "_codecs_tw-python3_ios",                  "_codecs_tw-pythonA",                  "_codecs_tw-pythonB",                  "_codecs_tw-pythonC",                  "_codecs_tw-pythonD",                  "_codecs_tw-pythonE",                  "_contextvars-python3_ios",                  "_contextvars-pythonA",                  "_contextvars-pythonB",                  "_contextvars-pythonC",                  "_contextvars-pythonD",                  "_contextvars-pythonE",                  "_crypt-python3_ios",                  "_crypt-pythonA",                  "_crypt-pythonB",                  "_crypt-pythonC",                  "_crypt-pythonD",                  "_crypt-pythonE",                  "_csv-python3_ios",                  "_csv-pythonA",                  "_csv-pythonB",                  "_csv-pythonC",                  "_csv-pythonD",                  "_csv-pythonE",                  "_ctypes-python3_ios",                  "_ctypes-pythonA",                  "_ctypes-pythonB",                  "_ctypes-pythonC",                  "_ctypes-pythonD",                  "_ctypes-pythonE",                  "_ctypes_test-python3_ios",                  "_ctypes_test-pythonA",                  "_ctypes_test-pythonB",                  "_ctypes_test-pythonC",                  "_ctypes_test-pythonD",                  "_ctypes_test-pythonE",                  "_datetime-python3_ios",                  "_datetime-pythonA",                  "_datetime-pythonB",                  "_datetime-pythonC",                  "_datetime-pythonD",                  "_datetime-pythonE",                  "_dbm-python3_ios",                  "_dbm-pythonA",                  "_dbm-pythonB",                  "_dbm-pythonC",                  "_dbm-pythonD",                  "_dbm-pythonE",                  "_decimal-python3_ios",                  "_decimal-pythonA",                  "_decimal-pythonB",                  "_decimal-pythonC",                  "_decimal-pythonD",                  "_decimal-pythonE",                  "_elementtree-python3_ios",                  "_elementtree-pythonA",                  "_elementtree-pythonB",                  "_elementtree-pythonC",                  "_elementtree-pythonD",                  "_elementtree-pythonE",                  "_hashlib-python3_ios",                  "_hashlib-pythonA",                  "_hashlib-pythonB",                  "_hashlib-pythonC",                  "_hashlib-pythonD",                  "_hashlib-pythonE",                  "_heapq-python3_ios",                  "_heapq-pythonA",                  "_heapq-pythonB",                  "_heapq-pythonC",                  "_heapq-pythonD",                  "_heapq-pythonE",                  "_json-python3_ios",                  "_json-pythonA",                  "_json-pythonB",                  "_json-pythonC",                  "_json-pythonD",                  "_json-pythonE",                  "_lsprof-python3_ios",                  "_lsprof-pythonA",                  "_lsprof-pythonB",                  "_lsprof-pythonC",                  "_lsprof-pythonD",                  "_lsprof-pythonE",                  "_md5-python3_ios",                  "_md5-pythonA",                  "_md5-pythonB",                  "_md5-pythonC",                  "_md5-pythonD",                  "_md5-pythonE",                  "_multibytecodec-python3_ios",                  "_multibytecodec-pythonA",                  "_multibytecodec-pythonB",                  "_multibytecodec-pythonC",                  "_multibytecodec-pythonD",                  "_multibytecodec-pythonE",                  "_multiprocessing-python3_ios",                  "_multiprocessing-pythonA",                  "_multiprocessing-pythonB",                  "_multiprocessing-pythonC",                  "_multiprocessing-pythonD",                  "_multiprocessing-pythonE",                  "_opcode-python3_ios",                  "_opcode-pythonA",                  "_opcode-pythonB",                  "_opcode-pythonC",                  "_opcode-pythonD",                  "_opcode-pythonE",                  "_pickle-python3_ios",                  "_pickle-pythonA",                  "_pickle-pythonB",                  "_pickle-pythonC",                  "_pickle-pythonD",                  "_pickle-pythonE",                  "_posixshmem-python3_ios",                  "_posixshmem-pythonA",                  "_posixshmem-pythonB",                  "_posixshmem-pythonC",                  "_posixshmem-pythonD",                  "_posixshmem-pythonE",                  "_posixsubprocess-python3_ios",                  "_posixsubprocess-pythonA",                  "_posixsubprocess-pythonB",                  "_posixsubprocess-pythonC",                  "_posixsubprocess-pythonD",                  "_posixsubprocess-pythonE",                  "_queue-python3_ios",                  "_queue-pythonA",                  "_queue-pythonB",                  "_queue-pythonC",                  "_queue-pythonD",                  "_queue-pythonE",                  "_random-python3_ios",                  "_random-pythonA",                  "_random-pythonB",                  "_random-pythonC",                  "_random-pythonD",                  "_random-pythonE",                  "_sha1-python3_ios",                  "_sha1-pythonA",                  "_sha1-pythonB",                  "_sha1-pythonC",                  "_sha1-pythonD",                  "_sha1-pythonE",                  "_sha256-python3_ios",                  "_sha256-pythonA",                  "_sha256-pythonB",                  "_sha256-pythonC",                  "_sha256-pythonD",                  "_sha256-pythonE",                  "_sha3-python3_ios",                  "_sha3-pythonA",                  "_sha3-pythonB",                  "_sha3-pythonC",                  "_sha3-pythonD",                  "_sha3-pythonE",                  "_sha512-python3_ios",                  "_sha512-pythonA",                  "_sha512-pythonB",                  "_sha512-pythonC",                  "_sha512-pythonD",                  "_sha512-pythonE",                  "_socket-python3_ios",                  "_socket-pythonA",                  "_socket-pythonB",                  "_socket-pythonC",                  "_socket-pythonD",                  "_socket-pythonE",                  "_sqlite3-python3_ios",                  "_sqlite3-pythonA",                  "_sqlite3-pythonB",                  "_sqlite3-pythonC",                  "_sqlite3-pythonD",                  "_sqlite3-pythonE",                  "_ssl-python3_ios",                  "_ssl-pythonA",                  "_ssl-pythonB",                  "_ssl-pythonC",                  "_ssl-pythonD",                  "_ssl-pythonE",                  "_statistics-python3_ios",                  "_statistics-pythonA",                  "_statistics-pythonB",                  "_statistics-pythonC",                  "_statistics-pythonD",                  "_statistics-pythonE",                  "_struct-python3_ios",                  "_struct-pythonA",                  "_struct-pythonB",                  "_struct-pythonC",                  "_struct-pythonD",                  "_struct-pythonE",                  "_testbuffer-python3_ios",                  "_testbuffer-pythonA",                  "_testbuffer-pythonB",                  "_testbuffer-pythonC",                  "_testbuffer-pythonD",                  "_testbuffer-pythonE",                  "_testcapi-python3_ios",                  "_testcapi-pythonA",                  "_testcapi-pythonB",                  "_testcapi-pythonC",                  "_testcapi-pythonD",                  "_testcapi-pythonE",                  "_testimportmultiple-python3_ios",                  "_testimportmultiple-pythonA",                  "_testimportmultiple-pythonB",                  "_testimportmultiple-pythonC",                  "_testimportmultiple-pythonD",                  "_testimportmultiple-pythonE",                  "_testinternalcapi-python3_ios",                  "_testinternalcapi-pythonA",                  "_testinternalcapi-pythonB",                  "_testinternalcapi-pythonC",                  "_testinternalcapi-pythonD",                  "_testinternalcapi-pythonE",                  "_testmultiphase-python3_ios",                  "_testmultiphase-pythonA",                  "_testmultiphase-pythonB",                  "_testmultiphase-pythonC",                  "_testmultiphase-pythonD",                  "_testmultiphase-pythonE",                  "_xxsubinterpreters-python3_ios",                  "_xxsubinterpreters-pythonA",                  "_xxsubinterpreters-pythonB",                  "_xxsubinterpreters-pythonC",                  "_xxsubinterpreters-pythonD",                  "_xxsubinterpreters-pythonE",                  "_xxtestfuzz-python3_ios",                  "_xxtestfuzz-pythonA",                  "_xxtestfuzz-pythonB",                  "_xxtestfuzz-pythonC",                  "_xxtestfuzz-pythonD",                  "_xxtestfuzz-pythonE",                  "_zoneinfo-python3_ios",                  "_zoneinfo-pythonA",                  "_zoneinfo-pythonB",                  "_zoneinfo-pythonC",                  "_zoneinfo-pythonD",                  "_zoneinfo-pythonE",                  "array-python3_ios",                  "array-pythonA",                  "array-pythonB",                  "array-pythonC",                  "array-pythonD",                  "array-pythonE",                  "audioop-python3_ios",                  "audioop-pythonA",                  "audioop-pythonB",                  "audioop-pythonC",                  "audioop-pythonD",                  "audioop-pythonE",                  "binascii-python3_ios",                  "binascii-pythonA",                  "binascii-pythonB",                  "binascii-pythonC",                  "binascii-pythonD",                  "binascii-pythonE",                  "cmath-python3_ios",                  "cmath-pythonA",                  "cmath-pythonB",                  "cmath-pythonC",                  "cmath-pythonD",                  "cmath-pythonE",                  "fcntl-python3_ios",                  "fcntl-pythonA",                  "fcntl-pythonB",                  "fcntl-pythonC",                  "fcntl-pythonD",                  "fcntl-pythonE",                  "grp-python3_ios",                  "grp-pythonA",                  "grp-pythonB",                  "grp-pythonC",                  "grp-pythonD",                  "grp-pythonE",                  "math-python3_ios",                  "math-pythonA",                  "math-pythonB",                  "math-pythonC",                  "math-pythonD",                  "math-pythonE",                  "mmap-python3_ios",                  "mmap-pythonA",                  "mmap-pythonB",                  "mmap-pythonC",                  "mmap-pythonD",                  "mmap-pythonE",                  "parser-python3_ios",                  "parser-pythonA",                  "parser-pythonB",                  "parser-pythonC",                  "parser-pythonD",                  "parser-pythonE",                  "pyexpat-python3_ios",                  "pyexpat-pythonA",                  "pyexpat-pythonB",                  "pyexpat-pythonC",                  "pyexpat-pythonD",                  "pyexpat-pythonE",                  "resource-python3_ios",                  "resource-pythonA",                  "resource-pythonB",                  "resource-pythonC",                  "resource-pythonD",                  "resource-pythonE",                  "select-python3_ios",                  "select-pythonA",                  "select-pythonB",                  "select-pythonC",                  "select-pythonD",                  "select-pythonE",                  "syslog-python3_ios",                  "syslog-pythonA",                  "syslog-pythonB",                  "syslog-pythonC",                  "syslog-pythonD",                  "syslog-pythonE",                  "termios-python3_ios",                  "termios-pythonA",                  "termios-pythonB",                  "termios-pythonC",                  "termios-pythonD",                  "termios-pythonE",                  "unicodedata-python3_ios",                  "unicodedata-pythonA",                  "unicodedata-pythonB",                  "unicodedata-pythonC",                  "unicodedata-pythonD",                  "unicodedata-pythonE",                  "xxlimited-python3_ios",                  "xxlimited-pythonA",                  "xxlimited-pythonB",                  "xxlimited-pythonC",                  "xxlimited-pythonD",                  "xxlimited-pythonE",                  "zlib-python3_ios",                  "zlib-pythonA",                  "zlib-pythonB",                  "zlib-pythonC",                  "zlib-pythonD",                  "zlib-pythonE"])
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
        ),
        .binaryTarget(
            name: "_asyncio-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_asyncio-python3_ios.xcframework.zip",
            checksum: "af525a00194116144ae6fe6a04b0acec37fe913c47e20f80b642b811597bc3a4"
        ),
        .binaryTarget(
            name: "_bisect-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_bisect-python3_ios.xcframework.zip",
            checksum: "a2f8df9fd6a13d412f1c34b847cbf81b24f36c97239b35acc9680ae4c81994f2"
        ),
        .binaryTarget(
            name: "_blake2-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_blake2-python3_ios.xcframework.zip",
            checksum: "6edeeee00e27f235c8ebc1e3c475e973b099f8dccfe11af53f4b7859d9823b8a"
        ),
        .binaryTarget(
            name: "_bz2-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_bz2-python3_ios.xcframework.zip",
            checksum: "e74ae060ef61f6a1a292a4327e7551ddd33459ad34bf4cb5859a00d753cd094c"
        ),
        .binaryTarget(
            name: "_codecs_cn-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_cn-python3_ios.xcframework.zip",
            checksum: "fc67b1002f37f2b85043dc7fcf1c7613cf49302a80bb2782e9dd7166db8d521f"
        ),
        .binaryTarget(
            name: "_codecs_hk-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_hk-python3_ios.xcframework.zip",
            checksum: "45c1384dc750bfc7b8219c7bfae015b06392b62bad54c61f82e24e4851fba888"
        ),
        .binaryTarget(
            name: "_codecs_iso2022-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_iso2022-python3_ios.xcframework.zip",
            checksum: "39762fa19213555180d5599c7b4725c9da99deeed4361994f9961ab6d7b29621"
        ),
        .binaryTarget(
            name: "_codecs_jp-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_jp-python3_ios.xcframework.zip",
            checksum: "5f568f8a4fc3252006cfa80d6a4c29d50c62994c624343fc8dcd04dcdf599a49"
        ),
        .binaryTarget(
            name: "_codecs_kr-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_kr-python3_ios.xcframework.zip",
            checksum: "5a48248d15c745d284c6349f540fd6d21b7f1e14b56398c72ed768cf5ecd1106"
        ),
        .binaryTarget(
            name: "_codecs_tw-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_tw-python3_ios.xcframework.zip",
            checksum: "402c38157ab5092afa7f8f2603ca14faec2c05bb5b4bac78a8dbb08685572277"
        ),
        .binaryTarget(
            name: "_contextvars-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_contextvars-python3_ios.xcframework.zip",
            checksum: "17fee50cdf5f161fa3a7de0f42c86c5c52f49d41958541c50615f9b6e721a65b"
        ),
        .binaryTarget(
            name: "_crypt-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_crypt-python3_ios.xcframework.zip",
            checksum: "b120ef5306f79de87c3925da1fe3fa3c9799221a5d674a14e0f030628ed7c7e2"
        ),
        .binaryTarget(
            name: "_csv-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_csv-python3_ios.xcframework.zip",
            checksum: "380c094d308aa370810b3a3e2b95c152ee1e2b9469d5ed95318478319e1b8ded"
        ),
        .binaryTarget(
            name: "_ctypes-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ctypes-python3_ios.xcframework.zip",
            checksum: "4397a201ea7e9be4d82586b158c3ae0d5d8e6bc272502beffb7d40e38c814d54"
        ),
        .binaryTarget(
            name: "_ctypes_test-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ctypes_test-python3_ios.xcframework.zip",
            checksum: "730013de87569054b06b1ef5e717bea50780b7d967ada6594455451eff0f3059"
        ),
        .binaryTarget(
            name: "_datetime-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_datetime-python3_ios.xcframework.zip",
            checksum: "fa82f1f991f03005a5ef0cf813e46193b75449225f8b0c4b61bb3e64444cbb2f"
        ),
        .binaryTarget(
            name: "_dbm-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_dbm-python3_ios.xcframework.zip",
            checksum: "6882d4cdd7f4e7bda45fb6a64d5d0b8ba7fd502032f36048452d582d5e3bd00d"
        ),
        .binaryTarget(
            name: "_decimal-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_decimal-python3_ios.xcframework.zip",
            checksum: "46d82381e8e1e5e91457da0b093d36823eccc4578bb886040d8110f9b5355e06"
        ),
        .binaryTarget(
            name: "_elementtree-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_elementtree-python3_ios.xcframework.zip",
            checksum: "0296e4bb6843f07284979d6fb64fa2ce84c09a43b86faf955342e8ebbc060650"
        ),
        .binaryTarget(
            name: "_hashlib-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_hashlib-python3_ios.xcframework.zip",
            checksum: "b1650c443871cb943372617b3099db8b57f290a7f6390c2181a8b3bb5a6feb57"
        ),
        .binaryTarget(
            name: "_heapq-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_heapq-python3_ios.xcframework.zip",
            checksum: "312ff56c5eaf88866708caa3f3d5b1f3a0a55c2f278948de0c803b30b9d2e53c"
        ),
        .binaryTarget(
            name: "_json-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_json-python3_ios.xcframework.zip",
            checksum: "e24dadb6bc96860f5acd83afd02e21ce65e4c11984f2e23e905f9ed9aa5b5e72"
        ),
        .binaryTarget(
            name: "_lsprof-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_lsprof-python3_ios.xcframework.zip",
            checksum: "7edd8a3d2e7fc2f422702b27eef2cf2cbcea09eae8e86b9ad4f81ea0e3cfbbd1"
        ),
        .binaryTarget(
            name: "_md5-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_md5-python3_ios.xcframework.zip",
            checksum: "4f1559566cb5439c4f8ba6e45e5ae2974b3af0ee5e53d1062a4150358bafb2eb"
        ),
        .binaryTarget(
            name: "_multibytecodec-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_multibytecodec-python3_ios.xcframework.zip",
            checksum: "cc5491066c691c314df1b01049530b4f0c20056e53ad62b34b588610c7e4a6c0"
        ),
        .binaryTarget(
            name: "_multiprocessing-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_multiprocessing-python3_ios.xcframework.zip",
            checksum: "bb9a75c5980bbe9cdf32e5f08cd4710d0e25b70bb95c2c1069ab4d1e3716ae7a"
        ),
        .binaryTarget(
            name: "_opcode-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_opcode-python3_ios.xcframework.zip",
            checksum: "8d6dbad697c1cb215a2cf8980cd4f73e04b467c1880e60c323d61191dae87ba8"
        ),
        .binaryTarget(
            name: "_pickle-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_pickle-python3_ios.xcframework.zip",
            checksum: "f7e6110a0f46304192933402f19dd9571f3d27e13cbda4672edd4e71c51159a8"
        ),
        .binaryTarget(
            name: "_posixshmem-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_posixshmem-python3_ios.xcframework.zip",
            checksum: "598bd0aaf6fd7eb431b2f14eed8a5eed29e60608790854733f1f43263f43a407"
        ),
        .binaryTarget(
            name: "_posixsubprocess-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_posixsubprocess-python3_ios.xcframework.zip",
            checksum: "854391f71b1387c29c8164c9967b87e4aedc054815211d5ed50479af4bce6a78"
        ),
        .binaryTarget(
            name: "_queue-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_queue-python3_ios.xcframework.zip",
            checksum: "2c12b73cbb9e2c9279c68e0736ec73be5a2e1ff2962fb874529c2bb2e0749399"
        ),
        .binaryTarget(
            name: "_random-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_random-python3_ios.xcframework.zip",
            checksum: "0b06cec2f39baaa2be9b7fe6a1cdeb620ff0186ec4c2086612b8f83c8904dac0"
        ),
        .binaryTarget(
            name: "_sha1-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha1-python3_ios.xcframework.zip",
            checksum: "ac3270e3de5601c10b38d59ade9250b00496c0a207ebc1992d2de0e8d3a287b4"
        ),
        .binaryTarget(
            name: "_sha256-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha256-python3_ios.xcframework.zip",
            checksum: "9a70c90e621df7a9b0688161e52118f45cc5d2692c6f59a66d12dafa1fbea977"
        ),
        .binaryTarget(
            name: "_sha3-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha3-python3_ios.xcframework.zip",
            checksum: "58609ef11eef5ac32ecdd453e95b7caa7aaea9d1d1042fa50e395aa69a88984d"
        ),
        .binaryTarget(
            name: "_sha512-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha512-python3_ios.xcframework.zip",
            checksum: "0536e0bddd9f01097811589de65a242aecb19062fe17533a8a4317b8a838fcfa"
        ),
        .binaryTarget(
            name: "_socket-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_socket-python3_ios.xcframework.zip",
            checksum: "70af95b9b30f0c7f18ab15e447851df436baf43a905fd188dfb610876f1097d1"
        ),
        .binaryTarget(
            name: "_sqlite3-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sqlite3-python3_ios.xcframework.zip",
            checksum: "737c08543820761a0f723e49f379f78e466b15d46d0298860e6284d71d0d5acf"
        ),
        .binaryTarget(
            name: "_ssl-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ssl-python3_ios.xcframework.zip",
            checksum: "9402cea93a3f9755b97c43ebdf088da4f5202dbece1591eb470353a8dc8912e7"
        ),
        .binaryTarget(
            name: "_statistics-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_statistics-python3_ios.xcframework.zip",
            checksum: "034400cfc8ad3e0323208512397f9d52f376903fa060cbb8196e1cb4f348ee87"
        ),
        .binaryTarget(
            name: "_struct-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_struct-python3_ios.xcframework.zip",
            checksum: "567c5ef83c38f99aeb1d4115e116652bdaa3276e1c2fc03304a0135f7dff7491"
        ),
        .binaryTarget(
            name: "_testbuffer-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testbuffer-python3_ios.xcframework.zip",
            checksum: "0dbcde74ab45ee35bc0b889a8305dfc6dd37dc66a555bcfff990a2e97555d364"
        ),
        .binaryTarget(
            name: "_testcapi-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testcapi-python3_ios.xcframework.zip",
            checksum: "f1dbc5edf3457cade4f7f972179a9283d4aa8fd508f1461f5eddae04c06ef64c"
        ),
        .binaryTarget(
            name: "_testimportmultiple-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testimportmultiple-python3_ios.xcframework.zip",
            checksum: "1af99335b27e2e7325faeca126b974975c694c9fcbdc939bbcb2bc819db7146b"
        ),
        .binaryTarget(
            name: "_testinternalcapi-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testinternalcapi-python3_ios.xcframework.zip",
            checksum: "8f62f2c1cd6643ab19230a931dff448f4feb6c263ce41e770dbcd26f3a422cc0"
        ),
        .binaryTarget(
            name: "_testmultiphase-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testmultiphase-python3_ios.xcframework.zip",
            checksum: "bb0a8957dde2cc271fb57ab90b21c3a2c05804abb24fba78a21d1d97c7639cbc"
        ),
        .binaryTarget(
            name: "_xxsubinterpreters-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_xxsubinterpreters-python3_ios.xcframework.zip",
            checksum: "c2906fea490cf6688f085cb0c20d0fdb67e799aa81fc58379377c547473597e6"
        ),
        .binaryTarget(
            name: "_xxtestfuzz-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_xxtestfuzz-python3_ios.xcframework.zip",
            checksum: "f3efd0faac50d2f180752c5a6148647d43d9516e97780e73cf574fe13546b344"
        ),
        .binaryTarget(
            name: "_zoneinfo-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_zoneinfo-python3_ios.xcframework.zip",
            checksum: "57dfe410c2e747ca533116a47e790b0c6be66ee21acb9aeffff1bc4a967bebe0"
        ),
        .binaryTarget(
            name: "array-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/array-python3_ios.xcframework.zip",
            checksum: "b11b97d7dbe5a0fbb14c333eac6e5d2fc7ab34d3d948753b8057bb723d24dda9"
        ),
        .binaryTarget(
            name: "audioop-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/audioop-python3_ios.xcframework.zip",
            checksum: "ba1a0577029df51d46fb14b6061bb2f0cf1fd02f6ea64c42c05b3c8f72905bc1"
        ),
        .binaryTarget(
            name: "binascii-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/binascii-python3_ios.xcframework.zip",
            checksum: "294e459316e077fac76ddfe4e1b793632f0cf11c3b36462b7e3525b76216d9f5"
        ),
        .binaryTarget(
            name: "cmath-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/cmath-python3_ios.xcframework.zip",
            checksum: "292e96e12716894c8400b76009c0a90ae92304dea29b391e0cfd3a16a9203664"
        ),
        .binaryTarget(
            name: "fcntl-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/fcntl-python3_ios.xcframework.zip",
            checksum: "7aaaa5fcd299df3bdd001234ed0de9a7b7a9b73bc2a3cf0bacefb76464826628"
        ),
        .binaryTarget(
            name: "grp-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/grp-python3_ios.xcframework.zip",
            checksum: "fa04cd9e8fde9e9c62445b57ded2aa6366e0b845b001686e57f1237b2b37004b"
        ),
        .binaryTarget(
            name: "math-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/math-python3_ios.xcframework.zip",
            checksum: "46e528caedc83e3c687bcb4cfe13bfd13cc02f0ce73bd7af9ec7dbe3e3d117c0"
        ),
        .binaryTarget(
            name: "mmap-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/mmap-python3_ios.xcframework.zip",
            checksum: "ee9c0c66b21e0a51912c4db0a52e2de823feadd1f57f49850822dfd3ac510e2d"
        ),
        .binaryTarget(
            name: "parser-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/parser-python3_ios.xcframework.zip",
            checksum: "a1f0cac9946f913e6d7e1d7afa53a9a7ba49a7521a74c9a193dd9da3ad2dbd29"
        ),
        .binaryTarget(
            name: "pyexpat-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pyexpat-python3_ios.xcframework.zip",
            checksum: "8b72879bd1098cdc8567f6c4c78ced7c44e3ed628860315f2ae00cfaf4508c55"
        ),
        .binaryTarget(
            name: "resource-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/resource-python3_ios.xcframework.zip",
            checksum: "9512025db4701447a9d201f11eb6c486e0b661465e543ec92c0c391e8bc53bcb"
        ),
        .binaryTarget(
            name: "select-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/select-python3_ios.xcframework.zip",
            checksum: "0e2f93ba67cbcca3f9d27ba2f377da4e3decd5152f52ce930c7cbdc6c055795a"
        ),
        .binaryTarget(
            name: "syslog-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/syslog-python3_ios.xcframework.zip",
            checksum: "f60b0f795ab37f283001cb212e93e3a63889589158dbc56fb6ebd79529147aeb"
        ),
        .binaryTarget(
            name: "termios-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/termios-python3_ios.xcframework.zip",
            checksum: "3a105765632472ca89fdd4a965334de4560930b5efffeb3dec6a4405d6e8528a"
        ),
        .binaryTarget(
            name: "unicodedata-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/unicodedata-python3_ios.xcframework.zip",
            checksum: "b9cb356d7bbf3c80d62a7d35e7f78ac33f65f3eddb9aaa209a87eb10dc268948"
        ),
        .binaryTarget(
            name: "xxlimited-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/xxlimited-python3_ios.xcframework.zip",
            checksum: "d119b587a154f8ed974509ff3a41fc8b1a702c01f9a2fb9f33bc6b6650bafeab"
        ),
        .binaryTarget(
            name: "zlib-python3_ios",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/zlib-python3_ios.xcframework.zip",
            checksum: "2b4019d6fb7e7d281bc3a20bdea18f3b650b54841be98e874c6ed85f609371f4"
        ),
        .binaryTarget(
            name: "_asyncio-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_asyncio-pythonA.xcframework.zip",
            checksum: "b33d398cb555c44ebb980393673da7774ed4c45aa8e2c9b992c7b3adfd2a4aae"
        ),
        .binaryTarget(
            name: "_bisect-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_bisect-pythonA.xcframework.zip",
            checksum: "50f78cf18c381b2cd1bb9418d2b3b9281364e89e9ef37e1e5f48ce8de3bea6b1"
        ),
        .binaryTarget(
            name: "_blake2-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_blake2-pythonA.xcframework.zip",
            checksum: "b2710d3bced250737ce96f8c65126329649c3ad3389e4641d6e2d7fb348ed7c5"
        ),
        .binaryTarget(
            name: "_bz2-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_bz2-pythonA.xcframework.zip",
            checksum: "8183675f11ace9119d68560e23d62d33ca4a0c3bb3e1d32d47247b9c79de7e23"
        ),
        .binaryTarget(
            name: "_codecs_cn-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_cn-pythonA.xcframework.zip",
            checksum: "1e003430c9e249ad6b91ea9d862acb93f4930053af98a4c9e6692ee2d138d291"
        ),
        .binaryTarget(
            name: "_codecs_hk-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_hk-pythonA.xcframework.zip",
            checksum: "5dbe01f3ec6f4ea0ebb43957382af9af58f6da7c619ae748ec011b4a58f9d51d"
        ),
        .binaryTarget(
            name: "_codecs_iso2022-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_iso2022-pythonA.xcframework.zip",
            checksum: "bb1b55f5fb31bbf0dd42e79b85caf74cd3dacd00054e6d77a73f82a09653d361"
        ),
        .binaryTarget(
            name: "_codecs_jp-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_jp-pythonA.xcframework.zip",
            checksum: "08f22cbcafec7978075143bd7a214b57c98f659bda1b22dd30e720c2e11f1555"
        ),
        .binaryTarget(
            name: "_codecs_kr-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_kr-pythonA.xcframework.zip",
            checksum: "1f223a000df243bde5b1e290d4652f78daf2918a49ac680286394fa0f60fa6f2"
        ),
        .binaryTarget(
            name: "_codecs_tw-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_tw-pythonA.xcframework.zip",
            checksum: "40f5c70c5143e4443fb7bc5c18f840c0decbc0fb22c85f5e41e6f24cc0812390"
        ),
        .binaryTarget(
            name: "_contextvars-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_contextvars-pythonA.xcframework.zip",
            checksum: "18d0fa0a8333c3aa78c66ff94074e353272a7eee770737e4c0363d831e0dbcea"
        ),
        .binaryTarget(
            name: "_crypt-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_crypt-pythonA.xcframework.zip",
            checksum: "507083811cc7ceb1a4249e9fa7908b33d3e4211f03109105839525799682d279"
        ),
        .binaryTarget(
            name: "_csv-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_csv-pythonA.xcframework.zip",
            checksum: "ec6190e370a201bb547ef19c7bfb5dabf41d0f10de5c3719ad870dcb2489bd49"
        ),
        .binaryTarget(
            name: "_ctypes-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ctypes-pythonA.xcframework.zip",
            checksum: "f779a495e29f63105a6835b635124b962bd3630c439f62cf3e1bc5bd513ecc36"
        ),
        .binaryTarget(
            name: "_ctypes_test-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ctypes_test-pythonA.xcframework.zip",
            checksum: "8e4709dce899b3e2cca8945cad9885ab672cc8eae6a5f300ba403333ce09a12c"
        ),
        .binaryTarget(
            name: "_datetime-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_datetime-pythonA.xcframework.zip",
            checksum: "517eaa59145ef0e1e2208017601ccc8d84127ce043ad40d7870964b746413724"
        ),
        .binaryTarget(
            name: "_dbm-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_dbm-pythonA.xcframework.zip",
            checksum: "9d2e15317bfb68aec20715fb86de3e019120dad46482dc0fea971a9e11b64dcc"
        ),
        .binaryTarget(
            name: "_decimal-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_decimal-pythonA.xcframework.zip",
            checksum: "49e0b5623d489c4900cc7cbbae6bdc04743ad766c4332533c14f452303e0f1dc"
        ),
        .binaryTarget(
            name: "_elementtree-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_elementtree-pythonA.xcframework.zip",
            checksum: "3f153548328db102d025dcde79f3132c95d7c4d3767ace4ff0ebcbea9e65a7ea"
        ),
        .binaryTarget(
            name: "_hashlib-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_hashlib-pythonA.xcframework.zip",
            checksum: "e23fe43673ea03757881a5c728c3ae79dbefbc8b4f0a215e482aa102ac978307"
        ),
        .binaryTarget(
            name: "_heapq-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_heapq-pythonA.xcframework.zip",
            checksum: "178c05ae9771e4c6a9c0e802a05d1c2d678ea61deb234fae01d8d489c41bfbd3"
        ),
        .binaryTarget(
            name: "_json-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_json-pythonA.xcframework.zip",
            checksum: "175f51232a2b7f57ae5e3c682233193b5fc09687844df3cc9867bea0aeb03b19"
        ),
        .binaryTarget(
            name: "_lsprof-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_lsprof-pythonA.xcframework.zip",
            checksum: "8a78c9af5fc8ab0b7ddd62cc79094ea0bc0a4b3ea734779b33972720246fa724"
        ),
        .binaryTarget(
            name: "_md5-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_md5-pythonA.xcframework.zip",
            checksum: "b58dfdfdcdbfb5c56c04a4124b07719b385e81895654f9618ef5fa3b69592b7c"
        ),
        .binaryTarget(
            name: "_multibytecodec-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_multibytecodec-pythonA.xcframework.zip",
            checksum: "99190a40737b1656453daee379b74eeb089dc4bc58fdf89061e4a17279f156de"
        ),
        .binaryTarget(
            name: "_multiprocessing-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_multiprocessing-pythonA.xcframework.zip",
            checksum: "10ebce4fd561486f9367de1c372fe5e34be6acecf6cd5346be19a6bbf9003f1e"
        ),
        .binaryTarget(
            name: "_opcode-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_opcode-pythonA.xcframework.zip",
            checksum: "3db2786ae76d1477935addbcb91aed1f308ca74e797d55afaa6a6fbb7a8f669a"
        ),
        .binaryTarget(
            name: "_pickle-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_pickle-pythonA.xcframework.zip",
            checksum: "656779824bf9a67a16739fc9acca0688c9e12fd689fe83e0f45915718f4b1dd5"
        ),
        .binaryTarget(
            name: "_posixshmem-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_posixshmem-pythonA.xcframework.zip",
            checksum: "23427b3b9f8238f638db0ed794e2cccfa7c57171c20a826d20fda1cb20bffa47"
        ),
        .binaryTarget(
            name: "_posixsubprocess-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_posixsubprocess-pythonA.xcframework.zip",
            checksum: "8847208c1149c22fa47eaefc4ede5e8a3d509a4cf6c6fe019c7f5c86f5a965c3"
        ),
        .binaryTarget(
            name: "_queue-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_queue-pythonA.xcframework.zip",
            checksum: "fcc9d2e7a770e73397b5fa31ef861a73983c82bf47d1c0af280378efc0d32e41"
        ),
        .binaryTarget(
            name: "_random-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_random-pythonA.xcframework.zip",
            checksum: "842a0e7f2f64dc127573db9061f076bddeea69dc8ef0ef925d06f9a3514be6c9"
        ),
        .binaryTarget(
            name: "_sha1-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha1-pythonA.xcframework.zip",
            checksum: "1f2086592569063ff5930c9e2bb1a713edef318eb4aae449b000e593fa3ab946"
        ),
        .binaryTarget(
            name: "_sha256-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha256-pythonA.xcframework.zip",
            checksum: "5b670e69ae01948efd872d0b39fdbabe634a17194167aa21d7e3fd310d0def3f"
        ),
        .binaryTarget(
            name: "_sha3-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha3-pythonA.xcframework.zip",
            checksum: "b9b5b6e26291fbc166bbf90777fc9eb8dd5dc5ba02b304351faae40212cccb40"
        ),
        .binaryTarget(
            name: "_sha512-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha512-pythonA.xcframework.zip",
            checksum: "49adab6f8e3724ad80c0a86b3e39261af2a772d14fa521e97f06499f9f675e09"
        ),
        .binaryTarget(
            name: "_socket-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_socket-pythonA.xcframework.zip",
            checksum: "8009fc015c29ed8754d8d458f409677b2027db1a31ad5cd7f1ed797d374ff307"
        ),
        .binaryTarget(
            name: "_sqlite3-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sqlite3-pythonA.xcframework.zip",
            checksum: "c7149c553855b00f93e875863a3283a15588f69fd9b305babe3c534f536c5521"
        ),
        .binaryTarget(
            name: "_ssl-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ssl-pythonA.xcframework.zip",
            checksum: "b0e8e4d7e4aee8ac716c8eb825e94840ef52359ed881598396dfd21520a6d0cd"
        ),
        .binaryTarget(
            name: "_statistics-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_statistics-pythonA.xcframework.zip",
            checksum: "583e016fe9a6ba264be8e0b91d30a76194a0ce5005f7181483ad8d3b64829d86"
        ),
        .binaryTarget(
            name: "_struct-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_struct-pythonA.xcframework.zip",
            checksum: "b0a1d63695def7721737d656e92994a6e63078d0f3d8022c47e414f96fc2611b"
        ),
        .binaryTarget(
            name: "_testbuffer-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testbuffer-pythonA.xcframework.zip",
            checksum: "ccf25b417e072ae3159862af32c67b19cb3c7a62ad1e7747e2007a243d3cfdc9"
        ),
        .binaryTarget(
            name: "_testcapi-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testcapi-pythonA.xcframework.zip",
            checksum: "61a8bdac37aa2749e5400c7b6cc560ea20e29f981542e56828a93507587e04a3"
        ),
        .binaryTarget(
            name: "_testimportmultiple-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testimportmultiple-pythonA.xcframework.zip",
            checksum: "53a1b8fc1dcaa40fdba30ca56092693efd752bfacf44f7dcdb9b2fdbee82dda2"
        ),
        .binaryTarget(
            name: "_testinternalcapi-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testinternalcapi-pythonA.xcframework.zip",
            checksum: "a2f9e6ae9d2a80a09b8513a03c1da0d7ab3dd298ea4a02e4b6d98a64a7e748fc"
        ),
        .binaryTarget(
            name: "_testmultiphase-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testmultiphase-pythonA.xcframework.zip",
            checksum: "18077d387f82040272517a7f30df42b2670942dc3ef52697469e2c12732bf5b6"
        ),
        .binaryTarget(
            name: "_xxsubinterpreters-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_xxsubinterpreters-pythonA.xcframework.zip",
            checksum: "4c5f1f66650f490e5edab879780180f56b849dd3b75e6c14c19df0001011def7"
        ),
        .binaryTarget(
            name: "_xxtestfuzz-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_xxtestfuzz-pythonA.xcframework.zip",
            checksum: "1201179fc0543b6c9945b4d70b9b209720af50611cbe003b7a181d33792927ed"
        ),
        .binaryTarget(
            name: "_zoneinfo-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_zoneinfo-pythonA.xcframework.zip",
            checksum: "74c6c7d9f95d55eaf842a17526062d1fdcd5ae2570f2da10c44ae1b6c8e0996c"
        ),
        .binaryTarget(
            name: "array-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/array-pythonA.xcframework.zip",
            checksum: "d3add6278cbfcd2232cb0bb19f4680edb0371ba065d8dc22d37f4ccc28536082"
        ),
        .binaryTarget(
            name: "audioop-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/audioop-pythonA.xcframework.zip",
            checksum: "ddca8a00cba8b68b7953a731c583213d063e5f8c3b7f5d5244d7d9b60f86bf7e"
        ),
        .binaryTarget(
            name: "binascii-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/binascii-pythonA.xcframework.zip",
            checksum: "da6113895aed5acfc226915ed6bdbd355ae2e1ccd3bf79552a85bc838ed997f0"
        ),
        .binaryTarget(
            name: "cmath-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/cmath-pythonA.xcframework.zip",
            checksum: "b8fa12783ed9180dfd85f3c793973f1b231140dab3ee49395bee294fc9d1fd42"
        ),
        .binaryTarget(
            name: "fcntl-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/fcntl-pythonA.xcframework.zip",
            checksum: "e836a9a5623d8890c18f6a96d9d41ddb098b4bac56403cdf88d5d3fa0381eba9"
        ),
        .binaryTarget(
            name: "grp-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/grp-pythonA.xcframework.zip",
            checksum: "129f8dd6e818bf13457180b3a2961b90eccbd0b4aac468b74cda55df5ec355d6"
        ),
        .binaryTarget(
            name: "math-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/math-pythonA.xcframework.zip",
            checksum: "fc4f9cb129126815743b62e9b01fa0a9a8147ee31595671f04513d2b68817c82"
        ),
        .binaryTarget(
            name: "mmap-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/mmap-pythonA.xcframework.zip",
            checksum: "a713001f5f368b23744dc2d5aac12a033681b794790f9d4cec16e85a0a67cd46"
        ),
        .binaryTarget(
            name: "parser-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/parser-pythonA.xcframework.zip",
            checksum: "9e3c70f8a427f9cf0aa5d0a2642d2bfc8c8a7cac81ecc3804812bf071969a6ff"
        ),
        .binaryTarget(
            name: "pyexpat-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pyexpat-pythonA.xcframework.zip",
            checksum: "4614ebe58eef8a9d6197e6f82756f45d7a3f259137c03ee70f34dd9e3563d9b4"
        ),
        .binaryTarget(
            name: "resource-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/resource-pythonA.xcframework.zip",
            checksum: "37a7aa5b6e9803e3e8872d2db18326e9a19dc6fb70eaf56d4407ff68dcc02a8d"
        ),
        .binaryTarget(
            name: "select-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/select-pythonA.xcframework.zip",
            checksum: "0326f89b1ccee798889f3595a59d1fa5690a52881a47e92f70bc945bc79258cc"
        ),
        .binaryTarget(
            name: "syslog-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/syslog-pythonA.xcframework.zip",
            checksum: "153873863a93f2349996970d66265dc48ca836c9036d16d8e9b4b6d8d6e81325"
        ),
        .binaryTarget(
            name: "termios-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/termios-pythonA.xcframework.zip",
            checksum: "c481687f98df8a7c975f1d758c208adcf01836c155e0982bde93cdef91373f62"
        ),
        .binaryTarget(
            name: "unicodedata-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/unicodedata-pythonA.xcframework.zip",
            checksum: "3add2fdde3058e900ae2068b3b5a3773383ea6fa91ff459b44f886e79c35f406"
        ),
        .binaryTarget(
            name: "xxlimited-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/xxlimited-pythonA.xcframework.zip",
            checksum: "54147e3dcb3e83ea63b7db340889021d360e8ede4eb738f01a1bafacd1fd1925"
        ),
        .binaryTarget(
            name: "zlib-pythonA",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/zlib-pythonA.xcframework.zip",
            checksum: "d85df7de4b9689f5b0b4cbf345c8e2204873719fadca46f178fb81949d4593dc"
        ),
        .binaryTarget(
            name: "_asyncio-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_asyncio-pythonB.xcframework.zip",
            checksum: "edd52f025e975185bf7cf26db2d3a6d6d21e6604424e668bfb93e34dea890ad4"
        ),
        .binaryTarget(
            name: "_bisect-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_bisect-pythonB.xcframework.zip",
            checksum: "b4a131d136c14a4b6889ac14f152c96a77a4c8c7f5ee51ea76608258d00d84d9"
        ),
        .binaryTarget(
            name: "_blake2-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_blake2-pythonB.xcframework.zip",
            checksum: "93a50d987f31d34bb5ec8a29f67b7988796bb530875d921fb0d791e5b39734f3"
        ),
        .binaryTarget(
            name: "_bz2-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_bz2-pythonB.xcframework.zip",
            checksum: "e955f61bfd8669cd4950e59be06aa96287b9c2286f195bde0af8945e37cc1765"
        ),
        .binaryTarget(
            name: "_codecs_cn-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_cn-pythonB.xcframework.zip",
            checksum: "260ff53e0c9a292add973986fe0255d8a0711b4d986d607bcc3a921d7c4b37fe"
        ),
        .binaryTarget(
            name: "_codecs_hk-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_hk-pythonB.xcframework.zip",
            checksum: "2faec626741ac48a0b7f1b8e32d496ee9c485463cb98ba90258dc09208d48c8c"
        ),
        .binaryTarget(
            name: "_codecs_iso2022-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_iso2022-pythonB.xcframework.zip",
            checksum: "f094ff3c5cc1b09e64db3a029bd227645a0da95b70cdf85609159a5c6f6f8514"
        ),
        .binaryTarget(
            name: "_codecs_jp-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_jp-pythonB.xcframework.zip",
            checksum: "84de4a1214bde54299a6e46c708169bc103e0756c39fb6b29ce9966ee9fbab6c"
        ),
        .binaryTarget(
            name: "_codecs_kr-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_kr-pythonB.xcframework.zip",
            checksum: "268dc36cd3df21009419a4b29f76e0ea3b1665e6771be90d82a09d544ff9db9b"
        ),
        .binaryTarget(
            name: "_codecs_tw-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_tw-pythonB.xcframework.zip",
            checksum: "741071844bc403316dbbd80c5aa34bc3a008162051740720182b736352737dda"
        ),
        .binaryTarget(
            name: "_contextvars-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_contextvars-pythonB.xcframework.zip",
            checksum: "e5d7c338cb37bec83d33454131fa8b7c4d771958c4d399d95538b1e7fcc5b46e"
        ),
        .binaryTarget(
            name: "_crypt-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_crypt-pythonB.xcframework.zip",
            checksum: "e4b159c25d186b69158fff062b93a5822b3e2807ae987d3efb1c27ed1d97b4ca"
        ),
        .binaryTarget(
            name: "_csv-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_csv-pythonB.xcframework.zip",
            checksum: "6f042663b32cfeec9331b12e5a4541a3937c5853ea71bd241dad90bd65f4624a"
        ),
        .binaryTarget(
            name: "_ctypes-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ctypes-pythonB.xcframework.zip",
            checksum: "9f10039609d87d40b01a538cf52c18465dcb2b39b9c95d3c55546b7b327b75a5"
        ),
        .binaryTarget(
            name: "_ctypes_test-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ctypes_test-pythonB.xcframework.zip",
            checksum: "1ecc79256c1bb5c86e2a8aa5f2d07124404e9cd5997d04775390c24ffe24a0ff"
        ),
        .binaryTarget(
            name: "_datetime-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_datetime-pythonB.xcframework.zip",
            checksum: "b07bd4b2710848bec65b6c934c3e1eff4f7779498b9ed1e13ef20eebe2ed8ed8"
        ),
        .binaryTarget(
            name: "_dbm-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_dbm-pythonB.xcframework.zip",
            checksum: "a8921052d21571be3ab7459b8a1ec72afbbc83889f063a182171dc3d427cae9a"
        ),
        .binaryTarget(
            name: "_decimal-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_decimal-pythonB.xcframework.zip",
            checksum: "e322097481617ae845e37e079df1e70c13d71e45571b3c27afa4341eb2a32944"
        ),
        .binaryTarget(
            name: "_elementtree-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_elementtree-pythonB.xcframework.zip",
            checksum: "06d1cbe653f850a4106f58c4337c0b710b490bd9005b686b354d2f6bd9bd565b"
        ),
        .binaryTarget(
            name: "_hashlib-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_hashlib-pythonB.xcframework.zip",
            checksum: "ff44f75a43df1b07c2fe6fdf4ba4be16774beb9b7b7cd45e796e4e5910c756a5"
        ),
        .binaryTarget(
            name: "_heapq-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_heapq-pythonB.xcframework.zip",
            checksum: "6ad4060d492ddda79174ca6c33b9b3ac744ecb324c686b7fcfd35fcdb59f3b85"
        ),
        .binaryTarget(
            name: "_json-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_json-pythonB.xcframework.zip",
            checksum: "c0fd6705fa4b961fe3171bb2d7ae06993f0403be02359c0371cadcbb20b1d086"
        ),
        .binaryTarget(
            name: "_lsprof-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_lsprof-pythonB.xcframework.zip",
            checksum: "15d266281c9b4d6b4aa8b99b786b3130e87711bfda06dab464ec3d64aad5dd0c"
        ),
        .binaryTarget(
            name: "_md5-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_md5-pythonB.xcframework.zip",
            checksum: "4f3939125a08496805527a52514622278eab5b51461c3400b5f9aa37b542845c"
        ),
        .binaryTarget(
            name: "_multibytecodec-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_multibytecodec-pythonB.xcframework.zip",
            checksum: "263f4e31ff787027199ca3f7e067535a560cf254a5ece30eed1d16061d82b73c"
        ),
        .binaryTarget(
            name: "_multiprocessing-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_multiprocessing-pythonB.xcframework.zip",
            checksum: "58bee217629ccc313d4c7b494c1c6cc57c810743aa48f02164b94871c12c4646"
        ),
        .binaryTarget(
            name: "_opcode-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_opcode-pythonB.xcframework.zip",
            checksum: "d0c3a8a873ea99021618038443260485570606143fc3f2a0f60c88eec1fe7b2d"
        ),
        .binaryTarget(
            name: "_pickle-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_pickle-pythonB.xcframework.zip",
            checksum: "529c34a9dc36f3e4581b41798b7424961fe09e7a9c9a57f1349092a5f49985c0"
        ),
        .binaryTarget(
            name: "_posixshmem-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_posixshmem-pythonB.xcframework.zip",
            checksum: "c4b9828365eb4589c5be061d7bafb3f0c900b6f2c51780e6fd01751d6fb95d06"
        ),
        .binaryTarget(
            name: "_posixsubprocess-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_posixsubprocess-pythonB.xcframework.zip",
            checksum: "ab05d6bdbc1887941a920837e7ab2a761b29124d469e4b0f12344e4547fa3d4b"
        ),
        .binaryTarget(
            name: "_queue-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_queue-pythonB.xcframework.zip",
            checksum: "d415bd7bef952c06c339d2f0fb0d3aef238efae73c111b16f26a726ccee7e409"
        ),
        .binaryTarget(
            name: "_random-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_random-pythonB.xcframework.zip",
            checksum: "f7021734fef0d4e67f41e29a2e1098f51f06b2b317a937cccf6436371858a2cb"
        ),
        .binaryTarget(
            name: "_sha1-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha1-pythonB.xcframework.zip",
            checksum: "5772f9c2498a8ace7f8f6c97714be6ba677b1b6bad9ea2f49f40bf72bbdc9f6d"
        ),
        .binaryTarget(
            name: "_sha256-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha256-pythonB.xcframework.zip",
            checksum: "df4dad174312b30fe21f9fb6e3be22edb039b36b7066868e8650190f9b360fce"
        ),
        .binaryTarget(
            name: "_sha3-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha3-pythonB.xcframework.zip",
            checksum: "53197a6fe3e4078adde07b0ba3c5ddacd5b52769bfd9a3df11c57188a1f020b8"
        ),
        .binaryTarget(
            name: "_sha512-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha512-pythonB.xcframework.zip",
            checksum: "ebcc24ff765c53a8f57b71960896a4fc0133f31b552011fe074a87cf2bf36e2b"
        ),
        .binaryTarget(
            name: "_socket-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_socket-pythonB.xcframework.zip",
            checksum: "a6fe877a235092430698afd24cb253443c5826900108290a3c32db5b8dd7e21a"
        ),
        .binaryTarget(
            name: "_sqlite3-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sqlite3-pythonB.xcframework.zip",
            checksum: "137eedd97db399e508cb556a6bf2bd82de503597663100c31168f18396a1b100"
        ),
        .binaryTarget(
            name: "_ssl-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ssl-pythonB.xcframework.zip",
            checksum: "251ac998c706b4bcb42373d30b3151af6c1eea4a90b85ffb6846f6c823602be3"
        ),
        .binaryTarget(
            name: "_statistics-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_statistics-pythonB.xcframework.zip",
            checksum: "0760ca6228c7cf6a0969fc67659acc76f24bd59d436e9410d895b92e9aa3c222"
        ),
        .binaryTarget(
            name: "_struct-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_struct-pythonB.xcframework.zip",
            checksum: "6eff4705c48fdcd1585f4f57cda42796127f179fbd964c5be3bc86e6cf8c1c79"
        ),
        .binaryTarget(
            name: "_testbuffer-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testbuffer-pythonB.xcframework.zip",
            checksum: "6a9d6dbddebc71c2a330d3d4f9cdf558fe499fbfbc5914d20641f0ff1f524c06"
        ),
        .binaryTarget(
            name: "_testcapi-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testcapi-pythonB.xcframework.zip",
            checksum: "5c90a56ac8e1642e3cd44a67367b7d4a4eaa0830fb74eb2b0ded2de670b9eb81"
        ),
        .binaryTarget(
            name: "_testimportmultiple-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testimportmultiple-pythonB.xcframework.zip",
            checksum: "a1a74c9510798ecb7fb17e610ec4ab7372a7a9fb5a798b96659e2a0fb3bfe022"
        ),
        .binaryTarget(
            name: "_testinternalcapi-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testinternalcapi-pythonB.xcframework.zip",
            checksum: "d29eb90ce4be5b2375d8cd38e3150d3739b27bd1bbb6d98cddc713b2c71a0cc8"
        ),
        .binaryTarget(
            name: "_testmultiphase-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testmultiphase-pythonB.xcframework.zip",
            checksum: "1ffd1e778c6de202b53eb903b62b787c6201fd8c89b6b794f3f0b24f335f6bfd"
        ),
        .binaryTarget(
            name: "_xxsubinterpreters-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_xxsubinterpreters-pythonB.xcframework.zip",
            checksum: "1733911931d14b2f3a8d623f9ce770cd521d3d9344ba9092f50a56016a263e07"
        ),
        .binaryTarget(
            name: "_xxtestfuzz-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_xxtestfuzz-pythonB.xcframework.zip",
            checksum: "51ed802fae97eef7cfe30f1299dc7c86ace22b1e56350ca6b1de267b8e5d3f69"
        ),
        .binaryTarget(
            name: "_zoneinfo-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_zoneinfo-pythonB.xcframework.zip",
            checksum: "11425a8698d4948723c340498d755145691a5aada3bfe318f376a97157f8b17d"
        ),
        .binaryTarget(
            name: "array-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/array-pythonB.xcframework.zip",
            checksum: "4bb0d196d8aed20189fe6589c7c7f793c53a322f17f53cdb4d78bbce667e05ef"
        ),
        .binaryTarget(
            name: "audioop-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/audioop-pythonB.xcframework.zip",
            checksum: "f28832abbff662c026007257d66993ac757bc6e0338a2e5ddc8b358c249a0dc8"
        ),
        .binaryTarget(
            name: "binascii-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/binascii-pythonB.xcframework.zip",
            checksum: "711ea1d611cddd433c111f1068f507195461b35289ef05ccca974fabdb608ddd"
        ),
        .binaryTarget(
            name: "cmath-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/cmath-pythonB.xcframework.zip",
            checksum: "0e2a3518bb0232ebbe3d9a8e5635e46960d544e62f54d945d35635b7072027cd"
        ),
        .binaryTarget(
            name: "fcntl-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/fcntl-pythonB.xcframework.zip",
            checksum: "895cf1ff1cdadbeaf42c35a7f8ba913ac9505139ec15b1733a09dd5de6994001"
        ),
        .binaryTarget(
            name: "grp-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/grp-pythonB.xcframework.zip",
            checksum: "d4a7919f2abf20e776dcb94372a748dfbfa056bc60768194bf7afbb0fb1fe806"
        ),
        .binaryTarget(
            name: "math-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/math-pythonB.xcframework.zip",
            checksum: "c162729f4be6cb17ac6b6f965ea98d09723e74f8cc79d67ff146187c2e730a32"
        ),
        .binaryTarget(
            name: "mmap-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/mmap-pythonB.xcframework.zip",
            checksum: "66f161a240c261b16d8eba9e631492237c1f5925f6d29075f9a4275225e98302"
        ),
        .binaryTarget(
            name: "parser-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/parser-pythonB.xcframework.zip",
            checksum: "2a09559831f888a58e6795add8e35137b50393836136c6efc79141cb4bd356af"
        ),
        .binaryTarget(
            name: "pyexpat-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pyexpat-pythonB.xcframework.zip",
            checksum: "40423ec8c90eadf2387992d7a573b7b66688855a6b4451638587047a9736254d"
        ),
        .binaryTarget(
            name: "resource-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/resource-pythonB.xcframework.zip",
            checksum: "921238b77d21cd8b67e26b760dd1a0b7db9f12eb53e4e33b62dfe807f0c84ec6"
        ),
        .binaryTarget(
            name: "select-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/select-pythonB.xcframework.zip",
            checksum: "33c8cecf36b20e38e488eccb88d554a44669e631563d18cf1954d2bc0c78c6b9"
        ),
        .binaryTarget(
            name: "syslog-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/syslog-pythonB.xcframework.zip",
            checksum: "ac7e4de921cc49f4e311149eaa6a68b1368a3c5b452c20ac4731ee522ba33753"
        ),
        .binaryTarget(
            name: "termios-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/termios-pythonB.xcframework.zip",
            checksum: "e246180bb9abb62607fe0a6220edb123cfb2ae104def91da6ea2a4389033d528"
        ),
        .binaryTarget(
            name: "unicodedata-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/unicodedata-pythonB.xcframework.zip",
            checksum: "889c35bfe96e2a363bc1b6759d49634967e73b0f174fe083a810a49e06d4d164"
        ),
        .binaryTarget(
            name: "xxlimited-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/xxlimited-pythonB.xcframework.zip",
            checksum: "e6f57a8c45b0dc588fc1906fba815b152a0e8d45c1db73cb0f2ccd420708d1e0"
        ),
        .binaryTarget(
            name: "zlib-pythonB",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/zlib-pythonB.xcframework.zip",
            checksum: "9170294cd7f0a77bc4d4c68c38407eb3f0a142bf27e455e77ece512b0dfc9385"
        ),
        .binaryTarget(
            name: "_asyncio-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_asyncio-pythonC.xcframework.zip",
            checksum: "5db086a575be3d42ae1632b4dfd0fe179724221e932f9f9968ccbec175257058"
        ),
        .binaryTarget(
            name: "_bisect-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_bisect-pythonC.xcframework.zip",
            checksum: "95007306cad42016b535d681e8a692b49ffcf9a9c7bda7d35e7a0b9be63aea45"
        ),
        .binaryTarget(
            name: "_blake2-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_blake2-pythonC.xcframework.zip",
            checksum: "2a09de3e241c4fe75880407362feacfbbd33573ba0cbcf4dd382676dd006b3f3"
        ),
        .binaryTarget(
            name: "_bz2-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_bz2-pythonC.xcframework.zip",
            checksum: "ee045d64bbccca25c25291169cb13445dbac723700e8b366c7cc995278b33b00"
        ),
        .binaryTarget(
            name: "_codecs_cn-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_cn-pythonC.xcframework.zip",
            checksum: "45a2133ca32477f76d90bdc2f541fc823bf31980bfc74e6b1a8a74a355894d0e"
        ),
        .binaryTarget(
            name: "_codecs_hk-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_hk-pythonC.xcframework.zip",
            checksum: "eb77d74df338a2cdf4ad10627ef8716ed815e1e1afb21259d8551eafabcdbe7e"
        ),
        .binaryTarget(
            name: "_codecs_iso2022-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_iso2022-pythonC.xcframework.zip",
            checksum: "cb558dbe9a0385162614a279b9dedb60bbe5d80551b6cc462ff9ae3b2731f89d"
        ),
        .binaryTarget(
            name: "_codecs_jp-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_jp-pythonC.xcframework.zip",
            checksum: "8a1b457e6a09e062c744547b1b0ad6cd4e61ed10e8092fc7c0f62200dde3f088"
        ),
        .binaryTarget(
            name: "_codecs_kr-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_kr-pythonC.xcframework.zip",
            checksum: "a8b3fa57bcd218e6ab65ac3362be7f7dbf84397baf01b17f3bbbbb1db75a24c4"
        ),
        .binaryTarget(
            name: "_codecs_tw-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_tw-pythonC.xcframework.zip",
            checksum: "6ed2a14c50fd1f6e8be6150083498aa0012c8812faf42cc3ee6c627c240ae00f"
        ),
        .binaryTarget(
            name: "_contextvars-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_contextvars-pythonC.xcframework.zip",
            checksum: "75d8b97799c7396fc623d5eac881c5b0278ae4bef21da1d5a76257a191072a03"
        ),
        .binaryTarget(
            name: "_crypt-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_crypt-pythonC.xcframework.zip",
            checksum: "61b4ffc4468bf9cf42443529ee41a98092edefd889e5299b6a29e582dc2b2d31"
        ),
        .binaryTarget(
            name: "_csv-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_csv-pythonC.xcframework.zip",
            checksum: "41b467ae784a9c0d9da5119eee810e3ff75beeb4db0f6c91a0f5f7bfc776d648"
        ),
        .binaryTarget(
            name: "_ctypes-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ctypes-pythonC.xcframework.zip",
            checksum: "42b3d064c70d37b7d770118de5e304b182314a34f7a9151fa5554783ac5cc923"
        ),
        .binaryTarget(
            name: "_ctypes_test-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ctypes_test-pythonC.xcframework.zip",
            checksum: "8c87f5b50606f5e894542f6d8822b10fd7e20f63533105736830ea1e46c64966"
        ),
        .binaryTarget(
            name: "_datetime-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_datetime-pythonC.xcframework.zip",
            checksum: "ceaab844a5671a4b6d3d3f11605aeb7a88b900ffd0db0741d8b30786c6b5d1fc"
        ),
        .binaryTarget(
            name: "_dbm-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_dbm-pythonC.xcframework.zip",
            checksum: "6cf69359a3c364d060371048542e344bfa43119772035bf640e540ba72f2f52f"
        ),
        .binaryTarget(
            name: "_decimal-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_decimal-pythonC.xcframework.zip",
            checksum: "8e2b821ac236d0bd761a7d4ed16158e00cd94ca535f0d9ed76a0fc31c8e4fceb"
        ),
        .binaryTarget(
            name: "_elementtree-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_elementtree-pythonC.xcframework.zip",
            checksum: "a5c653316fa222a4e321842bc5c3991c1dee7e3a92b2e7a1f345fca5e340b40b"
        ),
        .binaryTarget(
            name: "_hashlib-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_hashlib-pythonC.xcframework.zip",
            checksum: "9dfa8c4c5e7c98ad4b0bc7f3927f749104295b4be6722276a22753f97344c469"
        ),
        .binaryTarget(
            name: "_heapq-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_heapq-pythonC.xcframework.zip",
            checksum: "0f0de9f07ec3a97f97f65e0a260de29261354c0005a88ec1e4950015970c55fd"
        ),
        .binaryTarget(
            name: "_json-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_json-pythonC.xcframework.zip",
            checksum: "53b9617c93c86adc3e44868999d65c97474e76e5412ea50eb789e465ec810891"
        ),
        .binaryTarget(
            name: "_lsprof-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_lsprof-pythonC.xcframework.zip",
            checksum: "88c3bfb2146232fb1c0731890438c37f6fce60791e75f85aef3b0df2869c3b22"
        ),
        .binaryTarget(
            name: "_md5-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_md5-pythonC.xcframework.zip",
            checksum: "c203e5cc83e14d898c7ddb1ff1ef33e02d1bd70e42f5eb3c55a05e55e0c452ed"
        ),
        .binaryTarget(
            name: "_multibytecodec-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_multibytecodec-pythonC.xcframework.zip",
            checksum: "137a851741558b2c0a630b31ed6bfa11a9e16780538840a7a53a45d89edc94eb"
        ),
        .binaryTarget(
            name: "_multiprocessing-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_multiprocessing-pythonC.xcframework.zip",
            checksum: "c5bf4b27bfe06d704994cdd599a179312a7f736e6851dca6bd67a6965d313e87"
        ),
        .binaryTarget(
            name: "_opcode-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_opcode-pythonC.xcframework.zip",
            checksum: "3b0bbfa6f29ba9261b8fffde42b8bfc4d9a6a6d15a874b557d06140fe8711ce7"
        ),
        .binaryTarget(
            name: "_pickle-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_pickle-pythonC.xcframework.zip",
            checksum: "4659f3678f2a07b6f672f3210efd1a06d017809e623836a120d40f55e0b9b3cd"
        ),
        .binaryTarget(
            name: "_posixshmem-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_posixshmem-pythonC.xcframework.zip",
            checksum: "2fb0c1bdb4b584538fc5a380b556a8db3e96b707ef3ac383d85bf2a22f824229"
        ),
        .binaryTarget(
            name: "_posixsubprocess-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_posixsubprocess-pythonC.xcframework.zip",
            checksum: "7b87e1ba367c61df179f2eadf2ab23c9498f5228e3d45c50c28820ef994f4e07"
        ),
        .binaryTarget(
            name: "_queue-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_queue-pythonC.xcframework.zip",
            checksum: "8f928841b5dbede7fb39229f6ab464706c0f009a8862caa63ef632f7930d0af2"
        ),
        .binaryTarget(
            name: "_random-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_random-pythonC.xcframework.zip",
            checksum: "c26d16db83d45e2f75090c6941c34f0cc20794fb6018ca6c12a947357337ce5a"
        ),
        .binaryTarget(
            name: "_sha1-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha1-pythonC.xcframework.zip",
            checksum: "f049874d3d09b5a153c2216f5a3ff5ad8034af87c4e21efa17c16f0e38f3b168"
        ),
        .binaryTarget(
            name: "_sha256-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha256-pythonC.xcframework.zip",
            checksum: "4179da657ef5990f8558a89785ec79e2c6c05cc923e51bd955d94957ad863bac"
        ),
        .binaryTarget(
            name: "_sha3-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha3-pythonC.xcframework.zip",
            checksum: "dba560dbde938415449ccab1917b0c403609efca4591b9750220d0dd7b9c6581"
        ),
        .binaryTarget(
            name: "_sha512-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha512-pythonC.xcframework.zip",
            checksum: "eda9985400fcaba316483ed1845fd3a2e46ff54aa57e7f3fe5398d3a64aea28a"
        ),
        .binaryTarget(
            name: "_socket-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_socket-pythonC.xcframework.zip",
            checksum: "f3617af2ba3c1d17436ddc72531237f9b591cea16c8bea87563cd49db661a896"
        ),
        .binaryTarget(
            name: "_sqlite3-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sqlite3-pythonC.xcframework.zip",
            checksum: "d3c7bca9490f028462a7b510a7a72d2243f8eff70c33b2d18c232de5fae6aeb8"
        ),
        .binaryTarget(
            name: "_ssl-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ssl-pythonC.xcframework.zip",
            checksum: "c8566f8ef2462bb8bed9cf9e0bbdc28c70b9e46566efd42c5546a1bb3336839f"
        ),
        .binaryTarget(
            name: "_statistics-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_statistics-pythonC.xcframework.zip",
            checksum: "282da3c81f88354954c6ee1fac9ab4e8f1b1aa6a81963b9cdd1e90d84d3357e3"
        ),
        .binaryTarget(
            name: "_struct-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_struct-pythonC.xcframework.zip",
            checksum: "94d5d2ab7d0b61ec47d79ca804a6bef2681603ebae4c5c8404314273491aa9c4"
        ),
        .binaryTarget(
            name: "_testbuffer-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testbuffer-pythonC.xcframework.zip",
            checksum: "b2c3690ffc53aa4027cc4bb787af76ded64d2920f62cfff291b707657c825683"
        ),
        .binaryTarget(
            name: "_testcapi-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testcapi-pythonC.xcframework.zip",
            checksum: "77011169b30b7e67e26d5f2f9aa06b46307a2cacdb95d617d821879f3b41fbc9"
        ),
        .binaryTarget(
            name: "_testimportmultiple-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testimportmultiple-pythonC.xcframework.zip",
            checksum: "0d2906b3685b216d017a3854fb0e9df430531328fecb49da658feb8ecb596215"
        ),
        .binaryTarget(
            name: "_testinternalcapi-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testinternalcapi-pythonC.xcframework.zip",
            checksum: "bbb4c37f99d3d031eaba8213aa6460e4a6282a60d2de56502d1773ee86988c5b"
        ),
        .binaryTarget(
            name: "_testmultiphase-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testmultiphase-pythonC.xcframework.zip",
            checksum: "395a837037d18abe4eb911d1536be05bafcaa17f890aef8b7c196babe3b06ee2"
        ),
        .binaryTarget(
            name: "_xxsubinterpreters-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_xxsubinterpreters-pythonC.xcframework.zip",
            checksum: "362a06113f6767f1a69d6fd99391f3f64fbb104ed3fb547151518d02011bef01"
        ),
        .binaryTarget(
            name: "_xxtestfuzz-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_xxtestfuzz-pythonC.xcframework.zip",
            checksum: "26e331a6acbc9d4fde658f9bc5402bab4403579865377af428790de772b33561"
        ),
        .binaryTarget(
            name: "_zoneinfo-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_zoneinfo-pythonC.xcframework.zip",
            checksum: "16304dd533541d57ebebd48592aa0aa7dc54e2f1d1ee9abdf6714d90a076d6b8"
        ),
        .binaryTarget(
            name: "array-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/array-pythonC.xcframework.zip",
            checksum: "dded15b6ab6a7e7355463ba62e2c866d79ed89fd2ac6f527167afdaa60fc5386"
        ),
        .binaryTarget(
            name: "audioop-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/audioop-pythonC.xcframework.zip",
            checksum: "66416bc8c0f961b1a14ee5b2c69683377bc423fcdc0224fe09d5aa3622a64719"
        ),
        .binaryTarget(
            name: "binascii-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/binascii-pythonC.xcframework.zip",
            checksum: "78c0c797862b12057b20060ef1bcf4d6d30438068a960cd1adfd71076a835fcb"
        ),
        .binaryTarget(
            name: "cmath-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/cmath-pythonC.xcframework.zip",
            checksum: "4ea49e085a0f71c6d0ca9d3c8bced10156c2e2b3f49fde0a3988e262e33400b1"
        ),
        .binaryTarget(
            name: "fcntl-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/fcntl-pythonC.xcframework.zip",
            checksum: "2c96318ca9bacd7789af6e546cfcadc6fca607c876d579aef7c16a72f23de567"
        ),
        .binaryTarget(
            name: "grp-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/grp-pythonC.xcframework.zip",
            checksum: "f8aa5c72d4a93f37d0f72cb8b1d852e4fadbd8b900880d2acb0472edd65d5dc5"
        ),
        .binaryTarget(
            name: "math-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/math-pythonC.xcframework.zip",
            checksum: "0a500525fd8ab516a7fcd13c2cb0b516c0cc012d24f18fe85586cf5baaf31d0a"
        ),
        .binaryTarget(
            name: "mmap-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/mmap-pythonC.xcframework.zip",
            checksum: "d2b568d21d6789f250b24979a7854b898f202cb018e7de60954d0b901abadeef"
        ),
        .binaryTarget(
            name: "parser-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/parser-pythonC.xcframework.zip",
            checksum: "33594f18c2c7ea450e020ee27d800c64faf9d91ecb05e7a57493c3e44563be33"
        ),
        .binaryTarget(
            name: "pyexpat-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pyexpat-pythonC.xcframework.zip",
            checksum: "ddaf121131f1846003e279e01a0a695fc67a40b73f25c7029633666f4b5c2a20"
        ),
        .binaryTarget(
            name: "resource-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/resource-pythonC.xcframework.zip",
            checksum: "bd3c2ce91cab08cf26ef4625824007616b48885955ec83eeaf72c395747786ad"
        ),
        .binaryTarget(
            name: "select-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/select-pythonC.xcframework.zip",
            checksum: "8f4c578928c5285ffc9d418b90dbe48d51f8ecd22bf2c1a31def59bb224890c1"
        ),
        .binaryTarget(
            name: "syslog-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/syslog-pythonC.xcframework.zip",
            checksum: "370f3f73a4ea0ce4c844873cd7695a2636cd5c42201a240b295a66c2c3cb7308"
        ),
        .binaryTarget(
            name: "termios-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/termios-pythonC.xcframework.zip",
            checksum: "3f2429c918e08037967ac3e2a31f89006acc3a552939ef741a4e527388c543d6"
        ),
        .binaryTarget(
            name: "unicodedata-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/unicodedata-pythonC.xcframework.zip",
            checksum: "45d53801556e7d61ad7074afab689e07bbfa37c125acfbb67bdf96cceb685953"
        ),
        .binaryTarget(
            name: "xxlimited-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/xxlimited-pythonC.xcframework.zip",
            checksum: "4aa6d0721688d613919669f6e25f484916273423f06ec2da3bd092b0240082ef"
        ),
        .binaryTarget(
            name: "zlib-pythonC",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/zlib-pythonC.xcframework.zip",
            checksum: "f3153cc82e2928ea9c0db94cdb17113070f957c712af7245df86f39445aef453"
        ),
        .binaryTarget(
            name: "_asyncio-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_asyncio-pythonD.xcframework.zip",
            checksum: "73e48e687b1a411986eabb7dc03d231a8b7315e7e3594612568d67845429913c"
        ),
        .binaryTarget(
            name: "_bisect-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_bisect-pythonD.xcframework.zip",
            checksum: "7586242172f7247d132f029462e379ff78163901810ea497508d332842fff154"
        ),
        .binaryTarget(
            name: "_blake2-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_blake2-pythonD.xcframework.zip",
            checksum: "645466a95a5b94d32efba9dd242e8f01ddc8888c04e21f0befa2f3727a53e9e3"
        ),
        .binaryTarget(
            name: "_bz2-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_bz2-pythonD.xcframework.zip",
            checksum: "55df334f75faae20c7a70090742535349f02a4b7a5db9f5fa6dbb2d758158bd4"
        ),
        .binaryTarget(
            name: "_codecs_cn-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_cn-pythonD.xcframework.zip",
            checksum: "67fae26e040b1e8e324b1f275f741a883f552f58527ff66fed809d75384a4d56"
        ),
        .binaryTarget(
            name: "_codecs_hk-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_hk-pythonD.xcframework.zip",
            checksum: "aed03a636ef50877ca42435d37fa24111f425b2916302aa9855d9f221672c4e4"
        ),
        .binaryTarget(
            name: "_codecs_iso2022-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_iso2022-pythonD.xcframework.zip",
            checksum: "1303f59acd04fc0846808dfdc4486c54ad319fe9b22b8c068d41c3f2f939a8f7"
        ),
        .binaryTarget(
            name: "_codecs_jp-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_jp-pythonD.xcframework.zip",
            checksum: "1e627d9357915c1cd41494b0368ae06362c53ee487cf777098e6cdb0950d7734"
        ),
        .binaryTarget(
            name: "_codecs_kr-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_kr-pythonD.xcframework.zip",
            checksum: "faf23d904f83940f7df87123c8494ea46fe118fe31183373eacbefb9b69d9663"
        ),
        .binaryTarget(
            name: "_codecs_tw-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_tw-pythonD.xcframework.zip",
            checksum: "8e8a0422b8d070dc4ad88254fcba552ebf29d30bfe6bfa08dcc1ce10b0d57810"
        ),
        .binaryTarget(
            name: "_contextvars-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_contextvars-pythonD.xcframework.zip",
            checksum: "b5886b8a2949e722c7d76d678c122ed88c167b898f805587e5713bff6c2a95cb"
        ),
        .binaryTarget(
            name: "_crypt-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_crypt-pythonD.xcframework.zip",
            checksum: "b5f2a4171c65103131b5e7fc0ba5fd25dd2ddbfb9b7005766421010212ba0856"
        ),
        .binaryTarget(
            name: "_csv-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_csv-pythonD.xcframework.zip",
            checksum: "0c14ed5771358cae694f3a4c280a120dd7d3337c621563959eb5d9b1d4925ec5"
        ),
        .binaryTarget(
            name: "_ctypes-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ctypes-pythonD.xcframework.zip",
            checksum: "3869b80ef54b43a861b676b904524e917ebc3bfe8fcd0d96c803c122d958351a"
        ),
        .binaryTarget(
            name: "_ctypes_test-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ctypes_test-pythonD.xcframework.zip",
            checksum: "5031d0c7423019953703dd07c4708966215ed67b4e3e68340583ca8241ca047b"
        ),
        .binaryTarget(
            name: "_datetime-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_datetime-pythonD.xcframework.zip",
            checksum: "01d63f4b424949c5ec2b4c3c3542f70bd5c1c5a4ae2e4a203a920058b4d93f8a"
        ),
        .binaryTarget(
            name: "_dbm-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_dbm-pythonD.xcframework.zip",
            checksum: "42995b7342aec7a681738d45e7fc6b85c95e2148134bffa01351b05211aaf702"
        ),
        .binaryTarget(
            name: "_decimal-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_decimal-pythonD.xcframework.zip",
            checksum: "3114e8477b3eba96df009f2aa8306e77cbab54fa92771198e9e4f2e4ba4bdac2"
        ),
        .binaryTarget(
            name: "_elementtree-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_elementtree-pythonD.xcframework.zip",
            checksum: "def504597f74da7427ef4b56a506f88171054b015764870d8976cbba9b968328"
        ),
        .binaryTarget(
            name: "_hashlib-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_hashlib-pythonD.xcframework.zip",
            checksum: "c79efc7c77ae6ee41210c582ccda484556fb216bb723c4de74a38f869ffadd72"
        ),
        .binaryTarget(
            name: "_heapq-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_heapq-pythonD.xcframework.zip",
            checksum: "b628078191f1885f829c0e9b3ec94319c94de26b0cbad35f1cdcf6f837df32b9"
        ),
        .binaryTarget(
            name: "_json-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_json-pythonD.xcframework.zip",
            checksum: "80cf6f3a136e9c7fb434deb2d1b30899b3e7d11e9fd261c01f7d1200b479486b"
        ),
        .binaryTarget(
            name: "_lsprof-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_lsprof-pythonD.xcframework.zip",
            checksum: "72b15d92773b88f9f7f40a8f576e194a29b0bc7dc486151b9e9faf9a3c85311e"
        ),
        .binaryTarget(
            name: "_md5-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_md5-pythonD.xcframework.zip",
            checksum: "17fc5e8faa108fc0bb283f5efa9b5ef32697a47cbeaef42c328a4ddbbb13045b"
        ),
        .binaryTarget(
            name: "_multibytecodec-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_multibytecodec-pythonD.xcframework.zip",
            checksum: "024c124f889776794d1b505482af0dc631e6688fcf13c0bd9796b4ceecbbf990"
        ),
        .binaryTarget(
            name: "_multiprocessing-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_multiprocessing-pythonD.xcframework.zip",
            checksum: "f5c731fd4e1d236dfab3d179741fd634cb3c1d61074f6c64a4412fdb731abc0f"
        ),
        .binaryTarget(
            name: "_opcode-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_opcode-pythonD.xcframework.zip",
            checksum: "50737f9b9ae9ac2b3526af4b2fea43823e172676026792d3f90b2b60c1585ab9"
        ),
        .binaryTarget(
            name: "_pickle-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_pickle-pythonD.xcframework.zip",
            checksum: "094da601121f267e4177a778a973c98774a5b4f9fd7932c8a4c8028510d3512c"
        ),
        .binaryTarget(
            name: "_posixshmem-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_posixshmem-pythonD.xcframework.zip",
            checksum: "bc4f0fe0f7e5b374fd7c998ddf9f08b8f304ef55d639ea8a09831ffd40ebcc25"
        ),
        .binaryTarget(
            name: "_posixsubprocess-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_posixsubprocess-pythonD.xcframework.zip",
            checksum: "7852122e644bc48f1b1198e96eda7b327a3bcb8931e76900428b727e9b9956ce"
        ),
        .binaryTarget(
            name: "_queue-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_queue-pythonD.xcframework.zip",
            checksum: "5d6cdb4914a225e2e062b95415ad9ffca7c7037909d8e2851f62194efed36076"
        ),
        .binaryTarget(
            name: "_random-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_random-pythonD.xcframework.zip",
            checksum: "d35babc5692e9cf1aaa55397f7e423867d72901d50d12b09a71b7be1d5670f10"
        ),
        .binaryTarget(
            name: "_sha1-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha1-pythonD.xcframework.zip",
            checksum: "4c602ae45b9f7ce4132a8416173aaf0fa3c8132fc42326cbada7744cbab6a351"
        ),
        .binaryTarget(
            name: "_sha256-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha256-pythonD.xcframework.zip",
            checksum: "4ee4f406507a72e2de6a0799927c9e8481e69801e5db8d06e4a4fb32e802f9cf"
        ),
        .binaryTarget(
            name: "_sha3-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha3-pythonD.xcframework.zip",
            checksum: "a1acf59123a0b79e5fa4d8781af058496abbd7d25bf09639493df5e245fe3b3a"
        ),
        .binaryTarget(
            name: "_sha512-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha512-pythonD.xcframework.zip",
            checksum: "c9c767cbf43ef4eea81479fa07b88f952594dc946803ff6fafdbe8d254928b47"
        ),
        .binaryTarget(
            name: "_socket-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_socket-pythonD.xcframework.zip",
            checksum: "ae8fd360b0e6cc62dd4003232e814a7978fadf0b71300b35f0b41ae1a86b3ee7"
        ),
        .binaryTarget(
            name: "_sqlite3-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sqlite3-pythonD.xcframework.zip",
            checksum: "633bb46ac3916dfbefd8a09b807ce72194ac517faffbc21f241034eafbd0debe"
        ),
        .binaryTarget(
            name: "_ssl-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ssl-pythonD.xcframework.zip",
            checksum: "211414989ce85f16e65fd5261f4331f20c346ccee0ee3e320db81cbe96be581f"
        ),
        .binaryTarget(
            name: "_statistics-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_statistics-pythonD.xcframework.zip",
            checksum: "4a35be0f12034f94f3084867ceeda5027d35516d22630394101f5761e44a81f4"
        ),
        .binaryTarget(
            name: "_struct-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_struct-pythonD.xcframework.zip",
            checksum: "988fa43ae204414feecea77340edcaaf3a014c91b8e5f075f634e60cf4fea343"
        ),
        .binaryTarget(
            name: "_testbuffer-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testbuffer-pythonD.xcframework.zip",
            checksum: "22c36a832bc3d8902ef40901f4d3ff95fff630cdc6f9f5601d7b5399002a3e17"
        ),
        .binaryTarget(
            name: "_testcapi-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testcapi-pythonD.xcframework.zip",
            checksum: "b3755bb49c3aa3dced9896c506b0418e5478f0dbe972cdc77f10aeeba8a0bf52"
        ),
        .binaryTarget(
            name: "_testimportmultiple-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testimportmultiple-pythonD.xcframework.zip",
            checksum: "145d889b123bc2398c03a90b4e7dffc8fc4675d4ebb5b98422641cc9da5b96a5"
        ),
        .binaryTarget(
            name: "_testinternalcapi-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testinternalcapi-pythonD.xcframework.zip",
            checksum: "c6f93a2268c04aff68caf366dfc7579ecf0add7400081059d493563e10604983"
        ),
        .binaryTarget(
            name: "_testmultiphase-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testmultiphase-pythonD.xcframework.zip",
            checksum: "98863c0e4deca5f636d8d339e15d0082e40923d24a9747aa4ff86835df2e4044"
        ),
        .binaryTarget(
            name: "_xxsubinterpreters-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_xxsubinterpreters-pythonD.xcframework.zip",
            checksum: "b708247ef66cec50a7b9c48151815f0e1fdaa9013c15ce1564c4d08b32d28c9a"
        ),
        .binaryTarget(
            name: "_xxtestfuzz-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_xxtestfuzz-pythonD.xcframework.zip",
            checksum: "674d9d8d5f2e5343b0ae40b67413cd1cfc3eb413d44566cdaeca282ae8b8a1d4"
        ),
        .binaryTarget(
            name: "_zoneinfo-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_zoneinfo-pythonD.xcframework.zip",
            checksum: "76e7ec4fda53a90eaa17880966382b0e494864082129dc414924f483a0ffbcc2"
        ),
        .binaryTarget(
            name: "array-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/array-pythonD.xcframework.zip",
            checksum: "6e39b474c30b0e4ebf669c7ded73c7cbdae41c0b4a2fcd2402cbd919b72684c0"
        ),
        .binaryTarget(
            name: "audioop-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/audioop-pythonD.xcframework.zip",
            checksum: "485bb6937fd9669c136e8c5ef1ff59bee2ddebc0c646e219580b64397404f081"
        ),
        .binaryTarget(
            name: "binascii-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/binascii-pythonD.xcframework.zip",
            checksum: "d9b3227f846b69daf5f2db3195377d4a45e448ad77035d31a149071c16b3c820"
        ),
        .binaryTarget(
            name: "cmath-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/cmath-pythonD.xcframework.zip",
            checksum: "8191ccaacf9bc816815dd8acd1c7a05b1cdb52aa6244d98cfc083a87e7e64cf5"
        ),
        .binaryTarget(
            name: "fcntl-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/fcntl-pythonD.xcframework.zip",
            checksum: "e9de556e537e26d072258a71cc4f3de812542b16233f073839718f84d7df0e12"
        ),
        .binaryTarget(
            name: "grp-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/grp-pythonD.xcframework.zip",
            checksum: "c8c78f8e2cb8fa23645a848037d15b9dcb5c5d35c892591cc1541229fa18dc65"
        ),
        .binaryTarget(
            name: "math-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/math-pythonD.xcframework.zip",
            checksum: "02e7fa65d51015bb037dba7be1c7e7d6db2c18b7498746fcc3b50674c76d20a4"
        ),
        .binaryTarget(
            name: "mmap-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/mmap-pythonD.xcframework.zip",
            checksum: "c9f0d05862bcc895b71a7f0aaa663fab11cc7389ca141cf42f945bd60b4dfddd"
        ),
        .binaryTarget(
            name: "parser-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/parser-pythonD.xcframework.zip",
            checksum: "217d0c6193dd1dc39657c888fa427805cd4765f9d43e96ba42a92e1eb0fd475c"
        ),
        .binaryTarget(
            name: "pyexpat-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pyexpat-pythonD.xcframework.zip",
            checksum: "59a84dbcafa6e0c878c843f0985a688e829c2075111380f48f5b6d74b21ee085"
        ),
        .binaryTarget(
            name: "resource-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/resource-pythonD.xcframework.zip",
            checksum: "3d2c7015bb1eb70b752859f00ede935dd345471dd58d64b08289329740f0d1f8"
        ),
        .binaryTarget(
            name: "select-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/select-pythonD.xcframework.zip",
            checksum: "335f259d2d61d1b6f93d92747e89b53d75492078974d0c173a045374b5ac14c3"
        ),
        .binaryTarget(
            name: "syslog-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/syslog-pythonD.xcframework.zip",
            checksum: "39d44694176a420396cbfb862930462111a1f2f473b5f8d06d1b7c08085a27a5"
        ),
        .binaryTarget(
            name: "termios-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/termios-pythonD.xcframework.zip",
            checksum: "7025001702af77f0c193b78b9de233292339885fb9bcff78059e6258cea16aa5"
        ),
        .binaryTarget(
            name: "unicodedata-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/unicodedata-pythonD.xcframework.zip",
            checksum: "a8a2b1f5c8db19f4cdd0eaeea4e622954778d6c7d81295240a668253dd5a6164"
        ),
        .binaryTarget(
            name: "xxlimited-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/xxlimited-pythonD.xcframework.zip",
            checksum: "151ed50d48413b4f5be1051db473fca57f2089f8ef0356baaca76f26122c3fad"
        ),
        .binaryTarget(
            name: "zlib-pythonD",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/zlib-pythonD.xcframework.zip",
            checksum: "8851693cd5ff1334b481c618452ffe62f19303410b548acce90d8927db2442f7"
        ),
        .binaryTarget(
            name: "_asyncio-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_asyncio-pythonE.xcframework.zip",
            checksum: "e04418a4b6088be4f1fb37e5398e13cd2a133c135ed3ff69f6649ccc13d10cbd"
        ),
        .binaryTarget(
            name: "_bisect-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_bisect-pythonE.xcframework.zip",
            checksum: "e787ae98743be0b0d8b0fc7205bd3532c79c0f63ccd54d3b283e150a9c88e3a5"
        ),
        .binaryTarget(
            name: "_blake2-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_blake2-pythonE.xcframework.zip",
            checksum: "76f8bae5e4ed1531e1758bcb9d43dd4ac701d8d9d92c70763f4e92f29a4aeeba"
        ),
        .binaryTarget(
            name: "_bz2-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_bz2-pythonE.xcframework.zip",
            checksum: "3c97db2f181a5d1b629bdf825b407570ec2121c2e0d8a439d7fe7d03667c3f27"
        ),
        .binaryTarget(
            name: "_codecs_cn-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_cn-pythonE.xcframework.zip",
            checksum: "32318db7ccf49092aacb09b462cc32719977248a4c09e77df086dbbeba6a8ac8"
        ),
        .binaryTarget(
            name: "_codecs_hk-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_hk-pythonE.xcframework.zip",
            checksum: "527a45393eb3f16033c654fed807290ad29b8b5222259a301366b502ac19b8bf"
        ),
        .binaryTarget(
            name: "_codecs_iso2022-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_iso2022-pythonE.xcframework.zip",
            checksum: "a0ef11da2d1230b3ee40a9b63dcdd70e2dad6e1c29aaea62c15c5568bf9d4d6b"
        ),
        .binaryTarget(
            name: "_codecs_jp-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_jp-pythonE.xcframework.zip",
            checksum: "f7057bbeef6243d1f32d15defbaf57e4b0fe9aa102c2204709bc524309e2407f"
        ),
        .binaryTarget(
            name: "_codecs_kr-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_kr-pythonE.xcframework.zip",
            checksum: "474639230049a8669e02bde359bb75aec24a720e4665870280411aeb5d023533"
        ),
        .binaryTarget(
            name: "_codecs_tw-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_codecs_tw-pythonE.xcframework.zip",
            checksum: "fcdfbaa0a595a1358d2e5bb8839471da96927a33fe11653bef23135d31bf2728"
        ),
        .binaryTarget(
            name: "_contextvars-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_contextvars-pythonE.xcframework.zip",
            checksum: "2f6700a4dc54787a5e4ca2393e0ba8a1fcf572c38119cb55b63a9d922716b17f"
        ),
        .binaryTarget(
            name: "_crypt-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_crypt-pythonE.xcframework.zip",
            checksum: "511222c48aa3d64365a16aa8b3658d1872f002f47b08797d4dde790b5e09ff48"
        ),
        .binaryTarget(
            name: "_csv-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_csv-pythonE.xcframework.zip",
            checksum: "3d22520c36443d51e36fff1a5230690fbfe4eeb4e8c3fae10db13d68d8ac8f8c"
        ),
        .binaryTarget(
            name: "_ctypes-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ctypes-pythonE.xcframework.zip",
            checksum: "749760a857c68ae1f3201b73cfe50b2d7fdd2a435bd366aa598e7479aefc5bdf"
        ),
        .binaryTarget(
            name: "_ctypes_test-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ctypes_test-pythonE.xcframework.zip",
            checksum: "1a740f1464805c5d6da6b967e451d7a1d5ba874a9a0116466ca0359196b8ad00"
        ),
        .binaryTarget(
            name: "_datetime-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_datetime-pythonE.xcframework.zip",
            checksum: "b5bb24f790e964b09cb07c36c75fdcf31f29977bb6a23f4a89157b06b3ab7d5f"
        ),
        .binaryTarget(
            name: "_dbm-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_dbm-pythonE.xcframework.zip",
            checksum: "18368f3af58a3cd7064315417ed260c126643e450d2bd21a7608d8ecec54a6be"
        ),
        .binaryTarget(
            name: "_decimal-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_decimal-pythonE.xcframework.zip",
            checksum: "dc46ac45c2e703ea63a09d5e559603f454c45f9e60ab90fb2ca13eff15ba9f1b"
        ),
        .binaryTarget(
            name: "_elementtree-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_elementtree-pythonE.xcframework.zip",
            checksum: "bd9263096eb2be3f008388990c85d0049b8ac829256e83e618b971b66ae100d0"
        ),
        .binaryTarget(
            name: "_hashlib-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_hashlib-pythonE.xcframework.zip",
            checksum: "c1624818cf85b56322f1aa02a939f9e19f814e76860f39dc1792e66372ffaa5a"
        ),
        .binaryTarget(
            name: "_heapq-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_heapq-pythonE.xcframework.zip",
            checksum: "3ea4fafc10f65b98d64346e7703e91a57f5e84fbf9070c23958877acd8befe83"
        ),
        .binaryTarget(
            name: "_json-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_json-pythonE.xcframework.zip",
            checksum: "e6f79aa185d197302f757708c85f71018907e00f800e8bb27d2afde9bf370f20"
        ),
        .binaryTarget(
            name: "_lsprof-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_lsprof-pythonE.xcframework.zip",
            checksum: "b0d0ffe8395829e8afb3fa7963781cba6ae9b528dd240cbc9c2543fb58df7328"
        ),
        .binaryTarget(
            name: "_md5-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_md5-pythonE.xcframework.zip",
            checksum: "05dde8a96e60ab94a7861815ea41418d331cd4c2b727e3cbbfeab0a82cc6808a"
        ),
        .binaryTarget(
            name: "_multibytecodec-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_multibytecodec-pythonE.xcframework.zip",
            checksum: "803e6c1536fe4671b0c8a74e21eb0e8df8823cb4c20bd0dc6252bc5946d27a30"
        ),
        .binaryTarget(
            name: "_multiprocessing-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_multiprocessing-pythonE.xcframework.zip",
            checksum: "052fa409366903a4519e14fd80bdcd8f3f289fdd0f50fef6185e51d2d8a1b962"
        ),
        .binaryTarget(
            name: "_opcode-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_opcode-pythonE.xcframework.zip",
            checksum: "990cce3dfb33948a4beee65e6c4e2797a7d33ec0fee22770a004bade952cefba"
        ),
        .binaryTarget(
            name: "_pickle-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_pickle-pythonE.xcframework.zip",
            checksum: "9efcc34ac82407d00ddd9c5ae07ac40270343ecfb30faedf22bdf6e7550a7468"
        ),
        .binaryTarget(
            name: "_posixshmem-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_posixshmem-pythonE.xcframework.zip",
            checksum: "01ed1df7d9c9153f8c02b12e18f18037cba97727f0bfe9794264e21a243493d3"
        ),
        .binaryTarget(
            name: "_posixsubprocess-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_posixsubprocess-pythonE.xcframework.zip",
            checksum: "ba2b5a109e648ed1633f7a61d0676c352f8447fdd3dd4c806add2065cf9a3b9b"
        ),
        .binaryTarget(
            name: "_queue-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_queue-pythonE.xcframework.zip",
            checksum: "2edde3e5bb2a180b6047ff83a931826f17a58c3ea106c513349051c1e9685f7a"
        ),
        .binaryTarget(
            name: "_random-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_random-pythonE.xcframework.zip",
            checksum: "7c59c18c066398c6e2b807e589c8978adb8aa7725dc9fde223045849e7e9a599"
        ),
        .binaryTarget(
            name: "_sha1-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha1-pythonE.xcframework.zip",
            checksum: "bdc86926fb0801cac96b56f6e02e71d1406fe47753e0b896de44cecbe6875e3e"
        ),
        .binaryTarget(
            name: "_sha256-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha256-pythonE.xcframework.zip",
            checksum: "e846745a317801ec9b3838191175c5f1c62ed7c87c9f837a1b4ce2f1a5630c4b"
        ),
        .binaryTarget(
            name: "_sha3-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha3-pythonE.xcframework.zip",
            checksum: "4f0843d49353c8f65e3c433c89642e47380ec8ace0ac1b6ee2af0996419d5d9e"
        ),
        .binaryTarget(
            name: "_sha512-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sha512-pythonE.xcframework.zip",
            checksum: "acec1ee2d650cb8c8e292bb51cb5c64cdeac568b86b37097c8190398c5df742a"
        ),
        .binaryTarget(
            name: "_socket-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_socket-pythonE.xcframework.zip",
            checksum: "6ca34aa7a55b6ee09598b760a07f43cdbea66d37a36c87863ec864b41beaccde"
        ),
        .binaryTarget(
            name: "_sqlite3-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_sqlite3-pythonE.xcframework.zip",
            checksum: "7fda4d00e8c10e72dee4e590eb79f59334aa49bf53b9ef03629dd10b16a7bc32"
        ),
        .binaryTarget(
            name: "_ssl-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_ssl-pythonE.xcframework.zip",
            checksum: "68b819957b2307a645d16bb80ee855146ad807b30c11266d94707b7da07f58de"
        ),
        .binaryTarget(
            name: "_statistics-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_statistics-pythonE.xcframework.zip",
            checksum: "bb6e4fe04875e5afca7dd3b9279f30ac2322508d73e9e995fbc3d12cb02c3c97"
        ),
        .binaryTarget(
            name: "_struct-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_struct-pythonE.xcframework.zip",
            checksum: "2d9852b26a890748ac2064f08a43e5494036be6ea0457e5a93a8be45dc9fdd7e"
        ),
        .binaryTarget(
            name: "_testbuffer-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testbuffer-pythonE.xcframework.zip",
            checksum: "42ddd1b336b68f8e3176f0cc3722a3768058ac44fca0e467b16695802f2289e8"
        ),
        .binaryTarget(
            name: "_testcapi-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testcapi-pythonE.xcframework.zip",
            checksum: "cc7978ba4d51497c468f7432d56b7fc5f1dca7cc0f983cbd4777dc4a10dd473a"
        ),
        .binaryTarget(
            name: "_testimportmultiple-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testimportmultiple-pythonE.xcframework.zip",
            checksum: "652de44d05464705b73d904a98117847e5905e4059a0987f715226c91d60e767"
        ),
        .binaryTarget(
            name: "_testinternalcapi-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testinternalcapi-pythonE.xcframework.zip",
            checksum: "473408f41d64ca27a7325cf966642aefbb425904122b00fbf842af86e9fc6bf7"
        ),
        .binaryTarget(
            name: "_testmultiphase-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_testmultiphase-pythonE.xcframework.zip",
            checksum: "6fd10ee38626dbbdfe2190fcf5f45b04f22051e834a97ea2c35b426af3c39cdb"
        ),
        .binaryTarget(
            name: "_xxsubinterpreters-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_xxsubinterpreters-pythonE.xcframework.zip",
            checksum: "ab385da946a14442f6deb1e498341fc427fae7cb34774d7c8f18d48cbf92f336"
        ),
        .binaryTarget(
            name: "_xxtestfuzz-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_xxtestfuzz-pythonE.xcframework.zip",
            checksum: "b0d186eba0d5841195e1606458436d60b5ce58b9cab9c3c4b00ddeda5d0b8ab0"
        ),
        .binaryTarget(
            name: "_zoneinfo-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/_zoneinfo-pythonE.xcframework.zip",
            checksum: "c5e6c83895ffaf37d99ce7d7be130f757965aa67d1d187b06902675ee67e3516"
        ),
        .binaryTarget(
            name: "array-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/array-pythonE.xcframework.zip",
            checksum: "01e4266fae5d21fabd4492448c34e81ad320782b2cb80bb1157e0746fd8679c7"
        ),
        .binaryTarget(
            name: "audioop-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/audioop-pythonE.xcframework.zip",
            checksum: "d204449d5afc9308a34beca4f8fdf4f5799a6d2e57c6bb617ee3283cba064b93"
        ),
        .binaryTarget(
            name: "binascii-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/binascii-pythonE.xcframework.zip",
            checksum: "186378f7341d6e3ad5e54619f163502d49f279181b2c65929146b987f2e61b04"
        ),
        .binaryTarget(
            name: "cmath-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/cmath-pythonE.xcframework.zip",
            checksum: "44882f8c7d2988cb4e9567f42f8139f31cd9805959dded17cfbedea632bb34f4"
        ),
        .binaryTarget(
            name: "fcntl-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/fcntl-pythonE.xcframework.zip",
            checksum: "29fb7781f9257ac662c0808cabb589aa7b74fe42dcb485fed035095dc323508e"
        ),
        .binaryTarget(
            name: "grp-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/grp-pythonE.xcframework.zip",
            checksum: "ec232c45a54b769e2aec9c6bdc8b0f1af66ebc5b48a38f16fb90a6a39db1c34c"
        ),
        .binaryTarget(
            name: "math-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/math-pythonE.xcframework.zip",
            checksum: "ed41003fb6dbd654ad10cac0f63320902bc4a5139d817c1874d4c9e3dca2b5f0"
        ),
        .binaryTarget(
            name: "mmap-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/mmap-pythonE.xcframework.zip",
            checksum: "d312cbb3c8b6be2db2594c87b1a82a852fd26b6c8706328fc5e90f868edb8791"
        ),
        .binaryTarget(
            name: "parser-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/parser-pythonE.xcframework.zip",
            checksum: "c5479cef7ea42aaebfdde1c6e4d1336f5ad256560c106e0f5ebb89dd877ccbb7"
        ),
        .binaryTarget(
            name: "pyexpat-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/pyexpat-pythonE.xcframework.zip",
            checksum: "259811b4125e3c34a9ca599a8a34cb69a1f96213082d4059931d14e521c23ca0"
        ),
        .binaryTarget(
            name: "resource-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/resource-pythonE.xcframework.zip",
            checksum: "53955ca6d04bded81e892475ce0d8a98db6bf2c5582b7a638663083c8879b379"
        ),
        .binaryTarget(
            name: "select-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/select-pythonE.xcframework.zip",
            checksum: "e3fd48da5cded723326a4c9cce693f2086ee01531a257a8e467da06779ad34cc"
        ),
        .binaryTarget(
            name: "syslog-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/syslog-pythonE.xcframework.zip",
            checksum: "ad4a005a3f578bb713ec8fb9ad53fc4722dbea81beea963b0dc1f6803678bfde"
        ),
        .binaryTarget(
            name: "termios-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/termios-pythonE.xcframework.zip",
            checksum: "6aeac2faf3b69bd8b0cbd4df18bacdc0e6fceda1cf265d2d127d6e130c6e0390"
        ),
        .binaryTarget(
            name: "unicodedata-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/unicodedata-pythonE.xcframework.zip",
            checksum: "90f40853730b2d3348e8f88f4ebad4065cbb8f48f232ad0d3a8539fb492567a6"
        ),
        .binaryTarget(
            name: "xxlimited-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/xxlimited-pythonE.xcframework.zip",
            checksum: "d8bf9849c1eb8e5a3ee92a335a55110818ecc1559ed6eb93d48e63af4afa6c0c"
        ),
        .binaryTarget(
            name: "zlib-pythonE",
            url: "https://github.com/holzschu/cpython/releases/download/v1.0/zlib-pythonE.xcframework.zip",
            checksum: "00a8a019f1f91d2277d598be9c0f29c031e97a148048d3cfcf76a7ded4bc204e"
        )
    ]
)
