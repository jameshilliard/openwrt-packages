# 
# OpenWrt
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=MPlayer
PKG_VERSION:=1.0rc3
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.mplayerhq.hu/MPlayer/releases/
PKG_MD5SUM:=0191ddb9c21620779838e53a4cca5ac1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/MPlayer
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=MPlayer, the movie player
  URL:=http://www.mplayerhq.hu
  DEPENDS:=+libjpeg +libpng +directfb +zlib +libsdl +libfreetype +fontconfig $(ICONV_DEPENDS) +BUILD_PATENTED:libmad +libaa +giflib +fribidi +libtheora
endef

define Package/MPlayer/description
  MPlayer is a movie player which runs on many systems.
endef

CONFIGURE_ARGS := --target=mips \
		  --disable-mencoder \
		  --disable-pthreads \
		  --enable-cross-compile \
		  --prefix=/usr \
		  --with-sdl-config=$(STAGING_DIR)/usr/bin/sdl-config \
		  --with-freetype-config=$(STAGING_DIR)/host/bin/freetype-config \
		  --enable-rpath \
		  --extra-cflags="-I$(STAGING_DIR)/usr/include/directfb \
		  $(ICONV_CPPFLAGS)" \
		  --extra-ldflags="$(ICONV_LDFLAGS)" \
		  --host-cc=gcc \
		  --enable-fbdev \
		  --confdir=/usr/share/mplayer \
		  --enable-menu \
		  --$(if $(CONFIG_BUILD_PATENTED),enable-mad,disable-mad) \
		  --$(if $(CONFIG_BUILD_PATENTED),enable-mp3lib,disable-mp3lib) \
		  --disable-x11 \
		  --disable-xv \
		  --disable-vm \
		  --disable-vdpau \
		  --disable-gl \
		  --disable-xf86keysym \
		  --enable-vidix \
		  --disable-vidix-pcidb \
		  --with-vidix-drivers="no"

# todo: remove once building correctly
MAKE_FLAGS = -j4

define Package/MPlayer/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/share/mplayer

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/mplayer \
		$(1)/usr/bin/mplayer
	$(INSTALL_DATA) \
		$(FILES_DIR)/input.conf \
		$(1)/usr/share/mplayer

endef

$(eval $(call BuildPackage,MPlayer))
