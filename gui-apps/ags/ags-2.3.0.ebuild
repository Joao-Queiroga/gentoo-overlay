# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

EGO_SUM=(
	"github.com/cpuguy83/go-md2man/v2 v2.0.4/go.mod"
	"github.com/evanw/esbuild v0.24.0"
	"github.com/evanw/esbuild v0.24.0/go.mod"
	"github.com/inconshreveable/mousetrap v1.1.0"
	"github.com/inconshreveable/mousetrap v1.1.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.1.0/go.mod"
	"github.com/spf13/cobra v1.8.1"
	"github.com/spf13/cobra v1.8.1/go.mod"
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/titanous/json5 v1.0.0"
	"github.com/titanous/json5 v1.0.0/go.mod"
	"golang.org/x/sys v0.0.0-20220715151400-c0bba94af5f8"
	"golang.org/x/sys v0.0.0-20220715151400-c0bba94af5f8/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
)

go-module_set_globals

DESCRIPTION="A customizable and extensible shell"
HOMEPAGE="https://github.com/Aylur/ags"
SRC_URI="
	https://github.com/Aylur/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}
	"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-libs/astal
	gui-libs/astal-libs
	gui-libs/astal-gjs
	net-libs/nodejs[npm]
	dev-util/dart-sass
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
    ego build -ldflags "\
    -X 'main.gtk4LayerShell=$(pkg-config --variable=libdir gtk4-layer-shell-0)/libgtk4-layer-shell.so' \
    -X 'main.astalGjs=$(pkg-config --variable=srcdir astal-gjs)'"
}

src_install() {
	dobin ${S}/ags

	default
}
