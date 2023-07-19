# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Wallpaper Engine backgrounds for Linux!"
HOMEPAGE="https://github.com/Almamu/linux-wallpaperengine"
EGIT_REPO_URI="https://github.com/Almamu/linux-wallpaperengine.git"

inherit git-r3 cmake

LICENSE="GNU General Public License v3.0"
SLOT="0/9999"

DEPEND="
	app-arch/lz4:=
	sys-libs/zlib:=
	media-libs/libsdl2:=[pulseaudio]
	media-video/ffmpeg[opengl]
	x11-libs/libXxf86vm:=
	x11-libs/libXrandr:=
	>=media-libs/glfw-3.0.0
	media-libs/glm:=
	media-libs/glew:=
	media-libs/freeglut:=
	media-libs/freeimage:="
RDEPEND="
	${DEPEND}
	media-video/mpv
	media-sound/pulseaudio"
BDEPEND=""

pkg_postinst() {
	elog "You will need symlink your assets folder to /usr/bin"
	elog "to get it to work. For more information, check the"
	elog "project's page on Github."
}
