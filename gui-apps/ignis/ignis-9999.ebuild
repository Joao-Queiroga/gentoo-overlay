# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=meson-python
inherit distutils-r1

DESCRIPTION="A widget framework for building desktop shells, written and configurable in Python"
HOMEPAGE="https://linkfrg.github.io/ignis/"
if [[ ${PV} == 9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/linkfrg/ignis.git"
else
	SRC_URI="https://github.com/linkfrg/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="LGPL-2.1"
SLOT="0"

DEPEND="
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/loguru[${PYTHON_USEDEP}]
	dev-python/pycairo[${PYTHON_USEDEP}]
	media-libs/libpulse
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-libs/gobject-introspection
	gui-libs/gtk
	gui-libs/gtk4-layer-shell[introspection,vala]
	dev-python/meson-python[${PYTHON_USEDEP}]
"
DISTUTILS_ARGS=(
	-Dbuild_gvc=false
	)

python_install_all() {
	default
	chmod +x "${D}/usr/bin/ignis"
}
