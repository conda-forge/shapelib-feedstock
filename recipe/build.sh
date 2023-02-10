#!/usr/bin/env bash


# strip std settings from conda
CXXFLAGS="${CXXFLAGS/-std=c++14/}"
CXXFLAGS="${CXXFLAGS/-std=c++11/}"
export CXXFLAGS

mkdir build_shapelib && cd build_shapelib
cmake ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR="$PREFIX/lib" \
    ..

cmake -LA ..
env

make ${VERBOSE_CM}
ctest
make install
