# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_USE_DEPEND="valadoc"
inherit meson vala

DESCRIPTION="vala panel appmenu glib translator"
HOMEPAGE="https://gitlab.com/vala-panel-project/vala-panel-appmenu"

if [[ ${PV} == 9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/vala-panel-project/vala-panel-appmenu.git"
	S="${WORKDIR}/${P}/subprojects/${PN}"
else
	SRC_URI="https://gitlab.com/vala-panel-project/vala-panel-appmenu/-/archive/${PV}/vala-panel-appmenu-${PV}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/vala-panel-appmenu-${PV}/subprojects/${PN}"
fi


LICENSE="LGPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lang/vala[valadoc]
"

src_prepare() {
	default
	vala_setup
}
