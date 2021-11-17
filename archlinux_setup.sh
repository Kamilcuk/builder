#!/bin/bash
set -xeuo pipefail

if [[ ! -e /.dockerenv ]]; then
	echo "error: this script is meant to be in docker" >&2
	exit 2
fi

{
	echo "Installing packages"
	pacman-key --init
	# shellcheck disable=2016
	printf "%s\n" '' '[archlinuxcn]' 'Server = http://repo.archlinuxcn.org/$arch' >> /etc/pacman.conf
	pacman -Sy --noconfirm --needed archlinux-keyring archlinuxcn-keyring
	pkg=(
		sudo
		base-devel
		git
		aurutils
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
	)
	pacman -Suy --noconfirm --needed "${pkg[@]}"
}

{
	echo "Create builder account"
	useradd builder --shell /bin/bash --home-dir /home/builder --create-home
	passwd -d builder
	chmod +w /etc/sudoers
	echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
	echo "root    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
	chmod -w /etc/sudoers
}

builder_setup() {
	set -xeuo pipefail

	echo "builder : Disable ssh key checking"
	mkdir -p ~/.ssh
	printf "%s\n" '' 'Host *' '  StrictHostKeyChecking accept-new' >> ~/.ssh/config

	echo "builder : Use pacman pubring in builder gpg"
	mkdir -p ~/.gnupg
	chmod 700 ~/.gnupg
	echo "keyring /etc/pacman.d/gnupg/pubring.gpg" >> ~/.gnupg/gpg.conf
}
sudo -u builder bash -c "$(declare -f builder_setup); builder_setup"

{
	echo "Use all possible cores with makepkg"
	# shellcheck disable=2016
	sed -i -e 's/^MAKEFLAGS=*/MAKEFLAGS=-j$(nproc)/' /etc/makepkg.conf
}

{
	echo "Allow running makepkg as root"
	sed -i -e 's/if (( EUID == 0 )); then/if false; then  # &/' /usr/bin/makepkg
}

{
	echo "Disable ssh key checking"
	printf "%s\n" '' 'Host *' '  StrictHostKeyChecking accept-new' >> /etc/ssh/ssh_configca
}

{
	echo "Cleanup"
	echo -e 'y\ny\n' | pacman -Scc
	rm -r /var/lib/pacman/sync/*
}

