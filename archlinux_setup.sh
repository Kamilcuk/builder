#!/bin/bash

PACKAGES=(
	sudo
	base-devel
	git
	arm-none-eabi-binutils
	arm-none-eabi-gcc
	arm-none-eabi-gdb
	arm-none-eabi-newlib
	clang
	cmake
	cppcheck
	distcc
	doxygen
	gcc
	git
	graphviz
	jq
	libunistring
	m4
	make
	ninja
	openssh
	patch
	qemu-arch-extra
	rsync
	sdcc
	valgrind
	python-jinja
	gcovr
)

. /common_archlinux.sh
