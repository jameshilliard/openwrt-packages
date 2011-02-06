# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsdl-ttf
PKG_VERSION:=2.0.9
PKG_RELEASE:=2

PKG_SOURCE:=SDL_ttf-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.libsdl.org/projects/SDL_ttf/release/
PKG_MD5SUM:=6dd5a85e4924689a35a5fb1cb3336156
PKG_BUILD_DIR:=$(BUILD_DIR)/SDL_ttf-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/libsdl-ttf
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Simple DirectMedia Layer True Font
  URL:=http://www.libsdl.org/projects/SDL_ttf/
  DEPENDS:=+libsdl $(ICONV_DEPENDS) $(INTL_DEPENDS)
endef

define Package/libsdl-ttf/description
  SDL_ttf is a TrueType font rendering library that is used with the SDL library, and almost as portable. It depends on freetype2 to handle the TrueType font data. It allows a programmer to use multiple TrueType fonts without having to code a font rendering routine themselves. With the power of outline fonts and antialiasing, high quality text output can be obtained without much effort.
endef

PKG_FIXUP:=libtool

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/SDL

CONFIGURE_ARGS += \
       --with-sdl-exec-prefix=$(STAGING_DIR) \
       --without-x \
       LIBS="-lSDL -liconv"

TARGET_LDFLAGS+= \
       -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include/SDL \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/SDL/SDL_ttf.h \
		$(1)/usr/include/SDL/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libSDL_ttf*.{a,so*} \
		$(1)/usr/lib/
endef

define Package/libsdl-ttf/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libSDL_ttf*.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsdl-ttf))
