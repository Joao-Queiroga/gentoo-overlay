# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm

DESCRIPTION="A Discord and Fosscord client made with the Electron API."
HOMEPAGE="https://github.com/SpacingBat3/WebCord"
SRC_URI="
	https://github.com/SpacingBat3/${PN}/releases/download/v${PV}/${PN}-${PV}-1.x86_64.rpm
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+systray"

RDEPEND="
	systray? ( dev-libs/libayatana-appindicator )
"

src_unpack() {
    rpm_src_unpack ${A}
	mkdir ${S}
	mv ${WORKDIR}/* ${S}
}

src_install() {
	mv ${S}/* ${D}
}
