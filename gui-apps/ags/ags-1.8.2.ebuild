# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson toolchain-funcs

DESCRIPTION="A customizable and extensible shell"
HOMEPAGE="https://github.com/Aylur/ags"

SRC_URI="
	https://github.com/Aylur/${PN}/releases/download/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/Aylur/${PN}/releases/download/v${PV}/node_modules-v${PV}.tar.gz -> ${P}-modules.tar.gz
	"
KEYWORDS="~amd64"
LICENSE="GPL-3.0"
SLOT="0"
RESTRICT="mirror"
IUSE="upower bluetooth networkmanager tray"

BDEPEND="
	dev-lang/typescript
	net-libs/nodejs[npm]
"
RDEPEND="
	dev-libs/gjs
	x11-libs/gtk+
	gui-libs/gtk-layer-shell[introspection]
	dev-libs/gobject-introspection
	upower? ( sys-power/upower )
	bluetooth? ( net-wireless/gnome-bluetooth )
	networkmanager? ( net-misc/networkmanager )
	tray? ( dev-libs/libdbusmenu[gtk3] )
"

DEPEND="
	${RDEPEND}
"

S="${WORKDIR}/ags"
BUILD_DIR="${S}/build"

src_prepare() {
	default
	mv ../node_modules .
}

src_configure() {
	meson_src_configure --libdir "lib/$PN"
}

src_install() {
	meson_src_install

	# Copy packaged NodeJS modules to the app dir
	insinto "/usr/share/com.github.Aylur.ags/"
	doins -r "node_modules"
}
