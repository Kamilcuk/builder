FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN set -x && \
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
		rsync \
		sdcc \
		valgrind \
	&& \
 	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

