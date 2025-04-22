EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit git-r3 lua

DESCRIPTION="lua bindings for libstal"
HOMEPAGE="https://aylur.github.io/astal"
EGIT_REPO_URI="https://github.com/Aylur/astal"
REQUIRED_USE="${LUA_REQUIRED_USE}"

LICENSE="LGPL-2.1"
SLOT="0"

DEPEND="
	gui-libs/gtk-layer-shell[introspection,vala]
	gui-libs/astal-io
	gui-libs/astal
	>=dev-lua/lgi-0.9.2
"

RDEPEND="${DEPEND}"

S="${S}/lang/lua"

src_prepare() {
	default
	lua_copy_sources
}

lua_src_install() {
	local luaver=$(lua_get_version)
	[[ "${luaver}" == "luajit" ]] && luaver="5.1"
	luaver=${luaver%.*}

	insinto "/usr/share/lua/${luaver}/"
	doins -r "${BUILD_DIR}/astal"
}

src_install() {
	lua_foreach_impl lua_src_install
}
