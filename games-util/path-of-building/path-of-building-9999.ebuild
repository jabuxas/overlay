# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake meson desktop xdg-utils git-r3

DESCRIPTION="An offline build planner for Path of Exile using PoBFrontend, LocalIdentity's fork"
HOMEPAGE="https://github.com/PathOfBuildingCommunity/PathOfBuilding"
EGIT_REPO_URI="https://github.com/PathOfBuildingCommunity/PathOfBuilding.git"
S="${WORKDIR}"/pobfrontend
LICENSE="MIT"
SLOT="0/9999"

DEPEND="dev-vcs/git"
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

src_unpack () {
  git-r3_src_unpack
  local POBFRONTEND_URI="https://gitlab.com/bcareil/pobfrontend.git"
  git clone "${POBFRONTEND_URI}"
  local LUA_CURL_URI="https://github.com/Lua-cURL/Lua-cURLv3.git"
  git clone "${LUA_CURL_URI}"
  default
}

src_prepare() {
  default 

  cd "${WORKDIR}"/Lua-cURLv3 || die 
  eapply "${FILESDIR}"/luacurl-luajit.patch

  cd "${WORKDIR}"/pobfrontend || die
  eapply "${FILESDIR}"/pob-luajit.patch

  cd "${WORKDIR}"/"${P}" || die
  eapply "${FILESDIR}"/disable-devmode.patch
}

src_configure () {
  meson_src_configure
}

src_compile () {
  meson_src_compile || die "failed to build pobfrontend"

  cd "${WORKDIR}"/Lua-cURLv3 || die
  emake || die "failed to build lcurl.so"
}

src_install () {
  cd "${WORKDIR}"
  unzip "${WORKDIR}"/"${P}"/runtime-win32.zip lua/xml.lua lua/base64.lua lua/sha1.lua || die
  # dodir /opt/"${PN}"
  # mv "${WORKDIR}"/PathOfBuilding-"${PV}"/* "${D}"
  # mv "${WORKDIR}"/"${P}"-build/pobfrontend "${D}" || die
  # mv "${WORKDIR}"/Lua-cURLv3-0.3.13/lcurl.so "${D}" || die
  # mv "${S}"/lua "${D}" || die

  cd "${WORKDIR}"/"${P}"
  insinto "/opt/${PN}"
  doins -r *
  insopts -m755
  doins "${WORKDIR}"/"${P}"-build/pobfrontend
  doins "${WORKDIR}"/Lua-cURLv3/lcurl.so
  doins -r "${WORKDIR}"/lua || die

  dobin "${FILESDIR}"/PathOfBuilding || die
  domenu "${FILESDIR}"/PathOfBuildingCommunity.desktop
  doicon "${FILESDIR}"/PathOfBuilding-logo.png "${FILESDIR}"/PathOfBuilding-logo.svg || die
}

pkg_postinst() {
	xdg_desktop_database_update
}
pkg_postrm() {
	xdg_desktop_database_update
}
