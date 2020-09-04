#! /bin/sh

mkdir -p Python-aux
pushd Python-aux
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/libffi.xcframework.zip
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/crypto.xcframework.zip
curl -OL https://github.com/holzschu/Python-aux/releases/download/1.0/openssl.xcframework.zip

rm -rf libffi.xcframework crypto.xcframework openssl.xcframework
unzip -q libffi.xcframework.zip
unzip -q crypto.xcframework.zip
unzip -q openssl.xcframework.zip

popd
