#!/usr/bin/env bash


# strip std settings from conda
CXXFLAGS="${CXXFLAGS/-std=c++14/}"
CXXFLAGS="${CXXFLAGS/-std=c++11/}"
export CXXFLAGS


if [[ "${target_platform}" == osx-* ]]; then
    # See https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
    CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi



mkdir build_shapelib && cd build_shapelib
cmake ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR="$PREFIX/lib" \
    ..

cmake -LA ..
env

make ${VERBOSE_CM}
make install

if [ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]; then
ctest --verbose
fi
