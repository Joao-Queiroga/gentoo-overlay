EAPI=8

VALA_USE_DEPEND="valadoc"
inherit git-r3 meson vala

DESCRIPTION="Building blocks for building desktop shells."
HOMEPAGE="https://aylur.github.io/astal"
EGIT_REPO_URI="https://github.com/Aylur/astal"

LICENSE="LGPL-2.1"
SLOT="0"

DEPEND="
	gui-libs/gtk-layer-shell[introspection,vala]
	gui-libs/gtk4-layer-shell[introspection,vala]
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-libs/gobject-introspection
	dev-libs/wayland-protocols
	dev-build/meson
	gui-libs/astal-io
"

src_configure() {
	vala_setup
	S="${S}/lib/astal/gtk3" meson_src_configure
	S="${S}/lib/astal/gtk4" meson_src_configure
}

src_compile() {
	S="${S}/lib/astal/gtk3" meson_src_compile
	S="${S}/lib/astal/gtk4" meson_src_compile
}

src_install() {
	S="${S}/lib/astal/gtk3" meson_src_install
	S="${S}/lib/astal/gtk4" meson_src_install
}
