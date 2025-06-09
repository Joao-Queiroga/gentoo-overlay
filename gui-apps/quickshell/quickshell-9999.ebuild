# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Simple and flexible QtQuick-based desktop shell toolkit"
HOMEPAGE="https://quickshell.outfoxxed.me/"
EGIT_REPO_URI="https://git.outfoxxed.me/quickshell/quickshell"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+lsp +svg"

# Git live ebuild
inherit cmake git-r3

DEPEND="
	dev-qt/qtbase:6
	dev-qt/qtdeclarative:6
	lsp? ( dev-qt/qtdeclarative:6[qmlls] )
	svg? ( dev-qt/qtsvg:6 )
	dev-qt/qtwayland:6
	dev-libs/libinput
	media-libs/mesa
	x11-libs/libdrm
	x11-libs/libxcb
	dev-libs/wayland
	dev-util/wayland-scanner
	dev-libs/wayland-protocols
	dev-cpp/cli11
	dev-libs/jemalloc
	media-video/pipewire
	dev-util/breakpad
	dev-libs/jemalloc
"

RDEPEND="${DEPEND}"
BDEPEND="
	dev-qt/qtshadertools:6
	dev-build/cmake
	dev-util/spirv-tools
	dev-build/ninja
	dev-cpp/cli11
	virtual/pkgconfig
"

src_configure() {
	local mycmakeargs=(
		-GNinja
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
		-DDISTRIBUTOR="Gentoo (ebuild: quickshell)"
		-DINSTALL_QML_PREFIX=lib64/qt6/qml
	)
	cmake_src_configure
}
