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

src_prepare() {
	default
	vala_setup
}

src_configure() {
	einfo "Configurando gtk3 ..."
	pushd "${S}/lib/astal/gtk3" > /dev/null || die
	meson setup --prefix=/usr build || die "Falha ao configurar ${lib}"
	popd > /dev/null
	einfo "Configurando gtk4 ..."
	pushd "${S}/lib/astal/gtk4" > /dev/null || die
	meson setup --prefix=/usr build || die "Falha ao configurar ${lib}"
	popd > /dev/null
}

src_compile() {
	einfo "Compilando gtk3 ..."
	pushd "${S}/lib/astal/gtk3" > /dev/null || die
	meson compile -C build || die "Falha ao compilar gtk3"
	popd > /dev/null
	einfo "Compilando gtk4 ..."
	pushd "${S}/lib/astal/gtk4" > /dev/null || die
	meson compile -C build || die "Falha ao compilar gtk3"
	popd > /dev/null
}

src_install() {
	pushd "${S}/lib/astal/gtk3" > /dev/null || die
	meson_install -C build || die "Falha ao instalar"
	popd > /dev/null
	pushd "${S}/lib/astal/gtk4" > /dev/null || die
	meson_install -C build || die "Falha ao instalar"
	popd > /dev/null
}
