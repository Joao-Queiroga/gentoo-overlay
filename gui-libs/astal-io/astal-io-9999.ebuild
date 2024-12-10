EAPI=8
inherit git-r3 meson

DESCRIPTION="IO library for astal"
HOMEPAGE="https://aylur.github.io/astal"
EGIT_REPO_URI="https://github.com/Aylur/astal"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	gui-libs/gtk-layer-shell[introspection]
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lang/vala[valadoc]
	dev-libs/gobject-introspection
	dev-libs/wayland-protocols
	dev-build/meson
"

src_configure() {
	pushd "${S}/lib/astal/io" > /dev/null || die
	meson setup --prefix=/usr build || die "Falha ao configurar"
	popd > /dev/null
}

src_compile() {
	pushd "${S}/lib/astal/io/build" > /dev/null || die
	meson compile || die "Falha ao compilar"
	popd > /dev/null
}

src_test() {
	:
}

src_install() {
	pushd "${S}/lib/astal/io/build" > /dev/null || die
	meson_install || die "Falha ao instalar"
	popd > /dev/null
}
