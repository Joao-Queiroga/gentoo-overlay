# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit linux-mod-r1 autotools

DESCRIPTION="Detects DDC/CI devices on DDC I2C busses and creates corresponding devices."
HOMEPAGE="https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux"

if [[ ${PV} == 9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux.git"
else
	SRC_URI="https://gitlab.com/${PN}/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${PN}-v${PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"


src_compile() {
	MODULES_MAKEARGS+=(
		TARGET="${KV_FULL}"
	)
	local modlist=(
		ddcci=misc:ddcci
		ddcci-backlight=misc:ddcci-backlight
	)
	linux-mod-r1_src_compile
}
