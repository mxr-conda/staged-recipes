#!/usr/bin/env bash
set -e -x

mkdir build
cd build
cmake ../ -DCMAKE_BUILD_TYPE=Release
cmake --build . --target install