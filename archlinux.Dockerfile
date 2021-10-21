FROM archlinux:latest
RUN set -x && \
	pacman --noconfirm -Suy \
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
	echo 'y' | pacman -Scc && \
	rm -r /var/lib/pacman/sync/*

