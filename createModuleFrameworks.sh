#! /bin/sh

#  name /Users/holzschu/src/Xcode_iPad/cpython/install/lib/libpython3.9.dylib (offset 24)
#  name @rpath/ios_system.framework/ios_system (offset 24)
#  name /usr/lib/libSystem.B.dylib (offset 24)
#  name /System/Library/Frameworks/CoreFoundation.framework/CoreFoundation (offset 24)
libpython=$PWD/Library/lib/libpython3.9.dylib

# exit 0

for name in _asyncio _bisect _blake2 _bz2 _codecs_cn _codecs_hk _codecs_iso2022 _codecs_jp _codecs_kr _codecs_tw _contextvars _crypt _csv _ctypes _ctypes_test _datetime _dbm _decimal _elementtree _hashlib _heapq _json _lsprof _md5 _multibytecodec _multiprocessing _opcode _pickle _posixshmem _posixsubprocess _queue _random _sha1 _sha256 _sha3 _sha512 _socket _sqlite3 _ssl _statistics _struct _testbuffer _testcapi _testimportmultiple _testinternalcapi _testmultiphase _xxsubinterpreters _xxtestfuzz _zoneinfo array audioop binascii cmath fcntl grp math mmap parser pyexpat resource select syslog termios unicodedata xxlimited zlib _cffi_backend _cffi_ext
do 
	for package in python3_ios pythonA pythonB pythonC pythonD pythonE
	do
		framework=${package}-${name}
		for architecture in lib.macosx-10.15-x86_64-3.9 lib.darwin-arm64-3.9 lib.darwin-x86_64-3.9
		do
			echo "Creating: " ${architecture}/Frameworks/${name}.framework
			directory=build/${architecture}/Frameworks/
			rm -rf $directory/$framework.framework
			mkdir -p $directory
			mkdir -p $directory/$framework.framework
			libraryFile=build/${architecture}/${name}.cpython-39-darwin.so
			cp $libraryFile $directory/$framework.framework/$framework
			cp plists/basic_Info.plist $directory/$framework.framework/Info.plist
			plutil -replace CFBundleExecutable -string $framework $directory/$framework.framework/Info.plist
			plutil -replace CFBundleName -string $framework $directory/$framework.framework/Info.plist
			# underscore is not allowed in CFBundleIdentifier:
			signature=${framework//_/-}
			plutil -replace CFBundleIdentifier -string Nicolas-Holzschuch.$signature  $directory/$framework.framework/Info.plist
			# change framework id and libpython:
			install_name_tool -change $libpython @rpath/${package}.framework/${package}  $directory/$framework.framework/$framework
			install_name_tool -id @rpath/$framework.framework/$framework  $directory/$framework.framework/$framework
			
		done
		# Edit the Info.plist file:
		plutil -replace DTPlatformName -string "iphoneos" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTPlatformName -string "iphonesimulator" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTPlatformName -string "macosx" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace DTSDKName -string "iphoneos" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTSDKName -string "iphonesimulator" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTSDKName -string "macosx" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace DTPlatformVersion -string "14.0" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTPlatformVersion -string "14.0" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTPlatformVersion -string "10.15" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace MinimumOSVersion -string "14.0" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace MinimumOSVersion -string "14.0" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace MinimumOSVersion -string "10.15" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace CFBundleSupportedPlatforms.0 -string "iPhoneSimulator" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -remove CFBundleSupportedPlatforms.1 build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace CFBundleSupportedPlatforms.0 -string "MacOSX" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -remove CFBundleSupportedPlatforms.1 build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		# Create the 3-architecture XCFramework:
		rm -rf XcFrameworks/$framework.xcframework
		xcodebuild -create-xcframework -framework build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework -framework build/lib.darwin-arm64-3.9/Frameworks/$framework.framework -framework build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework  -output  XcFrameworks/$framework.xcframework
	done
done

# argon2/_ffi

for library in argon2/_ffi 
do
	level1=`/usr/bin/dirname $library`
	level2=`/usr/bin/basename $library`
	# Test with "." first, if it fails use "-" (not "_')
	name=$level1.$level2
	for package in python3_ios pythonA pythonB pythonC pythonD pythonE
	do
		framework=${package}-${name}
		for architecture in lib.macosx-10.15-x86_64-3.9 lib.darwin-arm64-3.9 lib.darwin-x86_64-3.9
		do
			echo "Creating: " ${architecture}/Frameworks/${name}.framework
			directory=build/${architecture}/Frameworks/
			rm -rf $directory/$framework.framework
			mkdir -p $directory
			mkdir -p $directory/$framework.framework
			libraryFile=build/${architecture}/${name}.abi3.so
			cp $libraryFile $directory/$framework.framework/$framework
			cp plists/basic_Info.plist $directory/$framework.framework/Info.plist
			plutil -replace CFBundleExecutable -string $framework $directory/$framework.framework/Info.plist
			plutil -replace CFBundleName -string $framework $directory/$framework.framework/Info.plist
			# underscore is not allowed in CFBundleIdentifier:
			signature=${framework//_/-}
			plutil -replace CFBundleIdentifier -string Nicolas-Holzschuch.$signature  $directory/$framework.framework/Info.plist
			# change framework id and libpython:
			install_name_tool -change $libpython @rpath/${package}.framework/${package}  $directory/$framework.framework/$framework
			install_name_tool -id @rpath/$framework.framework/$framework  $directory/$framework.framework/$framework
			
		done
		# Edit the Info.plist file:
		plutil -replace DTPlatformName -string "iphoneos" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTPlatformName -string "iphonesimulator" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTPlatformName -string "macosx" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace DTSDKName -string "iphoneos" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTSDKName -string "iphonesimulator" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTSDKName -string "macosx" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace DTPlatformVersion -string "14.0" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTPlatformVersion -string "14.0" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTPlatformVersion -string "10.15" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace MinimumOSVersion -string "14.0" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace MinimumOSVersion -string "14.0" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace MinimumOSVersion -string "10.15" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace CFBundleSupportedPlatforms.0 -string "iPhoneSimulator" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -remove CFBundleSupportedPlatforms.1 build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace CFBundleSupportedPlatforms.0 -string "MacOSX" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -remove CFBundleSupportedPlatforms.1 build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		# Create the 3-architecture XCFramework:
		rm -rf XcFrameworks/$framework.xcframework
		xcodebuild -create-xcframework -framework build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework -framework build/lib.darwin-arm64-3.9/Frameworks/$framework.framework -framework build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework  -output  XcFrameworks/$framework.xcframework
	done
done

# numpy
for library in core/_operand_flag_tests core/_multiarray_umath linalg/lapack_lite linalg/_umath_linalg fft/_pocketfft_internal random/bit_generator random/mtrand random/_generator random/_pcg64 random/_sfc64 random/_mt19937 random/_philox random/_bounded_integers random/_common 
do
	level1=`/usr/bin/dirname $library`
	level2=`/usr/bin/basename $library`
	name=numpy.$level1.$level2
	for package in python3_ios pythonA pythonB pythonC pythonD pythonE
	do
		framework=${package}-${name}
		for architecture in lib.macosx-10.15-x86_64-3.9 lib.darwin-arm64-3.9 lib.darwin-x86_64-3.9
		do
			echo "Creating: " ${architecture}/Frameworks/${name}.framework
			directory=build/${architecture}/Frameworks/
			rm -rf $directory/$framework.framework
			mkdir -p $directory
			mkdir -p $directory/$framework.framework
			libraryFile=build/${architecture}/numpy/${library}.cpython-39-darwin.so
			cp $libraryFile $directory/$framework.framework/$framework
			cp plists/basic_Info.plist $directory/$framework.framework/Info.plist
			plutil -replace CFBundleExecutable -string $framework $directory/$framework.framework/Info.plist
			plutil -replace CFBundleName -string $framework $directory/$framework.framework/Info.plist
			# underscore is not allowed in CFBundleIdentifier:
			signature=${framework//_/-}
			plutil -replace CFBundleIdentifier -string Nicolas-Holzschuch.$signature  $directory/$framework.framework/Info.plist
			# change framework id and libpython:
			install_name_tool -change $libpython @rpath/${package}.framework/${package}  $directory/$framework.framework/$framework
			install_name_tool -id @rpath/$framework.framework/$framework  $directory/$framework.framework/$framework
			
		done
		# Edit the Info.plist file:
		plutil -replace DTPlatformName -string "iphoneos" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTPlatformName -string "iphonesimulator" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTPlatformName -string "macosx" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace DTSDKName -string "iphoneos" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTSDKName -string "iphonesimulator" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTSDKName -string "macosx" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace DTPlatformVersion -string "14.0" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTPlatformVersion -string "14.0" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace DTPlatformVersion -string "10.15" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace MinimumOSVersion -string "14.0" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace MinimumOSVersion -string "14.0" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -replace MinimumOSVersion -string "10.15" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace CFBundleSupportedPlatforms.0 -string "iPhoneSimulator" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -remove CFBundleSupportedPlatforms.1 build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist

		plutil -replace CFBundleSupportedPlatforms.0 -string "MacOSX" build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		plutil -remove CFBundleSupportedPlatforms.1 build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework/Info.plist
		# Create the 3-architecture XCFramework:
		rm -rf XcFrameworks/$framework.xcframework
		xcodebuild -create-xcframework -framework build/lib.macosx-10.15-x86_64-3.9/Frameworks/$framework.framework -framework build/lib.darwin-arm64-3.9/Frameworks/$framework.framework -framework build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework  -output  XcFrameworks/$framework.xcframework
	done
done

# Compress everything in .zip: 

for package in python3_ios pythonA pythonB pythonC pythonD pythonE
do
	for name in _asyncio _bisect _blake2 _bz2 _codecs_cn _codecs_hk _codecs_iso2022 _codecs_jp _codecs_kr _codecs_tw _contextvars _crypt _csv _ctypes _ctypes_test _datetime _dbm _decimal _elementtree _hashlib _heapq _json _lsprof _md5 _multibytecodec _multiprocessing _opcode _pickle _posixshmem _posixsubprocess _queue _random _sha1 _sha256 _sha3 _sha512 _socket _sqlite3 _ssl _statistics _struct _testbuffer _testcapi _testimportmultiple _testinternalcapi _testmultiphase _xxsubinterpreters _xxtestfuzz _zoneinfo array audioop binascii cmath fcntl grp math mmap parser pyexpat resource select syslog termios unicodedata xxlimited zlib _cffi_backend _cffi_ext argon2._ffi numpy.core._multiarray_umath numpy.random._bounded_integers numpy.random._philox numpy.core._operand_flag_tests numpy.random._common numpy.random._sfc64 numpy.fft._pocketfft_internal numpy.random._generator numpy.random.bit_generator numpy.linalg._umath_linalg numpy.random._mt19937 numpy.random.mtrand numpy.linalg.lapack_lite numpy.random._pcg64
	do 
		framework=${package}-${name}
		echo $framework
		rm -f XcFrameworks/$framework.xcframework.zip
		zip -rq XcFrameworks/$framework.xcframework.zip XcFrameworks/$framework.xcframework
	done
done


