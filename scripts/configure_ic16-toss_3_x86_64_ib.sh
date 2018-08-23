#!/usr/bin/env bash

export PKG_ROOT=/usr/gapps/bdiv/toss_3_x86_64_ib/intel-16-mvapich2-2.2
export COMPILER_ROOT=/usr/tce/packages/mvapich2/mvapich2-2.2-intel-16.0.4/bin
# Intel 16 does not define __builtin_addressof operator used in GCC 7, so
# use GCC 6 instead, because it is still C++11-compliant
export GCC_ROOT=/usr/tce/packages/gcc/gcc-6.1.0/bin
export LAPACK_LDFLAGS="-L${PKG_ROOT}/lapack/3.5.0/lib -llapack -lblas"
# Needed to fix failing CPP check
export CC="${COMPILER_ROOT}/mpicc -gxx-name=${GCC_ROOT}/g++"

./configure \
    --with-FC="${COMPILER_ROOT}/mpif90 -gxx-name=${GCC_ROOT}/g++" \
    --with-CXX="${COMPILER_ROOT}/mpicxx -gxx-name=${GCC_ROOT}/g++" \
    --with-lapack=${PKG_ROOT}/lapack/3.5.0/lib \
    --with-lapack-libs="${LAPACK_LDFLAGS}" \
    --with-hdf5=${PKG_ROOT}/hdf5/1.8.10p1 \
    --with-zlib=${PKG_ROOT}/zlib/1.2.3/lib \
    --with-gtest=no \
    --with-elemental=no \
    --enable-opt=yes \
    --enable-debug=no \
    "$@"