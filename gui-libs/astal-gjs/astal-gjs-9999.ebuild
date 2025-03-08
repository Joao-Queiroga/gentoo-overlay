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
	dev-libs/gjs
	gui-libs/astal-io
	gui-libs/astal
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-build/meson
"

S="${S}/lang/gjs"
