#! /bin/sh

# Changed install prefix so multiple install coexist
PREFIX=$PWD
XCFRAMEWORKS_DIR=$PREFIX/Python-aux/
export PATH=$PREFIX/Library/bin:$PATH
export PYTHONPYCACHEPREFIX=$PREFIX/__pycache__
OSX_SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
IOS_SDKROOT=$(xcrun --sdk iphoneos --show-sdk-path)
SIM_SDKROOT=$(xcrun --sdk iphonesimulator --show-sdk-path)

# 1) compile for OSX (required)

find . -name \*.o -delete
env CC=clang CXX=clang++ CPPFLAGS="-isysroot $OSX_SDKROOT" CFLAGS="-isysroot $OSX_SDKROOT" CXXFLAGS="-isysroot $OSX_SDKROOT" LDFLAGS="-isysroot $OSX_SDKROOT" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $OSX_SDKROOT -lz -L. -lpython3.9" ./configure --prefix=$PREFIX/Library --with-system-ffi --enable-shared >& configure_osx.log
# enable-framework incompatible with local install
rm -rf build/lib.macosx-10.15-x86_64-3.9
make -j 4 >& make_osx.log
mkdir -p build/lib.macosx-10.15-x86_64-3.9  > make_install_osx.log 2>&1
cp libpython3.9.dylib build/lib.macosx-10.15-x86_64-3.9  >> make_install_osx.log 2>&1
make  -j 4 install  >> make_install_osx.log 2>&1
export PYTHONHOME=$PREFIX/Library
# When working on frozen importlib, need to compile twice:
# make regen-importlib >> make_osx.log 2>&1
# find . -name \*.o -delete  >> make_osx.log 2>&1
# make  -j 4>> make_osx.log 2>&1 
# mkdir -p build/lib.macosx-10.15-x86_64-3.9  >> make_install_osx.log 2>&1
# cp libpython3.9.dylib build/lib.macosx-10.15-x86_64-3.9  >> make_install_osx.log 2>&1
# make  -j 4 install >> make_install_osx.log 2>&1
# Force reinstall and upgrade of pip, setuptools 
python3.9 -m pip install pip --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install setuptools --upgrade >> make_install_osx.log 2>&1
# Pure-python packages that do not depend on anything, keep latest version:
# Order of packages: packages dependent on something after the one they depend on
python3.9 -m pip install six --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install html5lib --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install urllib3 --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install webencodings --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install wheel --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install pygments --upgrade >> make_install_osx.log 2>&1
# markupsafe: prevent compilation of extension:
echo Installing MarkupSafe with no extensions >> $PREFIX/make_install_osx.log 2>&1
mkdir -p packages >> $PREFIX/make_install_osx.log 2>&1
pushd packages >> $PREFIX/make_install_osx.log 2>&1
python3.9 -m pip download --no-binary :all: markupsafe >> $PREFIX/make_install_osx.log 2>&1
tar xvzf MarkupSafe*.tar.gz >> $PREFIX/make_install_osx.log 2>&1
rm MarkupSafe*.tar.gz >> $PREFIX/make_install_osx.log 2>&1
pushd MarkupSafe* >> $PREFIX/make_install_osx.log 2>&1
sed -i bak  's/run_setup(True)/run_setup(False)/g' setup.py  >> $PREFIX/make_install_osx.log 2>&1
python3.9 -m pip install . >> $PREFIX/make_install_osx.log 2>&1
popd  >> $PREFIX/make_install_osx.log 2>&1
rm -rf MarkupSafe* >> $PREFIX/make_install_osx.log 2>&1
popd >> $PREFIX/make_install_osx.log 2>&1
echo Done installing MarkupSafe >> make_install_osx.log 2>&1
# end markupsafe 
python3.9 -m pip install jinja2 --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install attrs --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install appnope --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install packaging --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install bleach --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install entrypoints --upgrade >> make_install_osx.log 2>&1
# send2trash: don't use OSX FSMoveObjectToTrashSync
echo Installing send2trash >> make_install_osx.log 2>&1
pushd packages >> make_install_osx.log 2>&1
python3.9 -m pip download send2trash --no-binary :all:  >> $PREFIX/make_install_osx.log 2>&1
tar xvzf Send2Trash*.tar.gz >> $PREFIX/make_install_osx.log 2>&1
rm Send2Trash*.tar.gz >> $PREFIX/make_install_osx.log 2>&1
pushd Send2Trash* >> $PREFIX/make_install_osx.log 2>&1
sed -i bak "s/^import sys/&, os/" send2trash/__init__.py  >> $PREFIX/make_install_osx.log 2>&1
sed -i bak "s/^if sys.platform == 'darwin'/& and not os.uname\(\).machine.startswith\('iP'\)/" send2trash/__init__.py  >> $PREFIX/make_install_osx.log 2>&1
python3.9 -m pip install . >> $PREFIX/make_install_osx.log 2>&1
popd  >> $PREFIX/make_install_osx.log 2>&1
rm -rf Send2Trash* >> $PREFIX/make_install_osx.log 2>&1
popd >> $PREFIX/make_install_osx.log 2>&1
echo done installing send2trash >> make_install_osx.log 2>&1
# end send2trash
# pyrsistent: prevent compilation of extension:
echo Installing pyrsistent with no extension >> make_install_osx.log 2>&1
pushd packages >> make_install_osx.log 2>&1
python3.9 -m pip download pyrsistent --no-binary :all:  >> $PREFIX/make_install_osx.log 2>&1
tar xvzf pyrsistent*.tar.gz >> $PREFIX/make_install_osx.log 2>&1
rm pyrsistent*.tar.gz >> $PREFIX/make_install_osx.log 2>&1
pushd pyrsistent* >> $PREFIX/make_install_osx.log 2>&1
sed -i bak 's/^if platform.python_implementation/#&/' setup.py  >> $PREFIX/make_install_osx.log 2>&1
sed -i bak 's/^    extensions = /#&/' setup.py  >> $PREFIX/make_install_osx.log 2>&1
python3.9 -m pip install . >> $PREFIX/make_install_osx.log 2>&1
popd  >> $PREFIX/make_install_osx.log 2>&1
rm -rf pyrsistent* >> $PREFIX/make_install_osx.log 2>&1
popd >> $PREFIX/make_install_osx.log 2>&1
echo done installing pyrsistent >> make_install_osx.log 2>&1
# end pyrsistent
python3.9 -m pip install ptyprocess --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install jsonschema --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install mistune --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install traitlets --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install pexpect --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install ipython-genutils --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install jupyter-core --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install nbformat --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install pandocfilters --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install testpath --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install defusedxml --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install python-dateutil --upgrade >> make_install_osx.log 2>&1
# Let jedi install the version of parso it needs (since the latest version is not OK)
# python3.9 -m pip install parso --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install jedi --upgrade >> make_install_osx.log 2>&1
# This simple trick prevents tornado from installing extensions:
CC=/bin/false python3.9 -m pip install tornado --upgrade  >> make_install_osx.log 2>&1
python3.9 -m pip install terminado --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install backcall --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install pandocfilters --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install decorator --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install prometheus-client --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install wcwidth --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install pickleshare --upgrade >> make_install_osx.log 2>&1
# To get further, we need cffi:
# OSX install of cffi: we need to recompile or Python crashes. 
# TODO: edit cffi code if static variables inside function create problems.
python3.9 -m pip uninstall cffi -y >> $PREFIX/make_install_osx.log 2>&1
pushd packages >> $PREFIX/make_install_osx.log 2>&1
python3.9 -m pip download cffi --no-binary :all: >> $PREFIX/make_install_osx.log 2>&1
tar xvzf cffi*.tar.gz >> $PREFIX/make_install_osx.log 2>&1
rm cffi*.tar.gz >> $PREFIX/make_install_osx.log 2>&1
pushd cffi-* >> $PREFIX/make_install_osx.log 2>&1
rm -rf build/* >> $PREFIX/make_install_osx.log 2>&1
cp ../setup_cffi.py ./setup.py  >> $PREFIX/make_install_osx.log 2>&1
env CC=clang CXX=clang++ CPPFLAGS="-isysroot $OSX_SDKROOT" CFLAGS="-isysroot $OSX_SDKROOT" CXXFLAGS="-isysroot $OSX_SDKROOT" LDFLAGS="-isysroot $OSX_SDKROOT" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $OSX_SDKROOT -lz -L$PREFIX -lpython3.9 -lc++ " python3 setup.py build  >> $PREFIX/make_install_osx.log 2>&1
# python3.9 -m pip install cffi --upgrade >> make_install_osx.log 2>&1
cp build/lib.macosx-10.15-x86_64-3.9/_cffi_backend.cpython-39-darwin.so $PREFIX/build/lib.macosx-10.15-x86_64-3.9/  >> $PREFIX/make_install_osx.log 2>&1
env CC=clang CXX=clang++ CPPFLAGS="-isysroot $OSX_SDKROOT" CFLAGS="-isysroot $OSX_SDKROOT" CXXFLAGS="-isysroot $OSX_SDKROOT" LDFLAGS="-isysroot $OSX_SDKROOT" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $OSX_SDKROOT -lz -L$PREFIX -lpython3.9 -lc++ " python3 setup.py install  >> $PREFIX/make_install_osx.log 2>&1
popd  >> $PREFIX/make_install_osx.log 2>&1
popd  >> $PREFIX/make_install_osx.log 2>&1
# Now we can install PyZMQ. We need to compile it ourselves to make sure it uses CFFI as a backend:
# (the wheel uses Cython)
echo Installing PyZMQ for OSX  >> make_install_osx.log 2>&1
pushd packages  >> make_install_osx.log 2>&1
python3.9 -m pip download pyzmq --no-binary :all:  >> $PREFIX/make_install_osx.log 2>&1
tar xvzf pyzmq*.tar.gz >> $PREFIX/make_install_osx.log 2>&1
rm pyzmq*.tar.gz >> $PREFIX/make_install_osx.log 2>&1
pushd pyzmq* >> $PREFIX/make_install_osx.log 2>&1
cp ../setup_pyzmq.py ./setup.py  >> $PREFIX/make_install_osx.log 2>&1
rm -rf build/* >> $PREFIX/make_install_osx.log 2>&1 
export PYZMQ_BACKEND=cffi
env CC=clang CXX=clang++ CPPFLAGS="-isysroot $OSX_SDKROOT" CFLAGS="-isysroot $OSX_SDKROOT" CXXFLAGS="-isysroot $OSX_SDKROOT" LDFLAGS="-isysroot $OSX_SDKROOT" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $OSX_SDKROOT -lz -L$PREFIX -lpython3.9 -lc++ " PYZMQ_BACKEND=cffi python3 setup.py build  >> $PREFIX/make_install_osx.log 2>&1
cp build/lib.macosx-10.15-x86_64-3.9/zmq/backend/cffi/_cffi_ext.cpython-39-darwin.so $PREFIX/build/lib.macosx-10.15-x86_64-3.9 >> $PREFIX/make_install_osx.log 2>&1
env CC=clang CXX=clang++ CPPFLAGS="-isysroot $OSX_SDKROOT" CFLAGS="-isysroot $OSX_SDKROOT" CXXFLAGS="-isysroot $OSX_SDKROOT" LDFLAGS="-isysroot $OSX_SDKROOT" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $OSX_SDKROOT -lz -L$PREFIX -lpython3.9 -lc++ " PYZMQ_BACKEND=cffi python3 setup.py install  >> $PREFIX/make_install_osx.log 2>&1
popd  >> $PREFIX/make_install_osx.log 2>&1
popd  >> $PREFIX/make_install_osx.log 2>&1
echo Done installing PyZMQ with CFFI >> make_install_osx.log 2>&1
# Let ipython chose the version of prompt-toolkit it needs
# python3.9 -m pip install prompt-toolkit --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install ipython --upgrade >> make_install_osx.log 2>&1
python3.9 -m pip install nbconvert --upgrade >> make_install_osx.log 2>&1
# argon2 for OSX: use precompiled binary. This might cause a crash later, as with cffi.
python3.9 -m pip uninstall argon2-cffi -y >> make_install_osx.log 2>&1
python3.9 -m pip install argon2-cffi --upgrade >> make_install_osx.log 2>&1
# Download argon2 now, while the dependencies are working
cp $PREFIX/Library/lib/python3.9/site-packages/argon2/_ffi.abi3.so $PREFIX/build/lib.macosx-10.15-x86_64-3.9/argon2._ffi.abi3.so
pushd packages >> make_install_osx.log 2>&1
rm -rf argon2-cffi* >> $PREFIX/make_install_osx.log 2>&1
python3.9 -m pip download argon2-cffi --no-binary :all:  >> $PREFIX/make_install_osx.log 2>&1
tar xvzf argon2-cffi*.tar.gz >> $PREFIX/make_install_osx.log 2>&1
rm argon2-cffi*.tar.gz >> $PREFIX/make_install_osx.log 2>&1
popd  >> $PREFIX/make_install_osx.log 2>&1
# Now install everything we need:
# python3.9 -m pip install jupyter --upgrade >> make_install_osx.log 2>&1
# install mpmath manually because the repository is 2 years ahead of Pipy:
pushd packages >> make_install_osx.log 2>&1
pushd mpmath >> make_install_osx.log 2>&1
git pull  >> make_install_osx.log 2>&1
python3.9 setup.py build  >> make_install_osx.log 2>&1
python3.9 setup.py install  >> make_install_osx.log 2>&1
popd  >> $PREFIX/make_install_osx.log 2>&1
popd  >> $PREFIX/make_install_osx.log 2>&1
# Now install sympy:
python3.9 -m pip install sympy --upgrade >> make_install_osx.log 2>&1
# NB: different from: pure-python packages that I have to edit (use git), 
#                     non-pure python packages (configure and make)
# break here when only installing packages or experimenting:

# 2) compile for iOS:

mkdir -p Frameworks_iphoneos
mkdir -p Frameworks_iphoneos/include
mkdir -p Frameworks_iphoneos/lib
cp -r $XCFRAMEWORKS_DIR/libffi.xcframework/ios-arm64/Headers/ffi $PREFIX/Frameworks_iphoneos/include/ffi
cp -r $XCFRAMEWORKS_DIR/libffi.xcframework/ios-arm64/Headers/ffi/* $PREFIX/Frameworks_iphoneos/include/ffi/
cp -r $XCFRAMEWORKS_DIR/crypto.xcframework/ios-arm64/Headers $PREFIX/Frameworks_iphoneos/include/crypto/
cp -r $XCFRAMEWORKS_DIR/openssl.xcframework/ios-arm64/Headers $PREFIX/Frameworks_iphoneos/include/openssl/
cp -r $XCFRAMEWORKS_DIR/libzmq.xcframework/ios-arm64/Headers/* $PREFIX/Frameworks_iphoneos/include/
# Need to copy all libs after each make clean: 
cp $XCFRAMEWORKS_DIR/crypto.xcframework/ios-arm64/libcrypto.a $PREFIX/Frameworks_iphoneos/lib/
cp $XCFRAMEWORKS_DIR/openssl.xcframework/ios-arm64/libssl.a $PREFIX/Frameworks_iphoneos/lib/
cp $XCFRAMEWORKS_DIR/libffi.xcframework/ios-arm64/libffi.a $PREFIX/Frameworks_iphoneos/lib/
cp $XCFRAMEWORKS_DIR/libzmq.xcframework/ios-arm64/libzmq.a $PREFIX/Frameworks_iphoneos/lib/
find . -name \*.o -delete
rm -f Programs/_testembed Programs/_freeze_importlib
# preadv / pwritev are iOS 14+ only
env CC=clang CXX=clang++ \
	CPPFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT" \
	CFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT" \
	CXXFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT" \
	LDFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT -F$PREFIX/Frameworks_iphoneos -framework ios_system -L$PREFIX/Frameworks_iphoneos/lib" \
	LDSHARED="clang -v -undefined error -dynamiclib -isysroot $IOS_SDKROOT -lz -L. -lpython3.9  -F$PREFIX/Frameworks_iphoneos -framework ios_system -L$PREFIX/Frameworks_iphoneos/lib" \
	PLATFORM=iphoneos \
	./configure --prefix=$PREFIX/Library --enable-shared \
	--host arm-apple-darwin --build x86_64-apple-darwin --enable-ipv6 \
	--with-openssl=$PREFIX/Frameworks_iphoneos \
	--without-computed-gotos \
	with_system_ffi=yes \
	ac_cv_file__dev_ptmx=no \
	ac_cv_file__dev_ptc=no \
	ac_cv_func_getentropy=no \
	ac_cv_func_sendfile=no \
	ac_cv_func_clock_settime=no >& configure_ios.log
# --enable-framework fails with iOS compilers
rm -rf build/lib.darwin-arm64-3.9
make -j 4 >& make_ios.log
mkdir -p  build/lib.darwin-arm64-3.9
cp libpython3.9.dylib build/lib.darwin-arm64-3.9
# Don't install for iOS
# Compilation of specific packages:
cp $PREFIX/build/lib.darwin-arm64-3.9/_sysconfigdata__darwin_darwin.py $PREFIX/Library/lib/python3.9/_sysconfigdata__darwin_darwin.py
# cffi: compile with iOS SDK
echo Installing cffi for iphoneos >> make_ios.log 2>&1
pushd packages >> make_ios.log 2>&1
pushd cffi* >> $PREFIX/make_ios.log 2>&1
# override setup.py for arm64 == iphoneos, not Apple Silicon
rm -rf build/*  >> $PREFIX/make_ios.log 2>&1
env CC=clang CXX=clang++ CPPFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT -I$PREFIX" CFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT -I$PREFIX" CXXFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT" LDFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT -F$PREFIX/Frameworks_iphoneos -framework ios_system -L$PREFIX/Frameworks_iphoneos/lib" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $IOS_SDKROOT -lz -lpython3.9  -F$PREFIX/Frameworks_iphoneos -framework ios_system -L$PREFIX/Frameworks_iphoneos/lib -L$PREFIX/build/lib.darwin-arm64-3.9" PLATFORM=iphoneos python3 setup.py build  >> $PREFIX/make_ios.log 2>&1
cp build/lib.macosx-10.15-arm64-3.9/_cffi_backend.cpython-39-darwin.so $PREFIX/build/lib.darwin-arm64-3.9/  >> $PREFIX/make_ios.log 2>&1
rm -rf build/*  >> $PREFIX/make_ios.log 2>&1
popd  >> $PREFIX/make_ios.log 2>&1
popd  >> $PREFIX/make_ios.log 2>&1
echo done compiling cffi >> $PREFIX/make_ios.log 2>&1
# end cffi
# Now we can install PyZMQ. We need to compile it ourselves to make sure it uses CFFI as a backend:
# (the wheel uses Cython)
echo Installing PyZMQ for iOS  >> $PREFIX/make_ios.log 2>&1
pushd packages  >> $PREFIX/make_ios.log 2>&1
pushd pyzmq* >> $PREFIX/make_ios.log 2>&1
rm -rf build/* >> $PREFIX/make_ios.log 2>&1
env CC=clang CXX=clang++ CPPFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT -I$PREFIX" CFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT -I$PREFIX" CXXFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT" LDFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT -F$PREFIX/Frameworks_iphoneos -framework ios_system -L$PREFIX/Frameworks_iphoneos/lib" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $IOS_SDKROOT -lz -lpython3.9 -lc++ -F$PREFIX/Frameworks_iphoneos -framework ios_system -L$PREFIX/Frameworks_iphoneos/lib -L$PREFIX/build/lib.darwin-arm64-3.9" PLATFORM=iphoneos PYZMQ_BACKEND=cffi python3 setup.py build  >> $PREFIX/make_ios.log 2>&1
cp build/lib.macosx-10.15-arm64-3.9/zmq/backend/cffi/_cffi_ext.cpython-39-darwin.so $PREFIX/build/lib.darwin-arm64-3.9/  >> $PREFIX/make_ios.log 2>&1
popd  >> $PREFIX/make_ios.log 2>&1
# Override zmq/backend/cffi with our own because we can only use cdef on iOS, not _verify  or _make_defines:
cp zmq_backend_cffi/_cffi.py $PREFIX/Library/lib/python3.9/site-packages/zmq/backend/cffi/  >> $PREFIX/make_ios.log 2>&1
cp zmq_backend_cffi/defines.h $PREFIX/Library/lib/python3.9/site-packages/zmq/backend/cffi/  >> $PREFIX/make_ios.log 2>&1
cp zmq_backend_cffi/preprocessed.h $PREFIX/Library/lib/python3.9/site-packages/zmq/backend/cffi/  >> $PREFIX/make_ios.log 2>&1
cp zmq_backend_cffi/zmq.h $PREFIX/Library/lib/python3.9/site-packages/zmq/backend/cffi/  >> $PREFIX/make_ios.log 2>&1
popd  >> $PREFIX/make_ios.log 2>&1
echo Done installing PyZMQ for iOS >> make_ios.log 2>&1
# end pyzmq
# Installing argon2-cffi:
echo Installing argon2-cffi for iphoneos >> make_ios.log 2>&1
pushd packages  >> $PREFIX/make_ios.log 2>&1
pushd argon2-cffi* >> $PREFIX/make_ios.log 2>&1
rm -rf build/* >> $PREFIX/make_ios.log 2>&1
env CC=clang CXX=clang++ CPPFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT -I$PREFIX" CFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT -I$PREFIX" CXXFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT" LDFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot $IOS_SDKROOT -F$PREFIX/Frameworks_iphoneos -framework ios_system -L$PREFIX/Frameworks_iphoneos/lib" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $IOS_SDKROOT -lz -lpython3.9  -F$PREFIX/Frameworks_iphoneos -framework ios_system -L$PREFIX/Frameworks_iphoneos/lib -L$PREFIX/build/lib.darwin-arm64-3.9" PLATFORM=iphoneos ARGON2_CFFI_USE_SSE2=0 python3 setup.py build >> $PREFIX/make_ios.log 2>&1
cp build/lib.macosx-10.15-arm64-3.9/argon2/_ffi.abi3.so $PREFIX/build/lib.darwin-arm64-3.9/argon2._ffi.abi3.so >> $PREFIX/make_ios.log 2>&1
popd  >> $PREFIX/make_ios.log 2>&1
popd  >> $PREFIX/make_ios.log 2>&1


# 3) compile for Simulator:

# 3.1) download and install required packages: 
mkdir -p Frameworks_iphonesimulator
mkdir -p Frameworks_iphonesimulator/include
mkdir -p Frameworks_iphonesimulator/lib
cp -r $XCFRAMEWORKS_DIR/libffi.xcframework/ios-x86_64-simulator/Headers/ffi $PREFIX/Frameworks_iphonesimulator/include/ffi
cp -r $XCFRAMEWORKS_DIR/libffi.xcframework/ios-x86_64-simulator/Headers/ffi/* $PREFIX/Frameworks_iphonesimulator/include/ffi/
cp -r $XCFRAMEWORKS_DIR/crypto.xcframework/ios-x86_64-simulator/Headers $PREFIX/Frameworks_iphonesimulator/include/crypto/
cp -r $XCFRAMEWORKS_DIR/openssl.xcframework/ios-x86_64-simulator/Headers $PREFIX/Frameworks_iphonesimulator/include/openssl/
cp -r $XCFRAMEWORKS_DIR/libzmq.xcframework/ios-x86_64-simulator/Headers/* $PREFIX/Frameworks_iphonesimulator/include/
# Need to copy all libs after each make clean: 
cp $XCFRAMEWORKS_DIR/crypto.xcframework/ios-x86_64-simulator/libcrypto.a $PREFIX/Frameworks_iphonesimulator/lib/
cp $XCFRAMEWORKS_DIR/openssl.xcframework/ios-x86_64-simulator/libssl.a $PREFIX/Frameworks_iphonesimulator/lib/
cp $XCFRAMEWORKS_DIR/libffi.xcframework/ios-x86_64-simulator/libffi.a $PREFIX/Frameworks_iphonesimulator/lib/
cp $XCFRAMEWORKS_DIR/libzmq.xcframework/ios-x86_64-simulator/libzmq.a $PREFIX/Frameworks_iphonesimulator/lib/
find . -name \*.o -delete
rm -f Programs/_testembed Programs/_freeze_importlib

# preadv / pwritev are iOS 14+ only
env CC=clang CXX=clang++ \
	CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT" \
	CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT" \
	CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT" \
	LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib" \
	LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -L. -lpython3.9  -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib" \
	PLATFORM=iphonesimulator \
	./configure --prefix=$PREFIX/Library --enable-shared \
	--host x86_64-apple-darwin --build x86_64-apple-darwin --enable-ipv6 \
	--with-openssl=$PREFIX/Frameworks_iphonesimulator \
	--without-computed-gotos \
	cross_compiling=yes \
	with_system_ffi=yes \
	ac_cv_file__dev_ptmx=no \
	ac_cv_file__dev_ptc=no \
	ac_cv_func_getentropy=no \
	ac_cv_func_sendfile=no \
	ac_cv_func_clock_settime=no >& configure_simulator.log
rm -rf build/lib.darwin-x86_64-3.9
make -j 4 >& make_simulator.log
mkdir -p build/lib.darwin-x86_64-3.9
cp libpython3.9.dylib build/lib.darwin-x86_64-3.9
# Don't install for iOS simulator
# Compilation of specific packages:
cp $PREFIX/build/lib.darwin-x86_64-3.9/_sysconfigdata__darwin_darwin.py $PREFIX/Library/lib/python3.9/_sysconfigdata__darwin_darwin.py
# cffi: compile with iOS SDK
echo Installing cffi for iphonesimulator >> make_simulator.log 2>&1
pushd packages >> make_simulator.log 2>&1
pushd cffi* >> $PREFIX/make_simulator.log 2>&1
rm -rf build/*  >> $PREFIX/make_ios.log 2>&1
# override setup.py for arm64 == iphoneos, not Apple Silicon
env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT" CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX" CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT" LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -L$PREFIX/build/lib.darwin-x86_64-3.9 -lpython3.9 -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib " PLATFORM=iphonesimulator python3 setup.py build  >> $PREFIX/make_simulator.log 2>&1
cp build/lib.macosx-10.15-x86_64-3.9/_cffi_backend.cpython-39-darwin.so $PREFIX/build/lib.darwin-x86_64-3.9/  >> $PREFIX/make_simulator.log 2>&1
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
env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0  -isysroot $SIM_SDKROOT -I$PREFIX" CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0  -isysroot $SIM_SDKROOT -I$PREFIX" CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT" LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0  -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -lpython3.9 -lc++ -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib -L$PREFIX/build/lib.darwin-x86_64-3.9" PLATFORM=iphonesimulator PYZMQ_BACKEND=cffi python3 setup.py build  >> $PREFIX/make_simulator.log 2>&1
cp build/lib.macosx-10.15-x86_64-3.9/zmq/backend/cffi/_cffi_ext.cpython-39-darwin.so $PREFIX/build/lib.darwin-x86_64-3.9/  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
echo Done installing PyZMQ for iOS >> make_simulator.log 2>&1
# end pyzmq
# Installing argon2-cffi:
echo Installing argon2-cffi for iphonesimulator >> make_simulator.log 2>&1
pushd packages >> $PREFIX/make_simulator.log 2>&1
pushd argon2-cffi* >> $PREFIX/make_simulator.log 2>&1
rm -rf build/* >> $PREFIX/make_simulator.log 2>&1
env CC=clang CXX=clang++ CPPFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX" CFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -I$PREFIX" CXXFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT" LDFLAGS="-arch x86_64 -miphonesimulator-version-min=14.0 -isysroot $SIM_SDKROOT -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib" LDSHARED="clang -v -undefined error -dynamiclib -isysroot $SIM_SDKROOT -lz -lpython3.9  -F$PREFIX/Frameworks_iphonesimulator -framework ios_system -L$PREFIX/Frameworks_iphonesimulator/lib -L$PREFIX/build/lib.darwin-x86_64-3.9" PLATFORM=iphonesimulator ARGON2_CFFI_USE_SSE2=0 python3 setup.py build >> $PREFIX/make_simulator.log 2>&1
cp build/lib.macosx-10.15-x86_64-3.9/argon2/_ffi.abi3.so $PREFIX/build/lib.darwin-x86_64-3.9/argon2._ffi.abi3.so  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1
popd  >> $PREFIX/make_simulator.log 2>&1


# TODO: create frameworks from dynamic libraries & incorporate changes into code.

# Python build finished successfully!
# The necessary bits to build these optional modules were not found:
# _bz2                  _curses               _curses_panel      
# _gdbm                 _lzma                 _tkinter           
# _uuid                 nis                   ossaudiodev        
# readline              spwd                                     
# To find the necessary bits, look in setup.py in detect_modules() for the module's name.
# 
# 
# The following modules found by detect_modules() in setup.py, have been
# built by the Makefile instead, as configured by the Setup files:
# _abc                  atexit                pwd                
# time                                                           


# Questions / todo: 
# - load xcframeworks / move relevant libraries in place
# - merge with ios_system changes 
# - generate multiple frameworks 
# - generate xcframeworks
