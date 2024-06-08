EAPI=8
inherit git-r3

DESCRIPTION="Image previews for lf file manager"
HOMEPAGE="https://github.com/NikitaIvanovV/ctpv"
EGIT_REPO_URI="https://github.com/NikitaIvanovV/ctpv"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="media-gfx/imagemagick
         app-misc/lf
         dev-libs/openssl"

src_install() {
    emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install
}

pkg_postinst() {
    elog "Check homepage for optional programs to allow greater file preview support."
}
