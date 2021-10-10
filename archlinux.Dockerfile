FROM archlinux
MAINTAINER Kamil Cukrowski <kamilcukrowski@gmail.com>
RUN set -x && \
	pacman --noconfirm -Sy \
		arm-none-eabi-binutils \
		arm-none-eabi-gcc \
		arm-none-eabi-gdb \
		arm-none-eabi-newlib \
		clang \
		cmake \
		cppcheck \
		distcc \
		doxygen \
		gcc \
		git \
		graphviz \
		jq \
		libunistring \
		m4 \
		make \
		ninja \
		openssh \
		patch \
		qemu-arch-extra \
		qemu-headless-arch-extra \
		rsync \
		sdcc \
		valgrind \
	&& \
	bash -c "echo 'y' | pacman -Scc >/dev/null 2>&1" && \
	paccache -rk0 >/dev/null 2>&1 &&  \
	pacman-optimize && \
	rm -r /var/lib/pacman/sync/*

