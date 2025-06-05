# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit unpacker xdg-utils desktop

DESCRIPTION="GUI for NordVPN"
HOMEPAGE="https://nordvpn.com"
SRC_URI="https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn-gui/nordvpn-gui_${PV}_amd64.deb"

LICENSE="NordVPN"
SLOT="0"
KEYWORDS="-* ~amd64"

RDEPEND="net-vpn/nordvpn
	x11-libs/gtk+:3"

RESTRICT="strip"

S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
	gzip ${S}/usr/share/doc/nordvpn-gui/changelog.Debian.gz -d
}

src_install() {
	local appdir="/opt/nordvpn-gui"

	insinto "${appdir}"
	doins -r opt/nordvpn-gui/* || die

	exeinto "${appdir}"
	doexe opt/nordvpn-gui/nordvpn-gui || die

	dosym "${appdir}/nordvpn-gui" /usr/bin/nordvpn-gui || die

	doicon usr/share/icons/hicolor/scalable/apps/nordvpn-gui.svg || die

	dodoc usr/share/doc/nordvpn-gui/changelog.Debian

	domenu "${S}"/usr/share/applications/nordvpn-gui.desktop || die
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
