#! /bin/sh

cat << EOM > Package.swift
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
EOM

# Top five frameworks
for framework in python3_ios pythonA pythonB pythonC pythonD pythonE
do 
	echo $framework
	echo "        .binaryTarget(" >> Package.swift
	echo "            name: \"$framework\"," >> Package.swift
	echo "            url: \"https://github.com/holzschu/cpython/releases/download/v1.0/$framework.xcframework.zip\"," >> Package.swift
	echo "            checksum: \"\c" >> Package.swift
	checksum=`swift package compute-checksum  XcFrameworks/$framework.xcframework.zip`
	echo $checksum "\c" >> Package.swift
	echo "\"" >> Package.swift
	# Remove last space before quote:: 
	sed '$ s/ "$/"/' Package.swift > tmpPack
	mv tmpPack Package.swift
    echo "        ),"  >> Package.swift
done
# All the other frameworks:
for package in python3_ios pythonA pythonB pythonC pythonD pythonE
do 
	for name in _asyncio _bisect _blake2 _bz2 _codecs_cn _codecs_hk _codecs_iso2022 _codecs_jp _codecs_kr _codecs_tw _contextvars _crypt _csv _ctypes _ctypes_test _datetime _dbm _decimal _elementtree _hashlib _heapq _json _lsprof _md5 _multibytecodec _multiprocessing _opcode _pickle _posixshmem _posixsubprocess _queue _random _sha1 _sha256 _sha3 _sha512 _socket _sqlite3 _ssl _statistics _struct _testbuffer _testcapi _testimportmultiple _testinternalcapi _testmultiphase _xxsubinterpreters _xxtestfuzz _zoneinfo array audioop binascii cmath fcntl grp math mmap parser pyexpat resource select syslog termios unicodedata xxlimited zlib
	do 
		framework=${name}-${package}
		echo $framework
		echo "        .binaryTarget(" >> Package.swift
		echo "            name: \"$framework\"," >> Package.swift
		echo "            url: \"https://github.com/holzschu/cpython/releases/download/v1.0/$framework.xcframework.zip\"," >> Package.swift
		echo "            checksum: \"\c" >> Package.swift
		checksum=`swift package compute-checksum  XcFrameworks/$framework.xcframework.zip`
		echo $checksum "\c" >> Package.swift
		echo "\"" >> Package.swift
		# Remove last space before quote:: 
		sed '$ s/ "$/"/' Package.swift > tmpPack
		mv tmpPack Package.swift
		echo "        ),"  >> Package.swift
	done	
done
# Remove the last comma 
sed '$ s/.$//' Package.swift > tmpPack
mv tmpPack Package.swift
cat << EOM >> Package.swift
    ]
)
EOM
