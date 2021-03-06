TERMUX_PKG_HOMEPAGE=https://lloyd.github.io/yajl/
TERMUX_PKG_DESCRIPTION="Yet Another JSON Library"
TERMUX_PKG_LICENSE="ISC"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=2.1.0
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL=https://github.com/lloyd/yajl/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=3fb73364a5a30efe615046d07e6db9d09fd2b41c763c5f7d3bfb121cd5c5ac5a

termux_step_pre_configure() {
	termux_setup_cmake
	rm -f ./configure
}

termux_step_post_make_install() {
	# fix location of yajl.pc
	if [ -f "${TERMUX_PREFIX}/share/pkgconfig/yajl.pc" ]; then
		mkdir -p "${TERMUX_PREFIX}/lib/pkgconfig" || exit 1
		mv -f "${TERMUX_PREFIX}/share/pkgconfig/yajl.pc" "${TERMUX_PREFIX}/lib/pkgconfig/yajl.pc" || exit 1
	fi
}
