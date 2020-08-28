#! /bin/sh

# Change prefix to avoid issues with Lib / lib
PREFIX=$PWD
XCFRAMEWORKS_DIR=$PREFIX/../Python-aux/
export PATH=$PREFIX/install_macosx/bin:$PATH
OSX_SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
IOS_SDKROOT=$(xcrun --sdk iphoneos --show-sdk-path)
SIM_SDKROOT=$(xcrun --sdk iphonesimulator --show-sdk-path)

# 1) compile for OSX (required)

env CC=clang CXX=clang++ CPPFLAGS="-isysroot /Applications/Xcode-beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/" CFLAGS="-isysroot /Applications/Xcode-beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/" CXXFLAGS="-isysroot /Applications/Xcode-beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/" LDFLAGS="-isysroot /Applications/Xcode-beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/" LDSHARED="clang -v -undefined error -dynamiclib -isysroot /Applications/Xcode-beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/ -lz -L. -lpython3.9" ./configure --prefix=$PREFIX/install_macosx --with-system-ffi --enable-shared
make >& make_osx.log
make install >& make_install_osx.log

# 2) compile for iOS:

# 2.1) download and install required packages: 
# to do later, after several cycles of debug.
# curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/libffi.xcframework.zip

# preadv / pwritev are iOS 14+ only
env CC=clang CXX=clang++ \
	CPPFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/" \
	CFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/" \
	CXXFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/" \
	LDFLAGS="-arch arm64 -miphoneos-version-min=14.0 -isysroot/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/ -F/Users/holzschu/src/Xcode_iPad/cpython/Frameworks_iphoneos -framework ios_system -L/Users/holzschu/src/Xcode_iPad/cpython/Frameworks_iphoneos/lib" \
	LDSHARED="clang -v -undefined error -dynamiclib -isysroot /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/ -lz -L. -lpython3.9  -F/Users/holzschu/src/Xcode_iPad/cpython/Frameworks_iphoneos -framework ios_system -L/Users/holzschu/src/Xcode_iPad/cpython/Frameworks_iphoneos" \
	PLATFORM=iphoneos \
	./configure --prefix=$PREFIX/install_iphoneos --enable-shared \
	--host arm-apple-darwin --build x86_64-apple-darwin --enable-ipv6 \
	--with-openssl=$PREFIX/Frameworks_iphoneos \
	with_system_ffi=yes \
	ac_cv_file__dev_ptmx=no \
	ac_cv_file__dev_ptc=no \
	ac_cv_func_getentropy=no \
	ac_cv_func_sendfile=no \
	ac_cv_func_clock_settime=no

cp -r ../Python-aux/libffi.xcframework/ios-arm64/Headers/* $PREFIX/Frameworks_iphoneos/include/ffi/
cp -r ../Python-aux/crypto.xcframework/ios-arm64/Headers/* $PREFIX/Frameworks_iphoneos/include/crypto/
cp -r ../Python-aux/openssl.xcframework/ios-arm64/Headers/* $PREFIX/Frameworks_iphoneos/include/openssl/
# Need to copy all libs after each make clean: 
cp ../Python-aux/crypto.xcframework/ios-arm64/libcrypto.a Frameworks_iphoneos/lib/
cp ../Python-aux/openssl.xcframework/ios-arm64/libssl.a Frameworks_iphoneos/lib/
cp ../Python-aux/libffi.xcframework/ios-arm64/libffi.a Frameworks_iphoneos/lib/
find . -name \*.o -delete
make

# Now create frameworks from dynamic libraries & incorporate changes into code.

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


make install

# Also need to build for simulator 

Questions / todo: 
- openssl using a static library, with 1.1.1
- load xcframeworks / move relevant libraries in place
- merge with ios_system changes 
- generate multiple frameworks 
- generate xcframeworks
