EAPI=8
inherit git-r3 meson

DESCRIPTION="gjs bindings for libstal"
HOMEPAGE="https://aylur.github.io/astal"
EGIT_REPO_URI="https://github.com/Aylur/astal"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	gui-libs/gtk-layer-shell[introspection,vala]
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lang/vala[valadoc]
	dev-libs/gobject-introspection
	dev-libs/wayland-protocols
	dev-build/meson
	gui-libs/astal-io
	gui-libs/astal
"

src_configure() {
	pushd "${S}/lang/gjs" > /dev/null || die
	meson setup --prefix=/usr build || die "Falha ao configurar"
	popd > /dev/null
}

src_compile() {
	pushd "${S}/lang/gjs" > /dev/null || die
	meson compile -C build || die "Falha ao compilar"
	popd > /dev/null
}

src_test() {
	:
}

src_install() {
	pushd "${S}/lang/gjs" > /dev/null || die
	meson_install -C build || die "Falha ao instalar"
	popd > /dev/null
}
