# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Proposed standard for launching desktop apps with Terminal=true"
HOMEPAGE="https://gitlab.freedesktop.org/Vladimir-csp/xdg-terminal-exec"
SRC_URI="https://gitlab.freedesktop.org/Vladimir-csp/xdg-terminal-exec/-/archive/v${PV}/xdg-terminal-exec-v${PV}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-build/make test? ( dev-util/bats )"

S="${WORKDIR}/xdg-terminal-exec-v${PV}"

src_compile() {
    emake
}

src_test() {
    use test && bats test/
}

src_install() {
    exeinto /usr/bin
    doexe xdg-terminal-exec
    doman xdg-terminal-exec.1.gz
}

