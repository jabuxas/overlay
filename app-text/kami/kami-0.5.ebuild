# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.2

EAPI=8

CRATES="
	aho-corasick-0.7.18
	async-channel-1.6.1
	atty-0.2.14
	autocfg-1.1.0
	base64-0.13.0
	bitflags-1.3.2
	byteorder-1.4.3
	bytes-1.1.0
	cache-padded-1.2.0
	cassowary-0.3.0
	castaway-0.1.2
	cc-1.0.73
	cfg-if-1.0.0
	colored-2.0.0
	concurrent-queue-1.2.2
	crossbeam-utils-0.8.8
	crossterm-0.23.2
	crossterm-0.24.0
	crossterm_winapi-0.9.0
	curl-0.4.43
	curl-sys-0.4.55+curl-7.83.1
	dirs-4.0.0
	dirs-sys-0.3.7
	either-1.8.0
	encoding_rs-0.8.31
	event-listener-2.5.2
	fastrand-1.7.0
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.0.1
	futures-core-0.3.21
	futures-io-0.3.21
	futures-lite-1.12.0
	getrandom-0.2.7
	hermit-abi-0.1.19
	http-0.2.8
	idna-0.2.3
	instant-0.1.12
	isahc-1.7.2
	itoa-1.0.2
	kernel32-sys-0.2.2
	lazy_static-1.4.0
	libc-0.2.126
	libnghttp2-sys-0.1.7+1.45.0
	libz-sys-1.1.8
	lock_api-0.4.7
	log-0.4.17
	matches-0.1.9
	memchr-2.5.0
	mime-0.3.16
	mio-0.8.4
	numtoa-0.1.0
	once_cell-1.12.0
	openssl-0.10.42
	openssl-macros-0.1.0
	openssl-probe-0.1.5
	openssl-sys-0.9.74
	parking-2.0.0
	parking_lot-0.12.1
	parking_lot_core-0.9.3
	percent-encoding-2.1.0
	pin-project-1.0.10
	pin-project-internal-1.0.10
	pin-project-lite-0.2.9
	pkg-config-0.3.25
	polling-2.2.0
	proc-macro2-1.0.39
	protobuf-2.27.1
	protobuf-codegen-2.27.1
	protoc-2.27.1
	protoc-rust-2.27.1
	quote-1.0.18
	redox_syscall-0.2.13
	redox_termios-0.1.2
	redox_users-0.4.3
	regex-1.5.6
	regex-syntax-0.6.26
	remove_dir_all-0.5.3
	rust_cast-0.17.0
	ryu-1.0.11
	schannel-0.1.20
	scopeguard-1.1.0
	serde-1.0.142
	serde_derive-1.0.147
	serde_json-1.0.83
	signal-hook-0.3.14
	signal-hook-mio-0.2.3
	signal-hook-registry-1.4.0
	slab-0.4.6
	sluice-0.5.5
	smallvec-1.9.0
	socket2-0.4.4
	syn-1.0.96
	tempfile-3.3.0
	termion-1.5.6
	termsize-0.1.6
	thiserror-1.0.31
	thiserror-impl-1.0.31
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	tracing-0.1.34
	tracing-attributes-0.1.21
	tracing-core-0.1.27
	tracing-futures-0.2.5
	tui-0.18.0
	unicode-bidi-0.3.8
	unicode-ident-1.0.0
	unicode-normalization-0.1.19
	unicode-segmentation-1.9.0
	unicode-width-0.1.9
	url-2.2.2
	vcpkg-0.2.15
	waker-fn-1.1.0
	wasi-0.11.0+wasi-snapshot-preview1
	wepoll-ffi-0.1.2
	which-4.3.0
	winapi-0.2.8
	winapi-0.3.9
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.36.1
	windows_aarch64_msvc-0.36.1
	windows_i686_gnu-0.36.1
	windows_i686_msvc-0.36.1
	windows_x86_64_gnu-0.36.1
	windows_x86_64_msvc-0.36.1
"

inherit cargo xdg

DESCRIPTION="A ln scraper to read light novels and watch anime in your terminal (Written in rust)."
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/mrfluffy-dev/kami"
SRC_URI=" https://github.com/mrfluffy-dev/${PN}/archive/refs/tags/v${PV}.tar.gz
          $(cargo_crate_uris)"

RDEPEND = "
  ${DEPEND}
  sys-apps/bat
  media-video/mpv
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

src_unpack() {
  cargo_src_unpack
  default
}

src_configure () {
  cargo_src_configure
}

src_compile () {
  cargo_src_compile
}

src_install () {
  cargo_src_install
}

pkg_postinst () {
  xdg_pkg_postinst
}

pkg_postrm() {
xdg_pkg_postrm
}
