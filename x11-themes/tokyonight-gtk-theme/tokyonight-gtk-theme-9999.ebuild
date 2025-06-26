# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A GTK theme based on the Tokyo Night colour palette."
HOMEPAGE="https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme"
EGIT_REPO_URI="https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme.git"
IUSE="icons"

LICENSE="GPL-3.0"
SLOT="0"

DEPEND="
	x11-themes/gnome-themes-standard
	x11-themes/gtk-engines-murrine
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lang/sassc
"

src_install() {
	${S}/themes/install.sh -d ${D}/usr/share/themes
	if use icons; then
		insinto /usr/share
		doins -r ${S}/icons
	fi
}
