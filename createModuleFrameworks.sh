#! /bin/sh

#  name /Users/holzschu/src/Xcode_iPad/cpython/install/lib/libpython3.9.dylib (offset 24)
#  name @rpath/ios_system.framework/ios_system (offset 24)
#  name /usr/lib/libSystem.B.dylib (offset 24)
#  name /System/Library/Frameworks/CoreFoundation.framework/CoreFoundation (offset 24)
libpython=$PWD/Library/lib/libpython3.9.dylib
APP=$(basename `dirname $PWD`)

OSX_VERSION=`sw_vers -productVersion |awk -F. '{print $1"."$2}'`

edit_Info_plist() 
{
   framework=$1
	# Edit the Info.plist file:
	plutil -replace DTPlatformName -string "iphoneos" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
	plutil -replace DTPlatformName -string "iphonesimulator" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
	plutil -replace DTPlatformName -string "macosx" build/lib.macosx-${OSX_VERSION}-x86_64-3.9/Frameworks/$framework.framework/Info.plist

	plutil -replace DTSDKName -string "iphoneos" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
	plutil -replace DTSDKName -string "iphonesimulator" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
	plutil -replace DTSDKName -string "macosx" build/lib.macosx-${OSX_VERSION}-x86_64-3.9/Frameworks/$framework.framework/Info.plist

	plutil -replace DTPlatformVersion -string "14.0" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
	plutil -replace DTPlatformVersion -string "14.0" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
	plutil -replace DTPlatformVersion -string "${OSX_VERSION}" build/lib.macosx-${OSX_VERSION}-x86_64-3.9/Frameworks/$framework.framework/Info.plist

	plutil -replace MinimumOSVersion -string "14.0" build/lib.darwin-arm64-3.9/Frameworks/$framework.framework/Info.plist
	plutil -replace MinimumOSVersion -string "14.0" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
	plutil -replace MinimumOSVersion -string "${OSX_VERSION}" build/lib.macosx-${OSX_VERSION}-x86_64-3.9/Frameworks/$framework.framework/Info.plist

	plutil -replace CFBundleSupportedPlatforms.0 -string "iPhoneSimulator" build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist
	plutil -remove CFBundleSupportedPlatforms.1 build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework/Info.plist

	plutil -replace CFBundleSupportedPlatforms.0 -string "MacOSX" build/lib.macosx-${OSX_VERSION}-x86_64-3.9/Frameworks/$framework.framework/Info.plist
	plutil -remove CFBundleSupportedPlatforms.1 build/lib.macosx-${OSX_VERSION}-x86_64-3.9/Frameworks/$framework.framework/Info.plist

}

# 1-level libraries:
# lzma functions are forbidden on the AppStore. 
# You can build the lzma modyle by adding the lzma headers in the Include path and adding _lzma to this list,
# but you can't submit to the AppStore.
for name in _asyncio _bisect _blake2 _bz2 _codecs_cn _codecs_hk _codecs_iso2022 _codecs_jp _codecs_kr _codecs_tw _contextvars _crypt _csv _ctypes _ctypes_test _datetime _dbm _decimal _elementtree _hashlib _heapq _json _lsprof _md5 _multibytecodec _multiprocessing _opcode _pickle _posixshmem _posixsubprocess _queue _random _sha1 _sha256 _sha3 _sha512 _socket _sqlite3 _ssl _statistics _struct _testbuffer _testcapi _testimportmultiple _testinternalcapi _testmultiphase _xxsubinterpreters _xxtestfuzz _zoneinfo array audioop binascii cmath fcntl grp math mmap parser pyexpat resource select syslog termios unicodedata xxlimited zlib _cffi_backend _cffi_ext kiwisolver 
do 
	for package in python3_ios pythonA pythonB pythonC pythonD pythonE
	do
		framework=${package}-${name}
		for architecture in lib.macosx-${OSX_VERSION}-x86_64-3.9 lib.darwin-arm64-3.9 lib.darwin-x86_64-3.9
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
		edit_Info_plist $framework
		# Create the 3-architecture XCFramework:
		rm -rf XcFrameworks/$framework.xcframework
		xcodebuild -create-xcframework -framework build/lib.macosx-${OSX_VERSION}-x86_64-3.9/Frameworks/$framework.framework -framework build/lib.darwin-arm64-3.9/Frameworks/$framework.framework -framework build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework  -output  XcFrameworks/$framework.xcframework
	done
done



# argon2/_ffi, cryptography/hazmat/bindings/_padding, cryptography//hazmat/bindings/_openssl. Separate because suffix is .abi3.so

for library in argon2/_ffi cryptography/hazmat/bindings/_padding cryptography/hazmat/bindings/_openssl
do
	# replace all "/" with "."
	name=${library//\//.}
	for package in python3_ios pythonA pythonB pythonC pythonD pythonE
	do
		framework=${package}-${name}
		for architecture in lib.macosx-${OSX_VERSION}-x86_64-3.9 lib.darwin-arm64-3.9 lib.darwin-x86_64-3.9
		do
			echo "Creating: " ${architecture}/Frameworks/${name}.framework
			directory=build/${architecture}/Frameworks/
			rm -rf $directory/$framework.framework
			mkdir -p $directory
			mkdir -p $directory/$framework.framework
			libraryFile=build/${architecture}/${library}.abi3.so
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
		edit_Info_plist $framework
		# Create the 3-architecture XCFramework:
		rm -rf XcFrameworks/$framework.xcframework
		xcodebuild -create-xcframework -framework build/lib.macosx-${OSX_VERSION}-x86_64-3.9/Frameworks/$framework.framework -framework build/lib.darwin-arm64-3.9/Frameworks/$framework.framework -framework build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework  -output  XcFrameworks/$framework.xcframework
	done
done

# Pillow, matplotlib, lxml, numpy, pandas, astropy (more than 2 levels of hierarchy, suffix is .cpython-39-darwin.so)
for library in PIL/_imagingmath PIL/_imagingft PIL/_imagingtk PIL/_imagingmorph PIL/_imaging matplotlib/_ttconv matplotlib/_path matplotlib/_qhull matplotlib/ft2font matplotlib/_c_internal_utils matplotlib/_tri matplotlib/_contour matplotlib/_image lxml/etree lxml/objectify lxml/sax lxml/_elementpath lxml/builder numpy/core/_operand_flag_tests numpy/core/_multiarray_umath numpy/linalg/lapack_lite numpy/linalg/_umath_linalg numpy/fft/_pocketfft_internal numpy/random/bit_generator numpy/random/mtrand numpy/random/_generator numpy/random/_pcg64 numpy/random/_sfc64 numpy/random/_mt19937 numpy/random/_philox numpy/random/_bounded_integers numpy/random/_common matplotlib/backends/_backend_agg matplotlib/backends/_tkagg lxml/html/diff lxml/html/clean 
do
	# replace all "/" with ".
	name=${library//\//.}
	for package in python3_ios pythonA pythonB pythonC pythonD pythonE
	do
		framework=${package}-${name}
		for architecture in lib.macosx-${OSX_VERSION}-x86_64-3.9 lib.darwin-arm64-3.9 lib.darwin-x86_64-3.9
		do
			echo "Creating: " ${architecture}/Frameworks/${name}.framework
			directory=build/${architecture}/Frameworks/
			rm -rf $directory/$framework.framework
			mkdir -p $directory
			mkdir -p $directory/$framework.framework
			libraryFile=build/${architecture}/${library}.cpython-39-darwin.so
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
		edit_Info_plist $framework
		# Create the 3-architecture XCFramework:
		rm -rf XcFrameworks/$framework.xcframework
		xcodebuild -create-xcframework -framework build/lib.macosx-${OSX_VERSION}-x86_64-3.9/Frameworks/$framework.framework -framework build/lib.darwin-arm64-3.9/Frameworks/$framework.framework -framework build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework  -output  XcFrameworks/$framework.xcframework
	done
done


# Compress every xcFramework in .zip: 
for package in python3_ios pythonA pythonB pythonC pythonD pythonE
do
	for name in _asyncio _bisect _blake2 _bz2 _codecs_cn _codecs_hk _codecs_iso2022 _codecs_jp _codecs_kr _codecs_tw _contextvars _crypt _csv _ctypes _ctypes_test _datetime _dbm _decimal _elementtree _hashlib _heapq _json _lsprof _md5 _multibytecodec _multiprocessing _opcode _pickle _posixshmem _posixsubprocess _queue _random _sha1 _sha256 _sha3 _sha512 _socket _sqlite3 _ssl _statistics _struct _testbuffer _testcapi _testimportmultiple _testinternalcapi _testmultiphase _xxsubinterpreters _xxtestfuzz _zoneinfo array audioop binascii cmath fcntl grp math mmap parser pyexpat resource select syslog termios unicodedata xxlimited zlib _cffi_backend _cffi_ext argon2._ffi numpy.core._multiarray_umath numpy.random._bounded_integers numpy.random._philox numpy.core._operand_flag_tests numpy.random._common numpy.random._sfc64 numpy.fft._pocketfft_internal numpy.random._generator numpy.random.bit_generator numpy.linalg._umath_linalg numpy.random._mt19937 numpy.random.mtrand numpy.linalg.lapack_lite numpy.random._pcg64 kiwisolver  PIL._imagingmath PIL._imagingft PIL._imagingtk PIL._imagingmorph PIL._imaging matplotlib.backends._backend_agg matplotlib.backends._tkagg matplotlib._ttconv matplotlib._path matplotlib._qhull matplotlib.ft2font matplotlib._c_internal_utils matplotlib._tri matplotlib._contour matplotlib._image lxml.etree lxml.objectify lxml.sax lxml.html.diff lxml.html.clean lxml._elementpath lxml.builder cryptography.hazmat.bindings._padding cryptography.hazmat.bindings._openssl 
	do 
		framework=${package}-${name}
		echo $framework
		rm -f XcFrameworks/$framework.xcframework.zip
		zip -rq XcFrameworks/$framework.xcframework.zip XcFrameworks/$framework.xcframework
	done
done

# for Carnets specifically (or all apps with Jupyter notebooks):
if [ $APP == "Carnets" ]; 
then
# pandas, astropy: only with Carnets
for library in pandas/io/sas/_sas pandas/_libs/index pandas/_libs/join pandas/_libs/parsers pandas/_libs/reduction pandas/_libs/tslib pandas/_libs/sparse pandas/_libs/properties pandas/_libs/internals pandas/_libs/reshape pandas/_libs/ops pandas/_libs/indexing pandas/_libs/hashing pandas/_libs/lib pandas/_libs/hashtable pandas/_libs/algos pandas/_libs/json pandas/_libs/window/indexers pandas/_libs/window/aggregations pandas/_libs/writers pandas/_libs/ops_dispatch pandas/_libs/groupby pandas/_libs/interval pandas/_libs/tslibs/dtypes pandas/_libs/tslibs/period pandas/_libs/tslibs/conversion pandas/_libs/tslibs/ccalendar pandas/_libs/tslibs/timedeltas pandas/_libs/tslibs/strptime pandas/_libs/tslibs/vectorized pandas/_libs/tslibs/nattype pandas/_libs/tslibs/base pandas/_libs/tslibs/timezones pandas/_libs/tslibs/timestamps pandas/_libs/tslibs/offsets pandas/_libs/tslibs/fields pandas/_libs/tslibs/np_datetime pandas/_libs/tslibs/parsing pandas/_libs/tslibs/tzconversion pandas/_libs/testing pandas/_libs/missing astropy/compiler_version astropy/timeseries/periodograms/bls/_impl astropy/timeseries/periodograms/lombscargle/implementations/cython_impl astropy/wcs/_wcs astropy/time/_parse_times astropy/io/ascii/cparser astropy/io/fits/compression astropy/io/fits/_utils astropy/io/votable/tablewriter astropy/utils/_compiler astropy/utils/xml/_iterparser astropy/modeling/_projections astropy/table/_np_utils astropy/table/_column_mixins astropy/cosmology/scalar_inv_efuncs astropy/convolution/_convolve astropy/stats/_stats
do
	# replace all "/" with ".
	name=${library//\//.}
	for package in python3_ios pythonA pythonB pythonC pythonD pythonE
	do
		framework=${package}-${name}
		for architecture in lib.macosx-${OSX_VERSION}-x86_64-3.9 lib.darwin-arm64-3.9 lib.darwin-x86_64-3.9
		do
			echo "Creating: " ${architecture}/Frameworks/${name}.framework
			directory=build/${architecture}/Frameworks/
			rm -rf $directory/$framework.framework
			mkdir -p $directory
			mkdir -p $directory/$framework.framework
			libraryFile=build/${architecture}/${library}.cpython-39-darwin.so
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
		edit_Info_plist $framework
		# Create the 3-architecture XCFramework:
		rm -rf XcFrameworks/$framework.xcframework
		xcodebuild -create-xcframework -framework build/lib.macosx-${OSX_VERSION}-x86_64-3.9/Frameworks/$framework.framework -framework build/lib.darwin-arm64-3.9/Frameworks/$framework.framework -framework build/lib.darwin-x86_64-3.9/Frameworks/$framework.framework  -output  XcFrameworks/$framework.xcframework
	done
done

# Compress every xcFramework in .zip: 

for package in python3_ios pythonA pythonB pythonC pythonD pythonE
do
	for name in  pandas.io.sas._sas pandas._libs.index pandas._libs.join pandas._libs.parsers pandas._libs.reduction pandas._libs.tslib pandas._libs.sparse pandas._libs.properties pandas._libs.internals pandas._libs.reshape pandas._libs.ops pandas._libs.indexing pandas._libs.hashing pandas._libs.lib pandas._libs.hashtable pandas._libs.algos pandas._libs.json pandas._libs.window.indexers pandas._libs.window.aggregations pandas._libs.writers pandas._libs.ops_dispatch pandas._libs.groupby pandas._libs.interval pandas._libs.tslibs.dtypes pandas._libs.tslibs.period pandas._libs.tslibs.conversion pandas._libs.tslibs.ccalendar pandas._libs.tslibs.timedeltas pandas._libs.tslibs.strptime pandas._libs.tslibs.vectorized pandas._libs.tslibs.nattype pandas._libs.tslibs.base pandas._libs.tslibs.timezones pandas._libs.tslibs.timestamps pandas._libs.tslibs.offsets pandas._libs.tslibs.fields pandas._libs.tslibs.np_datetime pandas._libs.tslibs.parsing pandas._libs.tslibs.tzconversion pandas._libs.testing pandas._libs.missing astropy.compiler_version astropy.timeseries.periodograms.bls._impl astropy.timeseries.periodograms.lombscargle.implementations.cython_impl astropy.wcs._wcs astropy.time._parse_times astropy.io.ascii.cparser astropy.io.fits.compression astropy.io.fits._utils astropy.io.votable.tablewriter astropy.utils._compiler astropy.utils.xml._iterparser astropy.modeling._projections astropy.table._np_utils astropy.table._column_mixins astropy.cosmology.scalar_inv_efuncs astropy.convolution._convolve astropy.stats._stats
	do 
		framework=${package}-${name}
		echo $framework
		rm -f XcFrameworks/$framework.xcframework.zip
		zip -rq XcFrameworks/$framework.xcframework.zip XcFrameworks/$framework.xcframework
	done
done
fi
