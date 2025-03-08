EAPI=8

VALA_USE_DEPEND="valadoc"
inherit git-r3 meson vala

DESCRIPTION="Libraries for astal"
HOMEPAGE="https://aylur.github.io/astal"
EGIT_REPO_URI="https://github.com/Aylur/astal"

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="+apps auth +battery +bluetooth cava greet +hyprland mpris network +notifd +powerprofiles +river +tray +wireplumber"

DEPEND="
	gui-libs/gtk-layer-shell[introspection]
	tray? ( dev-libs/libayatana-appindicator )
"
RDEPEND="${DEPEND}"
BDEPEND="
	tray? ( gui-libs/appmenu-glib-translator )
	dev-libs/gobject-introspection
	dev-libs/wayland-protocols
	dev-build/meson
"

USE_FLAGS=(apps auth battery bluetooth cava greet hyprland mpris network notifd powerprofiles river tray wireplumber)

src_configure() {
	vala_setup
	for lib in "${USE_FLAGS[@]}"; do
		if use "${lib}"; then
			einfo "Configurando biblioteca ${lib}..."
			S="${S}/lib/${lib}" meson_src_configure
		fi
	done
}

src_compile() {
	for lib in "${USE_FLAGS[@]}"; do
		if use "${lib}"; then
			S="${S}/lib/${lib}" meson_src_compile
		fi
	done
}

src_install() {
	for lib in "${USE_FLAGS[@]}"; do
		if use "${lib}"; then
			einfo "Instalando biblioteca ${lib}..."
			S="${S}/lib/${lib}" meson_install
		fi
	done
}
