#!/usr/bin/env bash


# strip std settings from conda
CXXFLAGS="${CXXFLAGS/-std=c++14/}"
CXXFLAGS="${CXXFLAGS/-std=c++11/}"
export CXXFLAGS

mkdir build_shapelib && cd build_shapelib
cmake ${CMAKE_ARGS} -D CMAKE_INSTALL_PREFIX=$PREFIX \
      $SRC_DIR

make VERBOSE=1
ctest
make install
