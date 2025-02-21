EAPI=8

VALA_USE_DEPEND="valadoc"
inherit git-r3 meson vala

DESCRIPTION="IO library for astal"
HOMEPAGE="https://aylur.github.io/astal"
EGIT_REPO_URI="https://github.com/Aylur/astal"

LICENSE="LGPL-2.1"
SLOT="0"

DEPEND="
	gui-libs/gtk-layer-shell[introspection]
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-libs/gobject-introspection
	dev-libs/wayland-protocols
	dev-build/meson
"

S="${S}/lib/astal/io"

src_configure() {
	vala_setup
	meson_src_configure
}
