# 
# OpenWrt
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=MPlayer
PKG_VERSION:=1.0rc3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.mplayerhq.hu/MPlayer/releases/
PKG_MD5SUM:=0191ddb9c21620779838e53a4cca5ac1

include $(INCLUDE_DIR)/package.mk

define Package/MPlayer
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=MPlayer, the movie player
  URL:=http://www.mplayerhq.hu
  DEPENDS:=+libjpeg +libpng +directfb +zlib +libsdl +libmad @BUILD_PATENTED
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
		  --enable-rpath \
		  --extra-cflags=-I$(STAGING_DIR)/usr/include/directfb \
		  --host-cc=gcc \
		  --enable-fbdev

define Package/MPlayer/install
	$(INSTALL_DIR) \
		$(1)/usr/bin

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/mplayer \
		$(1)/usr/bin/mplayer

endef

$(eval $(call BuildPackage,MPlayer))
