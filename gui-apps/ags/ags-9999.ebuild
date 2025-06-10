# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 go-module meson

DESCRIPTION="A customizable and extensible shell"
HOMEPAGE="https://github.com/Aylur/ags"
EGIT_REPO_URI="https://github.com/Aylur/ags.git"
EGIT_BRANCH="v3"

LICENSE="GPL-3.0"
SLOT="0"

DEPEND="
	gui-libs/astal
	gui-libs/astal-libs
	net-libs/nodejs[npm]
	dev-util/dart-sass
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	git-r3_src_unpack
	local S="${WORKDIR}/${P}/cli"
	go-module_live_vendor
}
src_configure() {
	local GOMODCACHE="${WORKDIR}/go-mod"
	meson_src_configure
}

src_compile() {
	local GOMODCACHE="${WORKDIR}/go-mod"
	local GOPROXY=off
	meson_src_compile
}
