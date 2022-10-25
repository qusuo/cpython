#! /bin/sh

cat << EOM > Package.swift
// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Python",
	products: [
		.library(name: "Python", targets: ["python3_ios", "pythonA", "pythonB", "pythonC", "pythonD", "pythonE", \
                 "_asyncio-python3_ios", \
                 "_asyncio-pythonA", \
                 "_asyncio-pythonB", \
                 "_asyncio-pythonC", \
                 "_asyncio-pythonD", \
                 "_asyncio-pythonE", \
                 "_bisect-python3_ios", \
                 "_bisect-pythonA", \
                 "_bisect-pythonB", \
                 "_bisect-pythonC", \
                 "_bisect-pythonD", \
                 "_bisect-pythonE", \
                 "_blake2-python3_ios", \
                 "_blake2-pythonA", \
                 "_blake2-pythonB", \
                 "_blake2-pythonC", \
                 "_blake2-pythonD", \
                 "_blake2-pythonE", \
                 "_bz2-python3_ios", \
                 "_bz2-pythonA", \
                 "_bz2-pythonB", \
                 "_bz2-pythonC", \
                 "_bz2-pythonD", \
                 "_bz2-pythonE", \
                 "_codecs_cn-python3_ios", \
                 "_codecs_cn-pythonA", \
                 "_codecs_cn-pythonB", \
                 "_codecs_cn-pythonC", \
                 "_codecs_cn-pythonD", \
                 "_codecs_cn-pythonE", \
                 "_codecs_hk-python3_ios", \
                 "_codecs_hk-pythonA", \
                 "_codecs_hk-pythonB", \
                 "_codecs_hk-pythonC", \
                 "_codecs_hk-pythonD", \
                 "_codecs_hk-pythonE", \
                 "_codecs_iso2022-python3_ios", \
                 "_codecs_iso2022-pythonA", \
                 "_codecs_iso2022-pythonB", \
                 "_codecs_iso2022-pythonC", \
                 "_codecs_iso2022-pythonD", \
                 "_codecs_iso2022-pythonE", \
                 "_codecs_jp-python3_ios", \
                 "_codecs_jp-pythonA", \
                 "_codecs_jp-pythonB", \
                 "_codecs_jp-pythonC", \
                 "_codecs_jp-pythonD", \
                 "_codecs_jp-pythonE", \
                 "_codecs_kr-python3_ios", \
                 "_codecs_kr-pythonA", \
                 "_codecs_kr-pythonB", \
                 "_codecs_kr-pythonC", \
                 "_codecs_kr-pythonD", \
                 "_codecs_kr-pythonE", \
                 "_codecs_tw-python3_ios", \
                 "_codecs_tw-pythonA", \
                 "_codecs_tw-pythonB", \
                 "_codecs_tw-pythonC", \
                 "_codecs_tw-pythonD", \
                 "_codecs_tw-pythonE", \
                 "_contextvars-python3_ios", \
                 "_contextvars-pythonA", \
                 "_contextvars-pythonB", \
                 "_contextvars-pythonC", \
                 "_contextvars-pythonD", \
                 "_contextvars-pythonE", \
                 "_crypt-python3_ios", \
                 "_crypt-pythonA", \
                 "_crypt-pythonB", \
                 "_crypt-pythonC", \
                 "_crypt-pythonD", \
                 "_crypt-pythonE", \
                 "_csv-python3_ios", \
                 "_csv-pythonA", \
                 "_csv-pythonB", \
                 "_csv-pythonC", \
                 "_csv-pythonD", \
                 "_csv-pythonE", \
                 "_ctypes-python3_ios", \
                 "_ctypes-pythonA", \
                 "_ctypes-pythonB", \
                 "_ctypes-pythonC", \
                 "_ctypes-pythonD", \
                 "_ctypes-pythonE", \
                 "_ctypes_test-python3_ios", \
                 "_ctypes_test-pythonA", \
                 "_ctypes_test-pythonB", \
                 "_ctypes_test-pythonC", \
                 "_ctypes_test-pythonD", \
                 "_ctypes_test-pythonE", \
                 "_datetime-python3_ios", \
                 "_datetime-pythonA", \
                 "_datetime-pythonB", \
                 "_datetime-pythonC", \
                 "_datetime-pythonD", \
                 "_datetime-pythonE", \
                 "_dbm-python3_ios", \
                 "_dbm-pythonA", \
                 "_dbm-pythonB", \
                 "_dbm-pythonC", \
                 "_dbm-pythonD", \
                 "_dbm-pythonE", \
                 "_decimal-python3_ios", \
                 "_decimal-pythonA", \
                 "_decimal-pythonB", \
                 "_decimal-pythonC", \
                 "_decimal-pythonD", \
                 "_decimal-pythonE", \
                 "_elementtree-python3_ios", \
                 "_elementtree-pythonA", \
                 "_elementtree-pythonB", \
                 "_elementtree-pythonC", \
                 "_elementtree-pythonD", \
                 "_elementtree-pythonE", \
                 "_hashlib-python3_ios", \
                 "_hashlib-pythonA", \
                 "_hashlib-pythonB", \
                 "_hashlib-pythonC", \
                 "_hashlib-pythonD", \
                 "_hashlib-pythonE", \
                 "_heapq-python3_ios", \
                 "_heapq-pythonA", \
                 "_heapq-pythonB", \
                 "_heapq-pythonC", \
                 "_heapq-pythonD", \
                 "_heapq-pythonE", \
                 "_json-python3_ios", \
                 "_json-pythonA", \
                 "_json-pythonB", \
                 "_json-pythonC", \
                 "_json-pythonD", \
                 "_json-pythonE", \
                 "_lsprof-python3_ios", \
                 "_lsprof-pythonA", \
                 "_lsprof-pythonB", \
                 "_lsprof-pythonC", \
                 "_lsprof-pythonD", \
                 "_lsprof-pythonE", \
                 "_md5-python3_ios", \
                 "_md5-pythonA", \
                 "_md5-pythonB", \
                 "_md5-pythonC", \
                 "_md5-pythonD", \
                 "_md5-pythonE", \
                 "_multibytecodec-python3_ios", \
                 "_multibytecodec-pythonA", \
                 "_multibytecodec-pythonB", \
                 "_multibytecodec-pythonC", \
                 "_multibytecodec-pythonD", \
                 "_multibytecodec-pythonE", \
                 "_multiprocessing-python3_ios", \
                 "_multiprocessing-pythonA", \
                 "_multiprocessing-pythonB", \
                 "_multiprocessing-pythonC", \
                 "_multiprocessing-pythonD", \
                 "_multiprocessing-pythonE", \
                 "_opcode-python3_ios", \
                 "_opcode-pythonA", \
                 "_opcode-pythonB", \
                 "_opcode-pythonC", \
                 "_opcode-pythonD", \
                 "_opcode-pythonE", \
                 "_pickle-python3_ios", \
                 "_pickle-pythonA", \
                 "_pickle-pythonB", \
                 "_pickle-pythonC", \
                 "_pickle-pythonD", \
                 "_pickle-pythonE", \
                 "_posixshmem-python3_ios", \
                 "_posixshmem-pythonA", \
                 "_posixshmem-pythonB", \
                 "_posixshmem-pythonC", \
                 "_posixshmem-pythonD", \
                 "_posixshmem-pythonE", \
                 "_posixsubprocess-python3_ios", \
                 "_posixsubprocess-pythonA", \
                 "_posixsubprocess-pythonB", \
                 "_posixsubprocess-pythonC", \
                 "_posixsubprocess-pythonD", \
                 "_posixsubprocess-pythonE", \
                 "_queue-python3_ios", \
                 "_queue-pythonA", \
                 "_queue-pythonB", \
                 "_queue-pythonC", \
                 "_queue-pythonD", \
                 "_queue-pythonE", \
                 "_random-python3_ios", \
                 "_random-pythonA", \
                 "_random-pythonB", \
                 "_random-pythonC", \
                 "_random-pythonD", \
                 "_random-pythonE", \
                 "_sha1-python3_ios", \
                 "_sha1-pythonA", \
                 "_sha1-pythonB", \
                 "_sha1-pythonC", \
                 "_sha1-pythonD", \
                 "_sha1-pythonE", \
                 "_sha256-python3_ios", \
                 "_sha256-pythonA", \
                 "_sha256-pythonB", \
                 "_sha256-pythonC", \
                 "_sha256-pythonD", \
                 "_sha256-pythonE", \
                 "_sha3-python3_ios", \
                 "_sha3-pythonA", \
                 "_sha3-pythonB", \
                 "_sha3-pythonC", \
                 "_sha3-pythonD", \
                 "_sha3-pythonE", \
                 "_sha512-python3_ios", \
                 "_sha512-pythonA", \
                 "_sha512-pythonB", \
                 "_sha512-pythonC", \
                 "_sha512-pythonD", \
                 "_sha512-pythonE", \
                 "_socket-python3_ios", \
                 "_socket-pythonA", \
                 "_socket-pythonB", \
                 "_socket-pythonC", \
                 "_socket-pythonD", \
                 "_socket-pythonE", \
                 "_sqlite3-python3_ios", \
                 "_sqlite3-pythonA", \
                 "_sqlite3-pythonB", \
                 "_sqlite3-pythonC", \
                 "_sqlite3-pythonD", \
                 "_sqlite3-pythonE", \
                 "_ssl-python3_ios", \
                 "_ssl-pythonA", \
                 "_ssl-pythonB", \
                 "_ssl-pythonC", \
                 "_ssl-pythonD", \
                 "_ssl-pythonE", \
                 "_statistics-python3_ios", \
                 "_statistics-pythonA", \
                 "_statistics-pythonB", \
                 "_statistics-pythonC", \
                 "_statistics-pythonD", \
                 "_statistics-pythonE", \
                 "_struct-python3_ios", \
                 "_struct-pythonA", \
                 "_struct-pythonB", \
                 "_struct-pythonC", \
                 "_struct-pythonD", \
                 "_struct-pythonE", \
                 "_testbuffer-python3_ios", \
                 "_testbuffer-pythonA", \
                 "_testbuffer-pythonB", \
                 "_testbuffer-pythonC", \
                 "_testbuffer-pythonD", \
                 "_testbuffer-pythonE", \
                 "_testcapi-python3_ios", \
                 "_testcapi-pythonA", \
                 "_testcapi-pythonB", \
                 "_testcapi-pythonC", \
                 "_testcapi-pythonD", \
                 "_testcapi-pythonE", \
                 "_testimportmultiple-python3_ios", \
                 "_testimportmultiple-pythonA", \
                 "_testimportmultiple-pythonB", \
                 "_testimportmultiple-pythonC", \
                 "_testimportmultiple-pythonD", \
                 "_testimportmultiple-pythonE", \
                 "_testinternalcapi-python3_ios", \
                 "_testinternalcapi-pythonA", \
                 "_testinternalcapi-pythonB", \
                 "_testinternalcapi-pythonC", \
                 "_testinternalcapi-pythonD", \
                 "_testinternalcapi-pythonE", \
                 "_testmultiphase-python3_ios", \
                 "_testmultiphase-pythonA", \
                 "_testmultiphase-pythonB", \
                 "_testmultiphase-pythonC", \
                 "_testmultiphase-pythonD", \
                 "_testmultiphase-pythonE", \
                 "_xxsubinterpreters-python3_ios", \
                 "_xxsubinterpreters-pythonA", \
                 "_xxsubinterpreters-pythonB", \
                 "_xxsubinterpreters-pythonC", \
                 "_xxsubinterpreters-pythonD", \
                 "_xxsubinterpreters-pythonE", \
                 "_xxtestfuzz-python3_ios", \
                 "_xxtestfuzz-pythonA", \
                 "_xxtestfuzz-pythonB", \
                 "_xxtestfuzz-pythonC", \
                 "_xxtestfuzz-pythonD", \
                 "_xxtestfuzz-pythonE", \
                 "_zoneinfo-python3_ios", \
                 "_zoneinfo-pythonA", \
                 "_zoneinfo-pythonB", \
                 "_zoneinfo-pythonC", \
                 "_zoneinfo-pythonD", \
                 "_zoneinfo-pythonE", \
                 "array-python3_ios", \
                 "array-pythonA", \
                 "array-pythonB", \
                 "array-pythonC", \
                 "array-pythonD", \
                 "array-pythonE", \
                 "audioop-python3_ios", \
                 "audioop-pythonA", \
                 "audioop-pythonB", \
                 "audioop-pythonC", \
                 "audioop-pythonD", \
                 "audioop-pythonE", \
                 "binascii-python3_ios", \
                 "binascii-pythonA", \
                 "binascii-pythonB", \
                 "binascii-pythonC", \
                 "binascii-pythonD", \
                 "binascii-pythonE", \
                 "cmath-python3_ios", \
                 "cmath-pythonA", \
                 "cmath-pythonB", \
                 "cmath-pythonC", \
                 "cmath-pythonD", \
                 "cmath-pythonE", \
                 "fcntl-python3_ios", \
                 "fcntl-pythonA", \
                 "fcntl-pythonB", \
                 "fcntl-pythonC", \
                 "fcntl-pythonD", \
                 "fcntl-pythonE", \
                 "grp-python3_ios", \
                 "grp-pythonA", \
                 "grp-pythonB", \
                 "grp-pythonC", \
                 "grp-pythonD", \
                 "grp-pythonE", \
                 "math-python3_ios", \
                 "math-pythonA", \
                 "math-pythonB", \
                 "math-pythonC", \
                 "math-pythonD", \
                 "math-pythonE", \
                 "mmap-python3_ios", \
                 "mmap-pythonA", \
                 "mmap-pythonB", \
                 "mmap-pythonC", \
                 "mmap-pythonD", \
                 "mmap-pythonE", \
                 "parser-python3_ios", \
                 "parser-pythonA", \
                 "parser-pythonB", \
                 "parser-pythonC", \
                 "parser-pythonD", \
                 "parser-pythonE", \
                 "pyexpat-python3_ios", \
                 "pyexpat-pythonA", \
                 "pyexpat-pythonB", \
                 "pyexpat-pythonC", \
                 "pyexpat-pythonD", \
                 "pyexpat-pythonE", \
                 "resource-python3_ios", \
                 "resource-pythonA", \
                 "resource-pythonB", \
                 "resource-pythonC", \
                 "resource-pythonD", \
                 "resource-pythonE", \
                 "select-python3_ios", \
                 "select-pythonA", \
                 "select-pythonB", \
                 "select-pythonC", \
                 "select-pythonD", \
                 "select-pythonE", \
                 "syslog-python3_ios", \
                 "syslog-pythonA", \
                 "syslog-pythonB", \
                 "syslog-pythonC", \
                 "syslog-pythonD", \
                 "syslog-pythonE", \
                 "termios-python3_ios", \
                 "termios-pythonA", \
                 "termios-pythonB", \
                 "termios-pythonC", \
                 "termios-pythonD", \
                 "termios-pythonE", \
                 "unicodedata-python3_ios", \
                 "unicodedata-pythonA", \
                 "unicodedata-pythonB", \
                 "unicodedata-pythonC", \
                 "unicodedata-pythonD", \
                 "unicodedata-pythonE", \
                 "xxlimited-python3_ios", \
                 "xxlimited-pythonA", \
                 "xxlimited-pythonB", \
                 "xxlimited-pythonC", \
                 "xxlimited-pythonD", \
                 "xxlimited-pythonE", \
                 "zlib-python3_ios", \
                 "zlib-pythonA", \
                 "zlib-pythonB", \
                 "zlib-pythonC", \
                 "zlib-pythonD", \
                 "zlib-pythonE"])
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

