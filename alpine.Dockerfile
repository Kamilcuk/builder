FROM alpine
MAINTAINER Kamil Cukrowski <kamilcukrowski@gmail.com>
RUN set -x && \
	apk add \
		binutils-arm-none-eabi \
		clang \
		cmake \
		cppcheck \
		distcc
		doxygen \
		gcc \
		gcc-arm-none-eabi \
		git \
		graphviz \
		jq \
		libunistring \
		m4 \
		make \
		newlib-arm-none-eabi \
		ninja \
		openssh \
		patch \
		rsync \
		util-linux
		valgrind \
	&& echo done

