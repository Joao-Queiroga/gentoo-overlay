# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit rpm autotools

MY_PN=${PN%_*}-${PN##*_}

DESCRIPTION="Epson printer driver (L456, L455, L366, L365, L362, L360, L312, L310, L222, L220, L132, L130)"
HOMEPAGE="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
SRC_URI="https://download3.ebz.epson.net/dsc/f/03/00/15/66/49/15de0a76a6f210cd3dcff8bafd80bbf2c89e2f3e/epson-inkjet-printer-201401w-1.0.1-1.src.rpm"

LICENSE="LGPL-2.1 Epson"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-text/ghostscript-gpl net-print/cups"
RDEPEND="${DEPEND}"

S="${WORKDIR}/epson-inkjet-printer-filter-1.0.2"

QA_PREBUILT="
	/opt/epson-inkjet-printer-201401w/lib64/libEpson_201401w.MT.so.1.0.1-1
	/opt/epson-inkjet-printer-201401w/lib64/libEpson_201401w.so.1.0.1-1"

src_prepare() {
	eautoreconf
	chmod +x configure
	eapply_user
}

src_configure() {
	econf LDFLAGS="$LDFLAGS -Wl,--no-as-needed" --prefix=/opt/${MY_PN}
	# if you have runtime problems:
	# add "--enable-debug" and look into /tmp/epson-inkjet-printer-filter.txt
}

src_install() {
	insinto /opt/${MY_PN}/cups/lib/filter
	doins src/epson_inkjet_printer_filter
	chmod 755 "${D}/opt/${MY_PN}/cups/lib/filter/epson_inkjet_printer_filter"

	use amd64 && X86LIB=64

	insinto /opt/${MY_PN}
	for folder in lib"${X86LIB}" resource watermark; do
		doins -r ../${MY_PN}-${PV}/$folder
	done

	insinto /usr/share/cups/model/${MY_PN}
	doins ../${MY_PN}-${PV}/ppds/*

	dodoc "AUTHORS" "COPYING" "COPYING.LIB" "COPYING.EPSON"
	dodoc ../${MY_PN}-${PV}/{Manual.txt,README}
}
