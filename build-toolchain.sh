#!/usr/bin/env bash

if [[ $# != 1 ]]; then
	echo "No target defined, abort..."
	exit 1
fi

ELFBOOT_TARGET="$1-elfboot"
ELFBOOT_PREFIX="$(pwd)"

mkdir -p binutils-build
cd binutils-build

echo "Building elfboot-binutils..."

../elfboot-binutils/configure		\
	--target=$ELFBOOT_TARGET	\
	--prefix=$ELFBOOT_PREFIX	\
	--with-sysroot			\
	--disable-nls			\
	--disable-werror

make
make install

echo "Successfully installed elfboot-binutils."

cd $ELFBOOT_PREFIX

echo "Building elfboot-gcc..."
echo "Download prerequisites..."

cd elfboot-gcc
./contrib/download_prerequisites
cd $ELFBOOT_PREFIX

mkdir -p gcc-build
cd gcc-build

../elfboot-gcc/configure		\
	--target=$ELFBOOT_TARGET	\
	--prefix=$ELFBOOT_PREFIX	\
	--disable-nls			\
	--enable-languages=c		\
	--without-headers

make all-gcc
make all-target-libgcc
make install-gcc

echo "Successfully installed elfboot-gcc."

make install-target-libgcc

echo "Successfully installed libgcc for target $ELFBOOT_TARGET."

exit 0
