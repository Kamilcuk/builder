FROM ubuntu:latest
RUN set -x && \
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		gcc-arm-none-eabi \
		clang \
		cmake \
		cppcheck \
		distcc \
		doxygen \
		gcc \
		git \
		graphviz \
		jq \
		libunistring-dev \
		m4 \
		make \
		ninja-build \
		openssh-client \
		patch \
		qemu-system-arm \
		qemu-efi \
		rsync \
		sdcc \
		valgrind \
	&& \
 	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

