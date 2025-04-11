# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3

DESCRIPTION="Modern looking SDDM Qt6 theme"
HOMEPAGE="https://github.com/Keyitdev/sddm-astronaut-theme"
EGIT_REPO_URI="https://github.com/Keyitdev/sddm-astronaut-theme.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
  x11-misc/sddm
  dev-qt/qt5compat:6
  dev-qt/qtdeclarative:6
  dev-qt/qtmultimedia:6[ffmpeg]
  dev-qt/qtsvg:6
  dev-qt/qtvirtualkeyboard:6
"

src_install() {
  insinto /usr/share/sddm/themes/sddm-astronaut-theme
  doins -r "${S}"/.*

  if [ -d "${S}/Fonts" ]; then
    insinto /usr/share/fonts
    doins -r Fonts/*
  fi
}

