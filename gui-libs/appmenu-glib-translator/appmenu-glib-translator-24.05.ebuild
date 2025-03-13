# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_USE_DEPEND="valadoc"
inherit meson vala

DESCRIPTION="vala panel appmenu glib translator"
HOMEPAGE=""
SRC_URI="https://gitlab.com/-/project/6865053/uploads/296e97e93e634bf8e540b8dfc418243a/${P}.tar.xz"
S="${WORKDIR}"/${PN}-24.02

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lang/vala[valadoc]
"

src_prepare() {
	default
	vala_setup
}
