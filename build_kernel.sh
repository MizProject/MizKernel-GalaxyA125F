#!/bin/bash

export KBUILD_BUILD_USER="Mizumo_prjkt"

git submodule init && git submodule update

# # KCONFIG TELL
# # TELL THE HELL ON THE MAKE THAT THE a12_mizkernel_defconfig is in arch/arm64/config
# export KCONFIG_CONFIG="arch/arm64/config/a12_mizkernel_defconfig"



START_BUILD_TIME_RAW=$(TZ="Asia/Manila" date +%T)
START_BUILD_DATE_RAW=$(TZ="Asia/Manila" date +%F)
START_BUILD_TIME_AND_DATE="$START_BUILD_TIME_RAW - $START_BUILD_DATE_RAW"
echo "Starting Compile of A12s Kernel"
echo "Start Build: $START_BUILD_TIME_AND_DATE"

export CROSS_COMPILE=$(pwd)/toolchains/aarch64-linux-android-4.9-llvm/bin/aarch64-linux-android-
export CC=$(pwd)/toolchains/clang-r383902/bin/clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
export ANDROID_MAJOR_VERSION=r

export KCFLAGS=-w
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y

make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y ARCH=arm64 a12_mizkernel_defconfig
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y ARCH=arm64 -j64

cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image

echo "Build Ended :D"
END_BUILD_TIME_RAW=$(TZ="Asia/Manila" date +%T)
END_BUILD_DATE_RAW=$(TZ="Asia/Manila" date +%F)
END_BUILD_TIME_AND_DATE="$END_BUILD_TIME_RAW - $END_BUILD_DATE_RAW"
echo "Build Ended: $END_BUILD_TIME_AND_DATE"