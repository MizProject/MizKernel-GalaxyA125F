#!/bin/bash

export CROSS_COMPILE=$(pwd)/toolchains/aarch64-linux-android-4.9-llvm/bin/aarch64-linux-android-
export CC=$(pwd)/toolchains/clang-r383902/bin/clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
export ANDROID_MAJOR_VERSION=r
export KBUILD_BUILD_USER="Mizumo_prjkt"

make clean && make mrproper
make menuconfig
