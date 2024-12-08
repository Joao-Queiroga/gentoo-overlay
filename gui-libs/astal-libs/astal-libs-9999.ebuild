EAPI=8
inherit git-r3 meson

DESCRIPTION="Libraries for astal"
HOMEPAGE="https://aylur.github.io/astal"
EGIT_REPO_URI="https://github.com/Aylur/astal"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE="+apps auth +battery +bluetooth cava greet +hyprland mpris network +notifd +powerprofiles +river +tray +wireplumber"

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

USE_FLAGS=(apps auth battery bluetooth cava greet hyprland mpris network notifd powerprofiles river tray wireplumber)

src_configure() {
	for lib in "${USE_FLAGS[@]}"; do
		if use "${lib}"; then
			einfo "Configurando biblioteca ${lib}..."
			pushd "${S}/lib/${lib}" > /dev/null || die
			meson setup --prefix=/usr build || die "Falha ao configurar ${lib}"
			popd > /dev/null
		fi
	done
}

src_compile() {
	for lib in "${USE_FLAGS[@]}"; do
		if use "${lib}"; then
			einfo "Compilando biblioteca ${lib}..."
			pushd "${S}/lib/${lib}/build" > /dev/null || die
			meson compile || die "Falha ao compilar ${lib}"
			popd > /dev/null
		fi
	done
}

src_test() {
	:
}

src_install() {
	for lib in "${USE_FLAGS[@]}"; do
		if use "${lib}"; then
			einfo "Instalando biblioteca ${lib}..."
			pushd "${S}/lib/${lib}/build" > /dev/null || die
			meson_install || die "Falha ao instalar ${lib}"
			popd > /dev/null
		fi
	done
}
