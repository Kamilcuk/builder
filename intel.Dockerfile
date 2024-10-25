FROM ubuntu:latest
ENTRYPOINT ["bash", "-c", "source /root/.oneapi_env_vars && \"$@\"", "--"]
CMD ["bash"]
ENV CC=icc

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-cxo", "pipefail"]
RUN \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		software-properties-common \
		apt-transport-https \
		ca-certificates \
		wget \
	&& \
	wget --progress=dot:giga -O - https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB 2>/dev/null | apt-key add - && \
	add-apt-repository -y "deb https://apt.repos.intel.com/oneapi all main" && \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		g++ \
		make \
		intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic \
		cmake \
		patch \
		m4 \
		python3-jinja2 \
		git \
	&& \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN \
	echo ". /opt/intel/oneapi/setvars.sh" >> ~/.bashrc && \
	env > default_env_vars && \
	. /opt/intel/oneapi/setvars.sh && \
	env > env_vars && \
	diff default_env_vars env_vars | grep ">" | sed  s/..// | sort | \
		sed 's/^/export /' | sed "s/=/='/" | sed "s/$/'/" >> /root/.oneapi_env_vars && \
	rm default_env_vars env_vars && \
	tmp=$(which icc) && \
	update-alternatives --install /usr/bin/cc cc "$tmp" 100 && \
	update-alternatives --set cc "$tmp" && \
	tmp=$(which icx) && \
	update-alternatives --install /usr/bin/c++ c++ "$tmp" 100 && \
	update-alternatives --set c++ "$tmp"

