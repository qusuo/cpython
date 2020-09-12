#! /bin/sh

IOS_SDKROOT=$(xcrun --sdk iphoneos --show-sdk-path)

clang -arch arm64  -E -isysroot $IOS_SDKROOT -miphoneos-version-min=14 -I$PREFIX/Frameworks_iphoneos/include/ -I../pyzmq-19.0.2/build/lib.macosx-10.15-x86_64-3.9/zmq/backend/cffi/ -I../pyzmq-19.0.2/build/lib.macosx-10.15-x86_64-3.9/zmq/utils/ ../pyzmq-19.0.2/build/lib.macosx-10.15-x86_64-3.9/zmq/backend/cffi/_verify.c > zmq_preprocessed.c
cp zmq_preprocessed.c preprocessed.h

# Editing: 
# :%s/^#/\/\/#/
# :%s/ __attribute/; \/\/__attribute/
# :%s/^__attribute__ ((visibility ("default"))) //
# :%s/ __asm/; \/\/__asm/
# :%s/ va_list)/...)/
# remove _Nullable in:
#  int (* _Nullable _close)(void *);
#  int (* _Nullable _read) (void *, char *, int);
#  fpos_t (* _Nullable _seek) (void *, fpos_t, int);
#  int (* _Nullable _write)(void *, const char *, int);
# Remove functions already present in zmq.h
