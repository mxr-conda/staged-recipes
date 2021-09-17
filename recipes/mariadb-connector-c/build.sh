#!/usr/bin/env bash

set -ex

if [[ $target_platform =~ linux.* ]]; then
  export LDFLAGS="$LDFLAGS -Wl,-rpath-link,$PREFIX/lib"
fi

mkdir build
cd build

# Set INSTALL_DOCREADMEDIR to a junk path to avoid installing the README into PREFIX
cmake \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON \
    ..

make -k -j${CPU_COUNT} || true

make install