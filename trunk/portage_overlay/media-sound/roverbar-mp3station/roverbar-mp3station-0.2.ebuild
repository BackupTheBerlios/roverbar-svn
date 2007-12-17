# Copyright 2006-2007 Lucas S. Bickel v/o Karbon
# Distributed under the terms of the GNU General Public License v3
# $Header$

DESCRIPTION="Roverbar MP3-Station is a collection of small scripts used for the Roverbar MP3-Station Project."
HOMEPAGE="http://developer.berlios.de/projects/roverbar"
SRC_URI="http://prdownload.berlios.de/roverbar/${PN}-${PV}.tbz"
LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~arm ~hppa ~x86"

src_compile() {
        econf || die "Configuration failed"
        emake || die "Compilation failed"
}

src_install() {
        make DESTDIR=${D} install || die "Installation failed"
        dodoc AUTHORS Changelog INSTALL NEWS README
}

