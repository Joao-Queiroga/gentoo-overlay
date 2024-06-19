# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.2

EAPI=8

CRATES="
	arguably@2.2.0
	atty@0.2.14
	autocfg@1.1.0
	bitflags@1.3.2
	cfg-if@1.0.0
	chrono@0.4.19
	colored@2.0.0
	edit@0.1.4
	either@1.7.0
	fastrand@1.7.0
	form_urlencoded@1.0.1
	getrandom@0.2.7
	hermit-abi@0.1.19
	idna@0.2.3
	instant@0.1.12
	lazy_static@1.4.0
	libc@0.2.126
	log@0.4.17
	malloc_buf@0.0.6
	matches@0.1.9
	num-integer@0.1.45
	num-traits@0.2.15
	objc@0.2.7
	once_cell@1.13.0
	percent-encoding@2.1.0
	ppv-lite86@0.2.16
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.3
	redox_syscall@0.2.13
	remove_dir_all@0.5.3
	scopeguard@1.1.0
	tempfile@3.3.0
	time@0.1.44
	tinyvec@1.6.0
	tinyvec_macros@0.1.0
	trash@3.0.1
	unicode-bidi@0.3.8
	unicode-normalization@0.1.21
	url@2.2.2
	wasi@0.10.0+wasi-snapshot-preview1
	wasi@0.11.0+wasi-snapshot-preview1
	which@4.2.5
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-targets@0.42.2
	windows@0.44.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_msvc@0.42.2
	windows_i686_gnu@0.42.2
	windows_i686_msvc@0.42.2
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_msvc@0.42.2
"

inherit cargo

DESCRIPTION="A command line utility for batch-renaming files using a text editor."
HOMEPAGE="https://www.dmulholl.com/dev/vimv.html"
SRC_URI="
	https://github.com/dmulholl/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="0BSD"
# Dependent crate licenses
LICENSE+=" 0BSD BSD CC0-1.0 MIT MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"