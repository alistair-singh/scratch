#!/bin/sh

export CC=` which clang `
export CXX=` which clang++ `
cmake -D_CMAKE_TOOLCHAIN_PREFIX=llvm- -G"Unix Makefiles"
