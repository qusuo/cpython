#! /bin/sh

mkdir -p Python-aux
pushd Python-aux
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/libffi.xcframework.zip
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/crypto.xcframework.zip
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/openssl.xcframework.zip
curl -OL https://github.com/holzschu/ios_system/releases/download/2.6/ios_system.xcframework.zip

rm -rf libffi.xcframework crypto.xcframework openssl.xcframework ios_system.xcframework
unzip -q libffi.xcframework.zip
unzip -q crypto.xcframework.zip
unzip -q openssl.xcframework.zip
unzip -q ios_system.xcframework.zip

popd
