#!/usr/bin/env bash
set -e -x

mkdir -p build && cd build
cmake -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$PREFIX" \
    -DWITH_MYSQLCOMPAT=1 \
    -DINSTALL_LIBDIR=lib \
    ../

ninja install

#make -k -j${CPU_COUNT} || true

#make install

#make test