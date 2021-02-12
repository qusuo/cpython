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
for name in _asyncio _bisect _blake2 _bz2 _codecs_cn _codecs_hk _codecs_iso2022 _codecs_jp _codecs_kr _codecs_tw _contextvars _crypt _csv _ctypes _ctypes_test _datetime _dbm _decimal _elementtree _hashlib _heapq _json _lsprof _md5 _multibytecodec _multiprocessing _opcode _pickle _posixshmem _posixsubprocess _queue _random _sha1 _sha256 _sha3 _sha512 _socket _sqlite3 _ssl _statistics _struct _testbuffer _testcapi _testimportmultiple _testinternalcapi _testmultiphase _xxsubinterpreters _xxtestfuzz _zoneinfo array audioop binascii cmath fcntl grp math mmap parser pyexpat resource select syslog termios unicodedata xxlimited zlib _cffi_backend kiwisolver 
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



# argon2/_ffi, cryptography/hazmat/bindings/_padding, cryptography//hazmat/bindings/_openssl and cryptography/hazmat/bindings/_rust. 
# Separate because suffix is .abi3.so
# removed until we can cross-compile: cryptography/hazmat/bindings/_rust 
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
# except for zmq/backend/cffi/_cffi where it's .abi3.so for MacOSX and .cpython-39-darwin.so for iOS & Simulator
for library in zmq/backend/cffi/_cffi PIL/_imagingmath PIL/_imagingft PIL/_imagingtk PIL/_imagingmorph PIL/_imaging matplotlib/_ttconv matplotlib/_path matplotlib/_qhull matplotlib/ft2font matplotlib/_c_internal_utils matplotlib/_tri matplotlib/_contour matplotlib/_image lxml/etree lxml/objectify lxml/sax lxml/_elementpath lxml/builder numpy/core/_operand_flag_tests numpy/core/_multiarray_umath numpy/linalg/lapack_lite numpy/linalg/_umath_linalg numpy/fft/_pocketfft_internal numpy/random/bit_generator numpy/random/mtrand numpy/random/_generator numpy/random/_pcg64 numpy/random/_sfc64 numpy/random/_mt19937 numpy/random/_philox numpy/random/_bounded_integers numpy/random/_common matplotlib/backends/_backend_agg matplotlib/backends/_tkagg lxml/html/diff lxml/html/clean 
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
			libraryFile=build/${architecture}/${library}
			cp $libraryFile.*.so $directory/$framework.framework/$framework
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
# cryptography.hazmat.bindings._rust
for package in python3_ios pythonA pythonB pythonC pythonD pythonE
do
	for name in _asyncio _bisect _blake2 _bz2 _codecs_cn _codecs_hk _codecs_iso2022 _codecs_jp _codecs_kr _codecs_tw _contextvars _crypt _csv _ctypes _ctypes_test _datetime _dbm _decimal _elementtree _hashlib _heapq _json _lsprof _md5 _multibytecodec _multiprocessing _opcode _pickle _posixshmem _posixsubprocess _queue _random _sha1 _sha256 _sha3 _sha512 _socket _sqlite3 _ssl _statistics _struct _testbuffer _testcapi _testimportmultiple _testinternalcapi _testmultiphase _xxsubinterpreters _xxtestfuzz _zoneinfo array audioop binascii cmath fcntl grp math mmap parser pyexpat resource select syslog termios unicodedata xxlimited zlib _cffi_backend zmq.backend.cffi._cffi argon2._ffi numpy.core._multiarray_umath numpy.random._bounded_integers numpy.random._philox numpy.core._operand_flag_tests numpy.random._common numpy.random._sfc64 numpy.fft._pocketfft_internal numpy.random._generator numpy.random.bit_generator numpy.linalg._umath_linalg numpy.random._mt19937 numpy.random.mtrand numpy.linalg.lapack_lite numpy.random._pcg64 kiwisolver  PIL._imagingmath PIL._imagingft PIL._imagingtk PIL._imagingmorph PIL._imaging matplotlib.backends._backend_agg matplotlib.backends._tkagg matplotlib._ttconv matplotlib._path matplotlib._qhull matplotlib.ft2font matplotlib._c_internal_utils matplotlib._tri matplotlib._contour matplotlib._image lxml.etree lxml.objectify lxml.sax lxml.html.diff lxml.html.clean lxml._elementpath lxml.builder cryptography.hazmat.bindings._padding cryptography.hazmat.bindings._openssl 
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
for library in pandas/io/sas/_sas pandas/_libs/index pandas/_libs/join pandas/_libs/parsers pandas/_libs/reduction pandas/_libs/tslib pandas/_libs/sparse pandas/_libs/properties pandas/_libs/internals pandas/_libs/reshape pandas/_libs/ops pandas/_libs/indexing pandas/_libs/hashing pandas/_libs/lib pandas/_libs/hashtable pandas/_libs/algos pandas/_libs/json pandas/_libs/window/indexers pandas/_libs/window/aggregations pandas/_libs/writers pandas/_libs/ops_dispatch pandas/_libs/groupby pandas/_libs/interval pandas/_libs/tslibs/dtypes pandas/_libs/tslibs/period pandas/_libs/tslibs/conversion pandas/_libs/tslibs/ccalendar pandas/_libs/tslibs/timedeltas pandas/_libs/tslibs/strptime pandas/_libs/tslibs/vectorized pandas/_libs/tslibs/nattype pandas/_libs/tslibs/base pandas/_libs/tslibs/timezones pandas/_libs/tslibs/timestamps pandas/_libs/tslibs/offsets pandas/_libs/tslibs/fields pandas/_libs/tslibs/np_datetime pandas/_libs/tslibs/parsing pandas/_libs/tslibs/tzconversion pandas/_libs/testing pandas/_libs/missing astropy/compiler_version astropy/timeseries/periodograms/bls/_impl astropy/timeseries/periodograms/lombscargle/implementations/cython_impl astropy/wcs/_wcs astropy/time/_parse_times astropy/io/ascii/cparser astropy/io/fits/compression astropy/io/fits/_utils astropy/io/votable/tablewriter astropy/utils/_compiler astropy/utils/xml/_iterparser astropy/modeling/_projections astropy/table/_np_utils astropy/table/_column_mixins astropy/cosmology/scalar_inv_efuncs astropy/convolution/_convolve astropy/stats/_stats erfa/ufunc
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

# Create the gfortran framework, change the reference to libgfortran in the openblas framework:
cp -r Python-aux/openblas.xcframework XcFrameworks/
install_name_tool -change /usr/local/aarch64-apple-darwin20/lib/libgfortran.5.dylib @rpath/libgfortran.framework/libgfortran XcFrameworks/openblas.xcframework/ios-arm64/openblas.framework/openblas

directory=build/lib.darwin-arm64-3.9/Frameworks
for library in libgfortran
do
	framework="${library%.*}"
	echo $framework
	mkdir -p  $directory/$framework.framework
	libraryFile=Frameworks_iphoneos/lib/$library.dylib
	cp $libraryFile $directory/$framework.framework/$framework
	cp plists/basic_Info.plist $directory/$framework.framework/Info.plist
	plutil -replace CFBundleExecutable -string $framework $directory/$framework.framework/Info.plist
	plutil -replace CFBundleName -string $framework $directory/$framework.framework/Info.plist
	# underscore is not allowed in CFBundleIdentifier:
	signature=${framework//_/-}
	plutil -replace CFBundleIdentifier -string Nicolas-Holzschuch.$signature  $directory/$framework.framework/Info.plist
	# change framework id: 
	install_name_tool -id @rpath/$framework.framework/$framework  $directory/$framework.framework/$framework
	install_name_tool -change /usr/local/aarch64-apple-darwin20/lib/libgcc_s.2.dylib @rpath/libgcc_s.framework/libgcc_s $directory/$framework.framework/$framework
	plutil -replace DTPlatformName -string "iphoneos" $directory/$framework.framework/Info.plist
	plutil -replace DTSDKName -string "iphoneos" $directory/$framework.framework/Info.plist
	plutil -replace DTPlatformVersion -string "14.0" $directory/$framework.framework/Info.plist
	plutil -replace MinimumOSVersion -string "14.0" $directory/$framework.framework/Info.plist
	# Create a single-architecture XCFramework:
	rm -rf XcFrameworks/$framework.xcframework
	xcodebuild -create-xcframework -framework build/lib.darwin-arm64-3.9/Frameworks/$framework.framework -output  XcFrameworks/$framework.xcframework
done 

# Compress every xcFramework in .zip: 

for package in python3_ios pythonA pythonB pythonC pythonD pythonE
do
	for name in  pandas.io.sas._sas pandas._libs.index pandas._libs.join pandas._libs.parsers pandas._libs.reduction pandas._libs.tslib pandas._libs.sparse pandas._libs.properties pandas._libs.internals pandas._libs.reshape pandas._libs.ops pandas._libs.indexing pandas._libs.hashing pandas._libs.lib pandas._libs.hashtable pandas._libs.algos pandas._libs.json pandas._libs.window.indexers pandas._libs.window.aggregations pandas._libs.writers pandas._libs.ops_dispatch pandas._libs.groupby pandas._libs.interval pandas._libs.tslibs.dtypes pandas._libs.tslibs.period pandas._libs.tslibs.conversion pandas._libs.tslibs.ccalendar pandas._libs.tslibs.timedeltas pandas._libs.tslibs.strptime pandas._libs.tslibs.vectorized pandas._libs.tslibs.nattype pandas._libs.tslibs.base pandas._libs.tslibs.timezones pandas._libs.tslibs.timestamps pandas._libs.tslibs.offsets pandas._libs.tslibs.fields pandas._libs.tslibs.np_datetime pandas._libs.tslibs.parsing pandas._libs.tslibs.tzconversion pandas._libs.testing pandas._libs.missing astropy.compiler_version astropy.timeseries.periodograms.bls._impl astropy.timeseries.periodograms.lombscargle.implementations.cython_impl astropy.wcs._wcs astropy.time._parse_times astropy.io.ascii.cparser astropy.io.fits.compression astropy.io.fits._utils astropy.io.votable.tablewriter astropy.utils._compiler astropy.utils.xml._iterparser astropy.modeling._projections astropy.table._np_utils astropy.table._column_mixins astropy.cosmology.scalar_inv_efuncs astropy.convolution._convolve astropy.stats._stats erfa.ufunc
	do 
		framework=${package}-${name}
		echo $framework
		rm -f XcFrameworks/$framework.xcframework.zip
		zip -rq XcFrameworks/$framework.xcframework.zip XcFrameworks/$framework.xcframework
	done
done
fi  # [ $APP == "Carnets" ];

# SciPy modules 
# odr/__odrpack.cpython-39-darwin.so
# cluster/_hierarchy.cpython-39-darwin.so
# cluster/_optimal_leaf_ordering.cpython-39-darwin.so
# cluster/_vq.cpython-39-darwin.so
# ndimage/_ni_label.cpython-39-darwin.so
# ndimage/_nd_image.cpython-39-darwin.so
# ndimage/_ctest.cpython-39-darwin.so
# ndimage/_cytest.cpython-39-darwin.so
# linalg/_solve_toeplitz.cpython-39-darwin.so
# linalg/cython_blas.cpython-39-darwin.so
# linalg/_flapack.cpython-39-darwin.so
# linalg/_flinalg.cpython-39-darwin.so
# linalg/cython_lapack.cpython-39-darwin.so
# linalg/_fblas.cpython-39-darwin.so
# linalg/_matfuncs_sqrtm_triu.cpython-39-darwin.so
# linalg/_decomp_update.cpython-39-darwin.so
# linalg/_interpolative.cpython-39-darwin.so
# optimize/_trlib/_trlib.cpython-39-darwin.so
# optimize/_zeros.cpython-39-darwin.so
# optimize/moduleTNC.cpython-39-darwin.so
# optimize/__nnls.cpython-39-darwin.so
# optimize/minpack2.cpython-39-darwin.so
# optimize/_lbfgsb.cpython-39-darwin.so
# optimize/_lsap_module.cpython-39-darwin.so
# optimize/_bglu_dense.cpython-39-darwin.so
# optimize/_highs/highs_wrapper.cpython-39-darwin.so
# optimize/_highs/mpswriter.cpython-39-darwin.so
# optimize/_highs/constants.cpython-39-darwin.so
# optimize/_lsq/givens_elimination.cpython-39-darwin.so
# optimize/cython_optimize/_zeros.cpython-39-darwin.so
# optimize/_minpack.cpython-39-darwin.so
# optimize/_group_columns.cpython-39-darwin.so
# optimize/_slsqp.cpython-39-darwin.so
# optimize/_cobyla.cpython-39-darwin.so
# integrate/_test_odeint_banded.cpython-39-darwin.so
# integrate/vode.cpython-39-darwin.so
# integrate/_test_multivariate.cpython-39-darwin.so
# integrate/lsoda.cpython-39-darwin.so
# integrate/_quadpack.cpython-39-darwin.so
# integrate/_odepack.cpython-39-darwin.so
# integrate/_dop.cpython-39-darwin.so
# io/matlab/mio_utils.cpython-39-darwin.so
# io/matlab/streams.cpython-39-darwin.so
# io/matlab/mio5_utils.cpython-39-darwin.so
# io/_test_fortran.cpython-39-darwin.so
# _lib/_uarray/_uarray.cpython-39-darwin.so
# _lib/_test_ccallback.cpython-39-darwin.so
# _lib/_ccallback_c.cpython-39-darwin.so
# _lib/_test_deprecation_call.cpython-39-darwin.so
# _lib/_fpumode.cpython-39-darwin.so
# _lib/messagestream.cpython-39-darwin.so
# _lib/_test_deprecation_def.cpython-39-darwin.so
# special/_ellip_harm_2.cpython-39-darwin.so
# special/cython_special.cpython-39-darwin.so
# special/_comb.cpython-39-darwin.so
# special/_test_round.cpython-39-darwin.so
# special/_ufuncs.cpython-39-darwin.so
# special/specfun.cpython-39-darwin.so
# special/_ufuncs_cxx.cpython-39-darwin.so
# fftpack/convolve.cpython-39-darwin.so
# interpolate/_fitpack.cpython-39-darwin.so
# interpolate/_bspl.cpython-39-darwin.so
# interpolate/dfitpack.cpython-39-darwin.so
# interpolate/interpnd.cpython-39-darwin.so
# interpolate/_ppoly.cpython-39-darwin.so
# fft/_pocketfft/pypocketfft.cpython-39-darwin.so
# sparse/linalg/isolve/_iterative.cpython-39-darwin.so
# sparse/linalg/eigen/arpack/_arpack.cpython-39-darwin.so
# sparse/linalg/dsolve/_superlu.cpython-39-darwin.so
# sparse/_sparsetools.cpython-39-darwin.so
# sparse/csgraph/_min_spanning_tree.cpython-39-darwin.so
# sparse/csgraph/_traversal.cpython-39-darwin.so
# sparse/csgraph/_tools.cpython-39-darwin.so
# sparse/csgraph/_matching.cpython-39-darwin.so
# sparse/csgraph/_reordering.cpython-39-darwin.so
# sparse/csgraph/_flow.cpython-39-darwin.so
# sparse/csgraph/_shortest_path.cpython-39-darwin.so
# sparse/_csparsetools.cpython-39-darwin.so
# spatial/_hausdorff.cpython-39-darwin.so
# spatial/_voronoi.cpython-39-darwin.so
# spatial/ckdtree.cpython-39-darwin.so
# spatial/qhull.cpython-39-darwin.so
# spatial/transform/rotation.cpython-39-darwin.so
# spatial/_distance_wrap.cpython-39-darwin.so
# signal/_spectral.cpython-39-darwin.so
# signal/_sosfilt.cpython-39-darwin.so
# signal/spline.cpython-39-darwin.so
# signal/_peak_finding_utils.cpython-39-darwin.so
# signal/sigtools.cpython-39-darwin.so
# signal/_max_len_seq_inner.cpython-39-darwin.so
# signal/_upfirdn_apply.cpython-39-darwin.so
# stats/mvn.cpython-39-darwin.so
# stats/_stats.cpython-39-darwin.so
# stats/statlib.cpython-39-darwin.so

