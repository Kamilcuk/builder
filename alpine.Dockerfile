FROM alpine:latest
RUN set -x && \
	apk add --no-cache \
		bash \
		binutils-arm-none-eabi \
		build-base \
		clang \
		cmake \
		cppcheck \
		distcc \
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
		util-linux \
		valgrind \
	&& echo 'done'

