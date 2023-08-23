#! /bin/sh

# jupyter-something adds pandas-2.0.0 and pyzmq-25.0b1, which breaks things down 
# So far, the "fix" is to manually remove them. Add this to the script?
# Don't forget to edit easy-install.pth too!

# Changed install prefix so multiple install coexist
export PREFIX=$PWD
export XCFRAMEWORKS_DIR=$PREFIX/Python-aux/
# $PREFIX/Library/bin so that the new python is in the path, 
# ~/.cargo/bin for rustc
export PATH=$PREFIX/Library/bin:~/.cargo/bin:$PATH
export PYTHONPYCACHEPREFIX=$PREFIX/__pycache__
export OSX_SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
export SIM_SDKROOT=$(xcrun --sdk iphonesimulator --show-sdk-path)
export DEBUG="-O3 -Wall"
# Comment this line to re-download all package source from PyPi
export USE_CACHED_PACKAGES=1
# DEBUG="-g"
export OSX_VERSION=11.5 # $(sw_vers -productVersion |awk -F. '{print $1"."$2}')
# Numpy sets it to 10.9 otherwise. gfortran needs it to 11.5 (for scipy at least)
export MACOSX_DEPLOYMENT_TARGET=$OSX_VERSION
# TODO: remove -3.11 from $PREFIX/build directories, use $ARCH in directory names.
# export ARCH=$(uname -m)
# Loading different set of frameworks based on the Application:
APP=$(basename `dirname $PWD`)
#
# Set to 1 if you have gfortran for arm64 installed. gfortran support is highly experimental.
# You might need to edit the script as well.
USE_FORTRAN=0
if [ -e "/usr/local/aarch64-apple-darwin20/lib/libgfortran.dylib" ];then
	USE_FORTRAN=1
fi

# 3) compile for Simulator:

export OSX_VERSION=$(sw_vers -productVersion |awk -F. '{print $1"."$2}')

# 3.1) download and install required packages: 
mkdir -p Frameworks_iphonesimulator
mkdir -p Frameworks_iphonesimulator/include
mkdir -p Frameworks_iphonesimulator/lib
rm -rf Frameworks_iphonesimulator/ios_system.framework
rm -rf Frameworks_iphonesimulator/freetype.framework
rm -rf Frameworks_iphonesimulator/openblas.framework
cp -r $XCFRAMEWORKS_DIR/ios_system.xcframework/ios-arm64_x86_64-simulator/ios_system.framework $PREFIX/Frameworks_iphonesimulator
cp -r $XCFRAMEWORKS_DIR/freetype.xcframework/ios-x86_64-simulator/freetype.framework $PREFIX/Frameworks_iphonesimulator
cp -r $XCFRAMEWORKS_DIR/libffi.xcframework/ios-x86_64-simulator/Headers/ffi $PREFIX/Frameworks_iphonesimulator/include/ffi
cp -r $XCFRAMEWORKS_DIR/libffi.xcframework/ios-x86_64-simulator/Headers/ffi/* $PREFIX/Frameworks_iphonesimulator/include/ffi/
cp -r $XCFRAMEWORKS_DIR/crypto.xcframework/ios-x86_64-simulator/Headers $PREFIX/Frameworks_iphonesimulator/include/crypto/
cp -r $XCFRAMEWORKS_DIR/openssl.xcframework/ios-x86_64-simulator/Headers $PREFIX/Frameworks_iphonesimulator/include/openssl/
cp -r $XCFRAMEWORKS_DIR/libzmq.xcframework/ios-x86_64-simulator/Headers/* $PREFIX/Frameworks_iphonesimulator/include/
cp -r $XCFRAMEWORKS_DIR/libjpeg.xcframework/ios-x86_64-simulator/Headers/* $PREFIX/Frameworks_iphonesimulator/include/
cp -r $XCFRAMEWORKS_DIR/libtiff.xcframework/ios-x86_64-simulator/Headers/* $PREFIX/Frameworks_iphonesimulator/include/
cp -r $XCFRAMEWORKS_DIR/libxslt.xcframework/ios-x86_64-simulator/Headers/* $PREFIX/Frameworks_iphonesimulator/include/
cp -r $XCFRAMEWORKS_DIR/libexslt.xcframework/ios-x86_64-simulator/Headers/* $PREFIX/Frameworks_iphonesimulator/include/
cp -r $XCFRAMEWORKS_DIR/libfftw3.xcframework/ios-x86_64-simulator/Headers/* $PREFIX/Frameworks_iphonesimulator/include/
cp -r $XCFRAMEWORKS_DIR/freetype.xcframework/ios-x86_64-simulator/freetype.framework/Headers/* $PREFIX/Frameworks_iphonesimulator/include/
cp -r $XCFRAMEWORKS_DIR/liblzma.xcframework/ios-x86_64-simulator/Headers/lz* $PREFIX/Frameworks_iphonesimulator/include/
# Need to copy all libs after each make clean: 
cp $XCFRAMEWORKS_DIR/crypto.xcframework/ios-x86_64-simulator/libcrypto.a $PREFIX/Frameworks_iphonesimulator/lib/
cp $XCFRAMEWORKS_DIR/openssl.xcframework/ios-x86_64-simulator/libssl.a $PREFIX/Frameworks_iphonesimulator/lib/
cp $XCFRAMEWORKS_DIR/libffi.xcframework/ios-x86_64-simulator/libffi.a $PREFIX/Frameworks_iphonesimulator/lib/
cp $XCFRAMEWORKS_DIR/libzmq.xcframework/ios-x86_64-simulator/libzmq.a $PREFIX/Frameworks_iphonesimulator/lib/
cp $XCFRAMEWORKS_DIR/libjpeg.xcframework/ios-x86_64-simulator/libjpeg.a $PREFIX/Frameworks_iphonesimulator/lib/
cp $XCFRAMEWORKS_DIR/libtiff.xcframework/ios-x86_64-simulator/libtiff.a $PREFIX/Frameworks_iphonesimulator/lib/
cp $XCFRAMEWORKS_DIR/libxslt.xcframework/ios-x86_64-simulator/libxslt.a $PREFIX/Frameworks_iphonesimulator/lib/
cp $XCFRAMEWORKS_DIR/libexslt.xcframework/ios-x86_64-simulator/libexslt.a $PREFIX/Frameworks_iphonesimulator/lib/
cp $XCFRAMEWORKS_DIR/libfftw3.xcframework/ios-x86_64-simulator/libfftw3.a $PREFIX/Frameworks_iphonesimulator/lib/
cp $XCFRAMEWORKS_DIR/libfftw3_threads.xcframework/ios-x86_64-simulator/libfftw3_threads.a $PREFIX/Frameworks_iphonesimulator/lib/
cp $XCFRAMEWORKS_DIR/liblzma.xcframework/ios-x86_64-simulator/liblzma.a $PREFIX/Frameworks_iphonesimulator/lib/
#
cp -r $XCFRAMEWORKS_DIR/libgeos_c.xcframework/ios-x86_64-simulator/libgeos_c.framework/Headers/* $PREFIX/Frameworks_iphonesimulator/include/
cp -r $XCFRAMEWORKS_DIR/libgeos_c.xcframework/ios-x86_64-simulator/libgeos_c.framework  $PREFIX/Frameworks_iphonesimulator/
rm -rf $PREFIX/Frameworks_iphonesimulator/include/gdal
cp -r $XCFRAMEWORKS_DIR/libgdal.xcframework/ios-x86_64-simulator/libgdal.framework/Headers $PREFIX/Frameworks_iphonesimulator/include/gdal
cp -r $XCFRAMEWORKS_DIR/libgdal.xcframework/ios-x86_64-simulator/libgdal.framework  $PREFIX/Frameworks_iphonesimulator/
cp -r $XCFRAMEWORKS_DIR/libproj.xcframework/ios-x86_64-simulator/libproj.framework/Headers/* $PREFIX/Frameworks_iphonesimulator/include
cp -r $XCFRAMEWORKS_DIR/libproj.xcframework/ios-x86_64-simulator/libproj.framework  $PREFIX/Frameworks_iphonesimulator/

find . -name \*.o -delete
rm -f Programs/_testembed Programs/_freeze_importlib

# preadv / pwritev are iOS 14+ only
env CC=clang CXX=clang++ \
	CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX/Frameworks_iphonesimulator/include/" \
	CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX/Frameworks_iphonesimulator/include/" \
	CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX/Frameworks_iphonesimulator/include/" \
	LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -lz -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib" \
	LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -L. -lpython3.11  -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib" \
	PLATFORM=iphonesimulator \
	OPT="$DEBUG" \
	./configure --prefix=$PREFIX/Library --enable-shared \
	--host x86_64-apple-darwin --build x86_64-apple-darwin --enable-ipv6 \
	--with-openssl=$PREFIX/Frameworks_iphonesimulator \
	--with-build-python=$PREFIX/python3.11 \
	--without-computed-gotos \
	cross_compiling=yes \
	with_system_ffi=yes \
	ac_cv_file__dev_ptmx=no \
	ac_cv_file__dev_ptc=no \
	ac_cv_func_getentropy=no \
	ac_cv_func_sendfile=no \
	ac_cv_func_setregid=no \
	ac_cv_func_setreuid=no \
	ac_cv_func_setsid=no \
	ac_cv_func_setpgid=no \
	ac_cv_func_setpgrp=no \
	ac_cv_func_setuid=no \
    ac_cv_func_forkpty=no \
    ac_cv_func_openpty=no \
	ac_cv_func_clock_settime=no >& configure_simulator.log
#	--without-pymalloc 
#	--with-assertions 
rm -rf build/lib.darwin-x86_64-3.11
make >& make_simulator.log
mkdir -p build/lib.darwin-x86_64-3.11
cp libpython3.11.dylib build/lib.darwin-x86_64-3.11
# Don't install for iOS simulator
# Compilation of specific packages:
cp $PREFIX/build/lib.darwin-x86_64-3.11/_sysconfigdata__darwin_darwin.py $PREFIX/Library/lib/python3.11/_sysconfigdata__darwin_darwin.py
if [ $APP == "Carnets" ]; 
then
cp $PREFIX/build/lib.darwin-x86_64-3.11/_sysconfigdata__darwin_darwin.py $PREFIX/with_scipy/Library/lib/python3.11/_sysconfigdata__darwin_darwin.py
fi
# cffi: compile with iOS SDK
echo Installing cffi for iphonesimulator >> $PREFIX/make_simulator.log 2>&1
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd cffi* >> $PREFIX/make_simulator.log 2>&1
rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
# override setup.py for arm64 == iphoneos, not Apple Silicon
env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT" CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX" CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT" LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -L$PREFIX/build/lib.darwin-x86_64-3.11 -lpython3.11 -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib " PLATFORM=iphonesimulator python3.11 setup.py build  >> $PREFIX/make_simulator.log 2>&1
cp build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/_cffi_backend.cpython-311-darwin.so $PREFIX/build/lib.darwin-x86_64-3.11/  >> $PREFIX/make_simulator.log 2>&1
# rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
# rm -rf cffi*  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
echo done compiling cffi for iphonesimulator >> $PREFIX/make_simulator.log 2>&1
# end cffi
# Now we can install PyZMQ. We need to compile it ourselves to make sure it uses CFFI as a backend:
# (the wheel uses Cython)
echo Installing PyZMQ for iphonesimulator  >> $PREFIX/make_simulator.log 2>&1
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd pyzmq* >> $PREFIX/make_simulator.log 2>&1
rm -rf build/* >> $PREFIX/make_simulator.log 2>&1
env PYZMQ_BACKEND_CFFI=1 CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0  -isysroot $SIM_SDKROOT  -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 -I$PREFIX" CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0  -isysroot $SIM_SDKROOT  -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 -I$PREFIX" CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT  -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 -I$PREFIX" LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0  -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -lpython3.11 -lc++ -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib -L$PREFIX/build/lib.darwin-x86_64-3.11" PLATFORM=iphonesimulator PYZMQ_BACKEND=cffi python3.11 setup.py build  >> $PREFIX/make_simulator.log 2>&1
mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/zmq/backend/cffi/ >> $PREFIX/make_simulator.log 2>&1
cp build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/zmq/backend/cffi/_cffi.*.so $PREFIX/build/lib.darwin-x86_64-3.11/zmq/backend/cffi/  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
echo Done installing PyZMQ for iOS simulator >> $PREFIX/make_simulator.log 2>&1
# end pyzmq
# Installing argon2-cffi-bindings:
echo Installing argon2-cffi-bindings for iphonesimulator >> $PREFIX/make_simulator.log 2>&1
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd argon2-cffi-bindings* >> $PREFIX/make_simulator.log 2>&1
rm -rf build/* >> $PREFIX/make_simulator.log 2>&1
env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX" CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX" CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT" LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -lpython3.11  -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib -L$PREFIX/build/lib.darwin-x86_64-3.11" PLATFORM=iphonesimulator ARGON2_CFFI_USE_SSE2=0 python3.11 setup.py build >> $PREFIX/make_simulator.log 2>&1
mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/_argon2_cffi_bindings/  >> $PREFIX/make_simulator.log 2>&1
cp build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/_argon2_cffi_bindings/_ffi.abi3.so $PREFIX/build/lib.darwin-x86_64-3.11/_argon2_cffi_bindings/_ffi.abi3.so  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
# Numpy:
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd numpy >> $PREFIX/make_simulator.log 2>&1
rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
rm -f site.cfg  >> $PREFIX/make_simulator.log 2>&1
# For the time being, no gfortran compiler for simulator, so no openblas framework for simulator.
rm -f $PREFIX/Library/lib/python3.11/site-packages/numpy/random/lib/libnpyrandom.a  >> $PREFIX/make_simulator.log 2>&1
rm -f $PREFIX/Library/lib/python3.11/site-packages/numpy/core/lib/libnpymath.a >> $PREFIX/make_simulator.log 2>&1
env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX $DEBUG" CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 $DEBUG" CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 $DEBUG" LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib $DEBUG" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -lpython3.11  -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib -L$PREFIX/build/lib.darwin-x86_64-3.11 $DEBUG" PLATFORM=iphonesimulator NPY_BLAS_ORDER="" NPY_LAPACK_ORDER="" SETUPTOOLS_USE_DISTUTILS=stdlib python3.11 setup.py build  >> $PREFIX/make_simulator.log 2>&1
pushd build/lib.macosx-${OSX_VERSION}-x86_64-3.11 >> $PREFIX/make_simulator.log 2>&1
for library in `find numpy -name \*.so`
do
	directory=$(dirname $library)
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/$directory >> $PREFIX/make_simulator.log 2>&1
	cp $library $PREFIX/build/lib.darwin-x86_64-3.11/$library >> $PREFIX/make_simulator.log 2>&1
done
popd  >> $PREFIX/make_simulator.log 2>&1
# Making a single numpy dynamic library:
echo Making a single numpy library for iOS Simulator: >> $PREFIX/make_simulator.log 2>&1
clang -v -undefined error -dynamiclib \
-isysroot $SIM_SDKROOT \
-lz -lm \
-lpython3.11 \
-F$PREFIX/Frameworks_iphonesimulator -framework ios_system \
-L$PREFIX/Frameworks_iphonesimulator/lib \
-L$PREFIX/build/lib.darwin-x86_64-3.11 \
-O3 -Wall -arch x86_64 \
-miphonesimulator-version-min=14.0 \
-DCYTHON_PEP489_MULTI_PHASE_INIT=0 \
-DCYTHON_USE_DICT_VERSIONS=0 \
`find build -name \*.o` \
-L$PREFIX/Library/lib \
-Lbuild/temp.macosx-${OSX_VERSION}-x86_64-3.11 \
-lnpymath \
-lnpyrandom \
-o build/numpy.so  >> $PREFIX/make_simulator.log 2>&1
cp build/numpy.so $PREFIX/build/lib.darwin-x86_64-3.11 >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
# Matplotlib
## kiwisolver
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd kiwisolver* >> $PREFIX/make_simulator.log 2>&1
rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX" CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX" CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX" LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/build/lib.darwin-x86_64-3.11 " LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -L$PREFIX/build/lib.darwin-x86_64-3.11 -lpython3.11 -F$PREFIX/Frameworks_iphonesimulator -framework ios_system" PLATFORM=iphonesimulator python3.11 setup.py build  >> $PREFIX/make_simulator.log 2>&1
mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/kiwisolver/  >> $PREFIX/make_simulator.log 2>&1
cp ./build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/kiwisolver/_cext.cpython-311-darwin.so $PREFIX/build/lib.darwin-x86_64-3.11/kiwisolver/  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
## Pillow
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd Pillow* >> $PREFIX/make_simulator.log 2>&1
rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -I$PREFIX -I$PREFIX/Frameworks_iphonesimulator/include/" \
	CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -I$PREFIX -I$PREFIX/Frameworks_iphonesimulator/include/" \
	CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -I$PREFIX -I$PREFIX/Frameworks_iphonesimulator/include/" \
	LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -framework freetype -L$PREFIX/Frameworks_iphonesimulator/lib/ -L$PREFIX/build/lib.darwin-x86_64-3.11 " \
	LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -framework freetype -L$PREFIX/build/lib.darwin-x86_64-3.11 -lz -lpython3.11 -L$PREFIX/Frameworks_iphonesimulator/lib/ -ljpeg -ltiff" PLATFORM=iphonesimulator python3.11 setup.py build  >> $PREFIX/make_simulator.log 2>&1
mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/PIL/  >> $PREFIX/make_simulator.log 2>&1
cp ./build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/PIL/*.so  $PREFIX/build/lib.darwin-x86_64-3.11/PIL/ >> $PREFIX/make_simulator.log 2>&1
# Single library PIL.so
clang -v -undefined error -dynamiclib \
-isysroot $SIM_SDKROOT \
-lz -lm \
-lpython3.11 \
-F$PREFIX/Frameworks_iphonesimulator -framework ios_system -framework freetype \
-L$PREFIX/Frameworks_iphonesimulator/lib -ljpeg -ltiff \
-L$PREFIX/build/lib.darwin-x86_64-3.11 \
-O3 -Wall \
-arch x86_64 -miphonesimulator-version-min=14.0 \
`find build -name \*.o` \
-L$PREFIX/Library/lib \
-Lbuild/temp.macosx-${OSX_VERSION}-x86_64-cpython-311 \
-o build/PIL.so  >> $PREFIX/make_simulator.log 2>&1
cp build/PIL.so $PREFIX/build/lib.darwin-x86_64-3.11 >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
## contourpy: 
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd contourpy*  >> $PREFIX/make_simulator.log 2>&1
rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
env CC=clang CXX=clang++ CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -I$PREFIX -I$PREFIX/Frameworks_iphonesimulator/include/" \
	CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -I$PREFIX -I$PREFIX/Frameworks_iphonesimulator/include/" \
	LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -framework freetype -L$PREFIX/build/lib.darwin-x86_64-3.11 -lz -lpython3.11 -L$PREFIX/Frameworks_iphonesimulator/lib/ -ljpeg -ltiff" \
	PLATFORM=iphonesimulator \
	python3.11 setup.py build >> $PREFIX/make_simulator.log 2>&1
mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/contourpy/  >> $PREFIX/make_simulator.log 2>&1
echo contourpy libraries for iOS: >> $PREFIX/make_simulator.log 2>&1
find build -name \*.so -print  >> $PREFIX/make_simulator.log 2>&1
cp ./build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/contourpy/*.so  $PREFIX/build/lib.darwin-x86_64-3.11/contourpy/ >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
## matplotlib
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd matplotlib  >> $PREFIX/make_simulator.log 2>&1
rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -I$PREFIX -I$PREFIX/Frameworks_iphonesimulator/include/" \
	CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -I$PREFIX -I$PREFIX/Frameworks_iphonesimulator/include/" \
	CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -I$PREFIX -I$PREFIX/Frameworks_iphonesimulator/include/" \
	LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -framework freetype -L$PREFIX/Frameworks_iphonesimulator/lib/ -L$PREFIX/build/lib.darwin-x86_64-3.11 " \
	LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -framework freetype -L$PREFIX/build/lib.darwin-x86_64-3.11 -lz -lpython3.11 -L$PREFIX/Frameworks_iphonesimulator/lib/ -ljpeg -ltiff" PLATFORM=iphonesimulator python3.11 setup.py build  >> $PREFIX/make_simulator.log 2>&1
pushd build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311 >> $PREFIX/make_simulator.log 2>&1
for library in `find matplotlib -name \*.so`
do
	directory=$(dirname $library)
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/$directory >> $PREFIX/make_simulator.log 2>&1
	cp $library $PREFIX/build/lib.darwin-x86_64-3.11/$library >> $PREFIX/make_simulator.log 2>&1
done
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
# lxml:
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd lxml*  >> $PREFIX/make_simulator.log 2>&1
rm -rf build/* >> $PREFIX/make_simulator.log 2>&1
env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/ -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 $DEBUG" CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/ -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 $DEBUG" CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT  -I$PREFIX/Frameworks_iphonesimulator/include/ -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 $DEBUG" LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib $DEBUG" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -lpython3.11  -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib -L$PREFIX/build/lib.darwin-x86_64-3.11 $DEBUG" PLATFORM=iphonesimulator python3.11 setup.py build --with-cython >> $PREFIX/make_simulator.log 2>&1
pushd build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311 >> $PREFIX/make_simulator.log 2>&1
for library in `find lxml -name \*.so`
do
	directory=$(dirname $library)
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/$directory >> $PREFIX/make_simulator.log 2>&1
	cp $library $PREFIX/build/lib.darwin-x86_64-3.11/$library >> $PREFIX/make_simulator.log 2>&1
done
popd  >> $PREFIX/make_simulator.log 2>&1
# Single library for lxml:
clang -v -undefined error -dynamiclib \
	-arch x86_64 -miphonesimulator-version-min=14.0 \
	-isysroot $SIM_SDKROOT \
	-lz -lm -lc++ -lpython3.11 \
	-F$PREFIX/Frameworks_iphonesimulator -framework ios_system  \
	-L$PREFIX/Frameworks_iphonesimulator/lib -lxslt -lexslt \
	-L$PREFIX/build/lib.darwin-x86_64-3.11 \
	-O3 -Wall \
	`find build -name \*.o` \
	-L$PREFIX/Library/lib -Lbuild/temp.macosx-${OSX_VERSION}-x86_64-cpython-311 \
	-lxml2  \
	-o build/lxml.so >> $PREFIX/make_simulator.log 2>&1
cp build/lxml.so $PREFIX/build/lib.darwin-x86_64-3.11 >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
# cryptography: 
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd cryptography* >> $PREFIX/make_simulator.log 2>&1
rm -rf build/* >> $PREFIX/make_simulator.log 2>&1
# As of Feb. 11, 2021, rustc is unable to cross-compile a dynamic library for iOS. We stick to the old version.
env CRYPTOGRAPHY_DONT_BUILD_RUST=1 CC=clang CXX=clang++ \
CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/ -DCRYPTOGRAPHY_OSRANDOM_ENGINE=CRYPTOGRAPHY_OSRANDOM_ENGINE_DEV_URANDOM" \
CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/  -DCRYPTOGRAPHY_OSRANDOM_ENGINE=CRYPTOGRAPHY_OSRANDOM_ENGINE_DEV_URANDOM " \
CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/  -DCRYPTOGRAPHY_OSRANDOM_ENGINE=CRYPTOGRAPHY_OSRANDOM_ENGINE_DEV_URANDOM" \
LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/build/lib.darwin-x86_64-3.11 -L$PREFIX/Frameworks_iphonesimulator/lib/" \
LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/build/lib.darwin-x86_64-3.11 -lz -lpython3.11 -L$PREFIX/Frameworks_iphonesimulator/lib/" \
PLATFORM=iphonesimulator python3.11 setup.py build  >> $PREFIX/make_simulator.log 2>&1
mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/cryptography/  >> $PREFIX/make_simulator.log 2>&1
mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/cryptography/hazmat  >> $PREFIX/make_simulator.log 2>&1
mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/cryptography/hazmat/bindings  >> $PREFIX/make_simulator.log 2>&1
cp build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/cryptography/hazmat/bindings/*.so $PREFIX/build/lib.darwin-x86_64-3.11/cryptography/hazmat/bindings >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
# pycryptodome:
if [ $APP == "a-Shell" ]; 
then
	pushd packages >> $PREFIX/make_simulator.log 2>&1
	pushd pycryptodome-* >> $PREFIX/make_simulator.log 2>&1
	rm .separate_namespace  >> $PREFIX/make_simulator.log 2>&1
	rm -rf build/* >> $PREFIX/make_simulator.log 2>&1
	env CC=clang CXX=clang++ \
		CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/" \
		CFLAGS=  "-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/" \
		CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/" \
		LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/build/lib.darwin-x86_64-3.11 -L$PREFIX/Frameworks_iphonesimulator/lib/" \
		LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/build/lib.darwin-x86_64-3.11 -lz -lpython3.11 -L$PREFIX/Frameworks_iphonesimulator/lib/" \
		PLATFORM=iphonesimulator python3.11 setup.py build  >> $PREFIX/make_simulator.log 2>&1
	echo pycryptodome libraries for Simulator: >> $PREFIX/make_simulator.log 2>&1
	find build -name \*.so -print  >> $PREFIX/make_simulator.log 2>&1
	pushd build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311 >> $PREFIX/make_simulator.log 2>&1
	for library in `find Crypto -name \*.so`
	do
		directory=$(dirname $library)
		mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/$directory >> $PREFIX/make_simulator.log 2>&1
		cp $library $PREFIX/build/lib.darwin-x86_64-3.11/$library >> $PREFIX/make_simulator.log 2>&1
	done
	popd  >> $PREFIX/make_simulator.log 2>&1
	# pycryptodomex:
	touch .separate_namespace  >> $PREFIX/make_simulator.log 2>&1
	rm -rf build/* >> $PREFIX/make_simulator.log 2>&1
	env CC=clang CXX=clang++ \
		CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/" \
		CFLAGS=  "-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/" \
		CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/" \
		LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/build/lib.darwin-x86_64-3.11 -L$PREFIX/Frameworks_iphonesimulator/lib/" \
		LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/build/lib.darwin-x86_64-3.11 -lz -lpython3.11 -L$PREFIX/Frameworks_iphonesimulator/lib/" \
		PLATFORM=iphonesimulator python3.11 setup.py build  >> $PREFIX/make_simulator.log 2>&1
	echo pycryptodomex libraries for Simulator: >> $PREFIX/make_simulator.log 2>&1
	find build -name \*.so -print  >> $PREFIX/make_simulator.log 2>&1
	pushd build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311 >> $PREFIX/make_simulator.log 2>&1
	for library in `find Cryptodome -name \*.so`
	do
		directory=$(dirname $library)
		mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/$directory >> $PREFIX/make_simulator.log 2>&1
		cp $library $PREFIX/build/lib.darwin-x86_64-3.11/$library >> $PREFIX/make_simulator.log 2>&1
	done
	popd  >> $PREFIX/make_simulator.log 2>&1
	popd  >> $PREFIX/make_simulator.log 2>&1
	popd  >> $PREFIX/make_simulator.log 2>&1
fi # a-Shell (pycryptodome)
# regex (for nltk)
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd regex*  >> $PREFIX/make_simulator.log 2>&1
rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
env CC=clang CXX=clang++ \
	CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/" \
	CFLAGS=  "-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/" \
	CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/" \
	LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/build/lib.darwin-x86_64-3.11 -L$PREFIX/Frameworks_iphonesimulator/lib/" \
	LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/build/lib.darwin-x86_64-3.11 -lz -lpython3.11 -L$PREFIX/Frameworks_iphonesimulator/lib/" \
	PLATFORM=iphonesimulator python3.11 setup.py build  >> $PREFIX/make_simulator.log 2>&1
# copy the library in the right place:
find . -name \*.so >> $PREFIX/make_simulator.log 2>&1                                                                               
mkdir -p  $PREFIX/build/lib.darwin-x86_64-3.11/regex/ >> $PREFIX/make_simulator.log 2>&1
cp build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/regex/_regex.cpython-311-darwin.so $PREFIX/build/lib.darwin-x86_64-3.11/regex/ >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
# wordcloud
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd word_cloud  >> $PREFIX/make_simulator.log 2>&1
rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
env CC=clang CXX=clang++ \
	CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/ -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 $DEBUG" \
	CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/ -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 $DEBUG" \
	CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT  -I$PREFIX/Frameworks_iphonesimulator/include/ -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 $DEBUG" \
	LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib $DEBUG" \
	LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -lpython3.11  -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib -L$PREFIX/build/lib.darwin-x86_64-3.11 $DEBUG" \
	PLATFORM=iphonesimulator python3.11 setup.py build >> $PREFIX/make_simulator.log 2>&1
find build -name \*.so -print  >>  $PREFIX/make_simulator.log 2>&1
mkdir -p  $PREFIX/build/lib.darwin-x86_64-3.11/wordcloud/ >> $PREFIX/make_simulator.log 2>&1
cp build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/wordcloud/query_integral_image.cpython-311-darwin.so $PREFIX/build//lib.darwin-x86_64-3.11/wordcloud/ >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
# pyfftw: uses libfftw3.
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd pyFFTW-*  >> $PREFIX/make_simulator.log 2>&1
rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
env CC=clang CXX=clang++ \
	CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX -I$PREFIX/Frameworks_iphonesimulator/include/ -Wno-error=implicit-function-declaration $DEBUG  -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0" \
	CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX  -I$PREFIX/Frameworks_iphonesimulator/include/ -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 -Wno-error=implicit-function-declaration $DEBUG" \
	CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT  -I$PREFIX/Frameworks_iphonesimulator/include/ -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 -Wno-error=implicit-function-declaration $DEBUG"\
	LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib $DEBUG" \
	LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -lpython3.11  -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib -L$PREFIX/build/lib.darwin-x86_64-3.11 $DEBUG"\
	PLATFORM=iphonesimulator \
	PYFFTW_INCLUDE=$PREFIX/Frameworks_iphonesimulator/include/ PYFFTW_LIB_DIR=$PREFIX/Frameworks_iphonesimulator/lib python3.11 setup.py build >> $PREFIX/make_simulator.log 2>&1
# ./build/lib.macosx-11.3-arm64-3.11/pyfftw/pyfftw.cpython-311-darwin.so
find . -name \*.so  >> $PREFIX/make_simulator.log 2>&1
mkdir -p  $PREFIX/build/lib.darwin-x86_64-3.11/pyfftw/ >> $PREFIX/make_simulator.log 2>&1
cp ./build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/pyfftw/pyfftw.cpython-311-darwin.so $PREFIX/build/lib.darwin-x86_64-3.11/pyfftw/  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
# Pandas:
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd pandas*  >> $PREFIX/make_simulator.log 2>&1
rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
# Need to load parser/tokenizer.h before Parser/tokenizer.h
PANDAS=$PWD
env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PANDAS/pandas/_libs/src/ -I$PREFIX $DEBUG" CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PANDAS/pandas/_libs/src/ -I$PREFIX -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 $DEBUG" CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PANDAS/pandas/_libs/src/ -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 $DEBUG" LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib $DEBUG" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -lpython3.11  -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib -L$PREFIX/build/lib.darwin-x86_64-3.11 $DEBUG" PLATFORM=iphonesimulator NPY_BLAS_ORDER="" NPY_LAPACK_ORDER="" python3.11 setup.py build  >> $PREFIX/make_simulator.log 2>&1
mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/pandas/  >> $PREFIX/make_simulator.log 2>&1
mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/pandas/io  >> $PREFIX/make_simulator.log 2>&1
mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/pandas/io/sas  >> $PREFIX/make_simulator.log 2>&1
mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/pandas/_libs  >> $PREFIX/make_simulator.log 2>&1
mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/pandas/_libs/window  >> $PREFIX/make_simulator.log 2>&1
mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/pandas/_libs/tslibs  >> $PREFIX/make_simulator.log 2>&1
cp build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/pandas/io/sas/_sas.cpython-311-darwin.so $PREFIX/build/lib.darwin-x86_64-3.11/pandas/io/sas >> $PREFIX/make_simulator.log 2>&1
cp build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/pandas/_libs/*.so $PREFIX/build/lib.darwin-x86_64-3.11/pandas/_libs >> $PREFIX/make_simulator.log 2>&1
cp build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/pandas/_libs/window/*.so $PREFIX/build/lib.darwin-x86_64-3.11/pandas/_libs/window >> $PREFIX/make_simulator.log 2>&1
cp build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/pandas/_libs/tslibs/*.so $PREFIX/build/lib.darwin-x86_64-3.11/pandas/_libs/tslibs >> $PREFIX/make_simulator.log 2>&1
# Making a single pandas dynamic library:
echo Making a single pandas library for iOS Simulator: >> $PREFIX/make_simulator.log 2>&1
clang -v -undefined error -dynamiclib \
-isysroot $SIM_SDKROOT \
-lz -lm -lc++ \
-lpython3.11 \
-F$PREFIX/Frameworks_iphonesimulator -framework ios_system \
-L$PREFIX/Frameworks_iphonesimulator/lib \
-L$PREFIX/build/lib.darwin-x86_64-3.11 \
-O3 -Wall -arch x86_64 \
-miphonesimulator-version-min=14.0 \
-DCYTHON_PEP489_MULTI_PHASE_INIT=0 \
-DCYTHON_USE_DICT_VERSIONS=0 \
`find build -name \*.o` \
-L$PREFIX/Library/lib \
-Lbuild/temp.macosx-${OSX_VERSION}-x86_64-cpython-311 \
-o build/pandas.so  >> $PREFIX/make_simulator.log 2>&1
cp build/pandas.so $PREFIX/build/lib.darwin-x86_64-3.11 >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
	# bokeh, dill: pure Python installs
	# pyerfa (for astropy)
	pushd packages >> $PREFIX/make_simulator.log 2>&1
	pushd pyerfa-*  >> $PREFIX/make_simulator.log 2>&1
	rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
	env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX $DEBUG" CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PANDAS/pandas/_libs/src/ -I$PREFIX $DEBUG" CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PANDAS/pandas/_libs/src/ $DEBUG" LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib $DEBUG" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -lpython3.11  -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib -L$PREFIX/build/lib.darwin-x86_64-3.11 $DEBUG" PLATFORM=iphonesimulator python3.11 setup.py build >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/erfa/  >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/erfa/ufunc.cpython-311-darwin.so \
$PREFIX/build/lib.darwin-x86_64-3.11/erfa >> $PREFIX/make_simulator.log 2>&1
	popd  >> $PREFIX/make_simulator.log 2>&1
	popd  >> $PREFIX/make_simulator.log 2>&1	
	# astropy
	pushd packages >> $PREFIX/make_simulator.log 2>&1
	pushd astropy*  >> $PREFIX/make_simulator.log 2>&1
	rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
	env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX $DEBUG" CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PANDAS/pandas/_libs/src/ -I$PREFIX -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 $DEBUG" CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PANDAS/pandas/_libs/src/ -DCYTHON_PEP489_MULTI_PHASE_INIT=0 -DCYTHON_USE_DICT_VERSIONS=0 $DEBUG" LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib $DEBUG" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -lpython3.11  -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib -L$PREFIX/build/lib.darwin-x86_64-3.11 $DEBUG" PLATFORM=iphonesimulator NPY_BLAS_ORDER="" NPY_LAPACK_ORDER="" python3.11 setup.py build  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/timeseries/periodograms/bls  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/timeseries/periodograms/lombscargle/implementations  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/wcs  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/time  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/utils  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/utils/xml  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/io/ascii  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/io/fits  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/io/votable  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/modeling  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/table  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/cosmology/flrw  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/convolution  >> $PREFIX/make_simulator.log 2>&1
	mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/astropy/stats  >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/compiler_version.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/timeseries/periodograms/bls/_impl.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/timeseries/periodograms/bls/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/timeseries/periodograms/lombscargle/implementations/cython_impl.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/timeseries/periodograms/lombscargle/implementations/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/wcs/_wcs.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/wcs/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/time/_parse_times.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/time/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/io/ascii/cparser.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/io/ascii/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/io/fits/compression.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/io/fits/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/io/fits/_utils.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/io/fits/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/io/votable/tablewriter.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/io/votable/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/utils/_compiler.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/utils/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/utils/xml/_iterparser.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/utils/xml/ >> $PREFIX/make_simulator.log 2>&1
#    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/modeling/_projections.cpython-311-darwin.so \
#      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/modeling/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/table/_np_utils.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/table/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/table/_column_mixins.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/table/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/cosmology/flrw/scalar_inv_efuncs.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/cosmology/flrw >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/convolution/_convolve.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/convolution/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/stats/_stats.cpython-311-darwin.so \
      $PREFIX/build/lib.darwin-x86_64-3.11/astropy/stats/ >> $PREFIX/make_simulator.log 2>&1
    cp  build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/astropy/stats/_fast_sigma_clip.cpython-311-darwin.so \
	  $PREFIX/build/lib.darwin-x86_64-3.11/astropy/stats/ >> $PREFIX/make_simulator.log 2>&1
	  # Making a single astropy dynamic library:
    echo Making a single astropy library for iOS Simulator: >> $PREFIX/make_simulator.log 2>&1
    clang -v -undefined error -dynamiclib \
  	  -isysroot $SIM_SDKROOT \
  	  -lz -lm -lc++ \
  	  -lpython3.11 \
  	  -F$PREFIX/Frameworks_iphonesimulator -framework ios_system \
  	  -L$PREFIX/Frameworks_iphonesimulator/lib \
  	  -L$PREFIX/build/lib.darwin-x86_64-3.11 \
  	  -O3 -Wall -arch x86_64 \
  	  -miphonesimulator-version-min=14.0 \
  	  -DCYTHON_PEP489_MULTI_PHASE_INIT=0 \
  	  -DCYTHON_USE_DICT_VERSIONS=0 \
  	  `find build -name \*.o` \
  	  -L$PREFIX/Library/lib \
  	  -Lbuild/temp.macosx-${OSX_VERSION}-x86_64-cpython-311 \
  	  -o build/astropy.so  >> $PREFIX/make_simulator.log 2>&1
	cp build/astropy.so $PREFIX/build/lib.darwin-x86_64-3.11 >> $PREFIX/make_simulator.log 2>&1
	popd  >> $PREFIX/make_simulator.log 2>&1
	popd  >> $PREFIX/make_simulator.log 2>&1
	# geopandas and cartopy: require Shapely (GEOS), fiona (GDAL), pyproj (PROJ), rtree
	# Shapely (interface for geos)
	pushd packages >> $PREFIX/make_simulator.log 2>&1
	pushd Shapely-* >> $PREFIX/make_simulator.log 2>&1
	rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
	env CC=clang CXX=clang++ CPPFLAGS="-isysroot $SIM_SDKROOT -I$PREFIX -I $PREFIX/Frameworks_iphonesimulator/include" \
		CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT $DEBUG -I$PREFIX -I $PREFIX/Frameworks_iphonesimulator/include/" \
		CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT $DEBUG -I$PREFIX -I $PREFIX/Frameworks_iphonesimulator/include" \
		LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT $DEBUG -F $PREFIX/Frameworks_iphonesimulator/ -framework libgeos_c" \
		LDSHARED="clang -v -undefined error -dynamiclib -arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -lz -L$PREFIX -lpython3.11  -F$PREFIX/Frameworks_iphonesimulator -framework ios_system $DEBUG -framework libgeos_c" \
		PLATFORM=iphonesimulator \
		NO_GEOS_CONFIG=1 \
		python3.11 setup.py build >> $PREFIX/make_simulator.log 2>&1
	echo "Shapely libraries for Simulator: " >> $PREFIX/make_simulator.log 2>&1
	find . -name \*.so  >> $PREFIX/make_simulator.log 2>&1
	for library in shapely/speedups/_speedups.cpython-311-darwin.so shapely/vectorized/_vectorized.cpython-311-darwin.so
	do
		directory=$(dirname $library)
		mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/$directory >> $PREFIX/make_simulator.log 2>&1
		cp ./build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/$library $PREFIX/build/lib.darwin-x86_64-3.11/$library >> $PREFIX/make_simulator.log 2>&1
	done
	popd  >> $PREFIX/make_simulator.log 2>&1
	popd  >> $PREFIX/make_simulator.log 2>&1	
	# Fiona (interface for GDAL)
	pushd packages >> $PREFIX/make_simulator.log 2>&1
	# We need to install from the repository, because the source from pip do not include the .pyx files.
	pushd Fiona >> $PREFIX/make_simulator.log 2>&1
	rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
	env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX -I $PREFIX/Frameworks_iphonesimulator/include/gdal " \
		CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT $DEBUG -I$PREFIX -I $PREFIX/Frameworks_iphonesimulator/include/gdal " \
		CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT $DEBUG -I$PREFIX -I $PREFIX/Frameworks_iphonesimulator/include/gdal " \
		LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT $DEBUG -F $PREFIX/Frameworks_iphonesimulator/ -framework libgdal" \
		LDSHARED="clang -v -arch x86_64 -miphonesimulator-version-min=14.0 -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -L$PREFIX -lpython3.11 $DEBUG -F $PREFIX/Frameworks_iphonesimulator/ -framework ios_system -framework libgdal" \
		PLATFORM=iphonesimulator \
		GDAL_VERSION=3.6.0 \
		python3.11 setup.py build >> $PREFIX/make_simulator.log 2>&1
	echo "Fiona libraries for Simulator: "  >> $PREFIX/make_simulator.log 2>&1
	find . -name \*.so  >> $PREFIX/make_simulator.log 2>&1
	for library in fiona/schema.cpython-311-darwin.so fiona/ogrext.cpython-311-darwin.so fiona/_crs.cpython-311-darwin.so fiona/_err.cpython-311-darwin.so fiona/_transform.cpython-311-darwin.so fiona/_shim.cpython-311-darwin.so fiona/_geometry.cpython-311-darwin.so fiona/_env.cpython-311-darwin.so
	do
		directory=$(dirname $library)
		mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/$directory >> $PREFIX/make_simulator.log 2>&1
		cp ./build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/$library $PREFIX/build/lib.darwin-x86_64-3.11/$library >> $PREFIX/make_simulator.log 2>&1
	done
	clang -v -undefined error -dynamiclib \
		-arch x86_64 -miphonesimulator-version-min=14.0 \
		-isysroot $SIM_SDKROOT \
		-lz -lm -lc++ \
		-O3 -Wall \
		`find build -name \*.o` \
		-L$PREFIX -lpython3.11 \
		-F$PREFIX/Frameworks_iphonesimulator -framework libgdal \
		-o build/fiona.so >> $PREFIX/make_simulator.log 2>&1
	cp build/fiona.so $PREFIX/build/lib.darwin-x86_64-3.11 >> $PREFIX/make_simulator.log 2>&1
	popd  >> $PREFIX/make_simulator.log 2>&1
	popd  >> $PREFIX/make_simulator.log 2>&1
	# PyProj (interface for Proj)
	pushd packages >> $PREFIX/make_simulator.log 2>&1
	pushd pyproj-*  >> $PREFIX/make_simulator.log 2>&1
	rm -rf build/*  >> $PREFIX/make_simulator.log 2>&1
	env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX -I $PREFIX/Frameworks_iphonesimulator/include " \
		CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT $DEBUG -I$PREFIX -I $PREFIX/Frameworks_iphonesimulator/include " \
		CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT $DEBUG -I$PREFIX -I $PREFIX/Frameworks_iphonesimulator/include " \
		LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT $DEBUG -F $PREFIX/Frameworks_iphonesimulator/ -framework libproj" \
		LDSHARED="clang -v -arch x86_64 -miphonesimulator-version-min=14.0 -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -L$PREFIX -lpython3.11 $DEBUG -F $PREFIX/Frameworks_iphonesimulator/ -framework ios_system -framework libproj" \
		PLATFORM=iphonesimulator \
		PROJ_VERSION=9.1.0 \
		python3.11 setup.py build >> $PREFIX/make_simulator.log 2>&1
	echo "pyproj libraries for Simulator: "  >> $PREFIX/make_simulator.log 2>&1
	find . -name \*.so  >> $PREFIX/make_simulator.log 2>&1
	for library in pyproj/_transformer.cpython-311-darwin.so pyproj/_datadir.cpython-311-darwin.so pyproj/list.cpython-311-darwin.so pyproj/_compat.cpython-311-darwin.so pyproj/_crs.cpython-311-darwin.so pyproj/_network.cpython-311-darwin.so pyproj/_geod.cpython-311-darwin.so pyproj/database.cpython-311-darwin.so pyproj/_sync.cpython-311-darwin.so
	do
		directory=$(dirname $library)
		mkdir -p $PREFIX/build/lib.darwin-x86_64-3.11/$directory >> $PREFIX/make_simulator.log 2>&1
		cp ./build/lib.macosx-${OSX_VERSION}-x86_64-cpython-311/$library $PREFIX/build/lib.darwin-x86_64-3.11/$library >> $PREFIX/make_simulator.log 2>&1
	done
	clang -v -undefined error -dynamiclib \
		-arch x86_64 -miphonesimulator-version-min=14.0 \
		-isysroot $SIM_SDKROOT \
		-lz -lm -lc++ -lpython3.11 \
		-L$PREFIX/build/lib.darwin-x86_64-3.11 \
		-O3 -Wall \
		`find build -name \*.o` \
		-F$PREFIX/Frameworks_iphonesimulator -framework libproj \
		-o build/pyproj.so >> $PREFIX/make_simulator.log 2>&1
	cp build/pyproj.so $PREFIX/build/lib.darwin-x86_64-3.11 >> $PREFIX/make_simulator.log 2>&1
	popd  >> $PREFIX/make_simulator.log 2>&1
	popd  >> $PREFIX/make_simulator.log 2>&1

