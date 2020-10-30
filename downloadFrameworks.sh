#! /bin/sh

curl -OL https://github.com/holzschu/ios_system/releases/download/2.6/ios_error.h
mkdir -p Python-aux
pushd Python-aux
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/libffi.xcframework.zip
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/crypto.xcframework.zip
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/openssl.xcframework.zip
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/libzmq.xcframework.zip
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/libjpeg.xcframework.zip
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/libtiff.xcframework.zip
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/freetype.xcframework.zip
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/harfbuzz.xcframework.zip
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/libpng.xcframework.zip
curl -OL https://github.com/holzschu/ios_system/releases/download/2.6/ios_system.xcframework.zip

rm -rf libffi.xcframework crypto.xcframework openssl.xcframework ios_system.xcframework libzmq.xcframework libjpeg.xcframework libtiff.xcframework freetype.xcframework harfbuzz.xcframework libpng.xcframework
unzip -q libffi.xcframework.zip
unzip -q crypto.xcframework.zip
unzip -q openssl.xcframework.zip
unzip -q libzmq.xcframework.zip
unzip -q libjpeg.xcframework.zip
unzip -q libtiff.xcframework.zip
unzip -q freetype.xcframework.zip
unzip -q harfbuzz.xcframework.zip
unzip -q libpng.xcframework.zip
unzip -q ios_system.xcframework.zip

popd
