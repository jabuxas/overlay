# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake meson desktop xdg

DESCRIPTION="An offline build planner for Path of Exile using PoBFrontend, LocalIdentity's fork"
HOMEPAGE="https://github.com/PathOfBuildingCommunity/PathOfBuilding"
SRC_URI="
         https://github.com/PathOfBuildingCommunity/PathOfBuilding/archive/refs/tags/v"${PV}".tar.gz -> ${P}.tar.gz
		     https://gitlab.com/bcareil/pobfrontend/-/archive/master/pobfrontend-master.tar.gz
		     https://github.com/Lua-cURL/Lua-cURLv3/archive/refs/tags/v0.3.13.tar.gz
"
S=${WORKDIR}/pobfrontend-master
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
        ${DEPEND}
        dev-lang/luajit
        media-libs/libglvnd
        media-fonts/ttf-bitstream-vera
        media-fonts/liberation-fonts
        >=dev-qt/qtcore-5.15.7
        net-misc/curl
        dev-qt/qtgui
"
BDEPEND="
        dev-util/meson
        app-arch/unzip
        dev-util/ninja
"

src_prepare() {
  default

  cd "${WORKDIR}"/Lua-cURLv3-0.3.13 || die
  eapply "${FILESDIR}"/luacurl-luajit.patch

  cd "${WORKDIR}"/pobfrontend-master || die
  eapply "${FILESDIR}"/pob-luajit.patch

  cd "${WORKDIR}"/PathOfBuilding-"${PV}" || die
  eapply "${FILESDIR}"/disable-devmode.patch
}

src_configure () {
  meson_src_configure
}

src_compile () {
  meson_src_compile || die "failed to build pobfrontend"

  cd "${WORKDIR}"/Lua-cURLv3-0.3.13 || die
  emake || die "failed to build lcurl.so"
}

src_install () {
  cd "${WORKDIR}"
  unzip "${WORKDIR}"/PathOfBuilding-"${PV}"/runtime-win32.zip lua/xml.lua lua/base64.lua lua/sha1.lua || die
  # dodir /opt/"${PN}"
  # mv "${WORKDIR}"/PathOfBuilding-"${PV}"/* "${D}"
  # mv "${WORKDIR}"/"${P}"-build/pobfrontend "${D}" || die
  # mv "${WORKDIR}"/Lua-cURLv3-0.3.13/lcurl.so "${D}" || die
  # mv "${S}"/lua "${D}" || die

  cd "${WORKDIR}"/PathOfBuilding-"${PV}"
  insinto "/opt/${PN}"
  doins -r *
  insopts -m755
  doins "${WORKDIR}"/"${P}"-build/pobfrontend
  doins "${WORKDIR}"/Lua-cURLv3-0.3.13/lcurl.so
  doins -r "${WORKDIR}"/lua || die

  dobin "${FILESDIR}"/PathOfBuilding || die
  domenu "${FILESDIR}"/PathOfBuildingCommunity.desktop
  doicon "${FILESDIR}"/PathOfBuilding-logo.png "${FILESDIR}"/PathOfBuilding-logo.svg || die
}

pkg_postinst() {
  xdg_pkg_postinst
}
pkg_postrm() {
  xdg_pkg_postrm
}
