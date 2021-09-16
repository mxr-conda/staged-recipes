#!/bin/bash

sed -i -e 's/CLIENT_LIBS/CONFIG_CLIENT_LIBS/' scripts/CMakeLists.txt

if [[ $target_platform =~ linux.* ]]; then
  export LDFLAGS="$LDFLAGS -Wl,-rpath-link,$PREFIX/lib"
fi

mkdir build
cd build

# Set INSTALL_DOCREADMEDIR to a junk path to avoid installing the README into PREFIX
cmake  -G"$CMAKE_GENERATOR" \
       -DWITH_SSL=system \
       -DCMAKE_BUILD_TYPE=Release \
       -DCMAKE_PREFIX_PATH=$PREFIX \
       -DCMAKE_INSTALL_PREFIX=$PREFIX \
       -DSHARED_LIB_PATCH_VERSION="0" \
       -DLIBMYSQL_OS_OUTPUT_NAME=mysqlclient \
       -DINSTALL_DOCREADMEDIR="${PWD}/junk" \
       -DINSTALL_DOCDIR="${PWD}/junk" \
       ..

make -j${CPU_COUNT} ${VERBOSE_AT}
make install