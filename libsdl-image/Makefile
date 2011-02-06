#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsdl-image
PKG_VERSION:=1.2.10
PKG_RELEASE:=1

PKG_SOURCE:=SDL_image-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.libsdl.org/projects/SDL_image/release/
PKG_MD5SUM:=6c06584b31559e2b59f2b982d0d1f628
PKG_BUILD_DIR:=$(BUILD_DIR)/SDL_image-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/libsdl-image
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Simple DirectMedia Layer Image
  URL:=http://www.libsdl.org/projects/SDL_image/
  DEPENDS:=+libsdl
endef

define Package/libsdl-image/description
  SDL_image is an image loading library that is used with the SDL library, and almost as portable. It allows a programmer to use multiple image formats without having to code all the loading and conversion algorithms themselves.
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/SDL

CONFIGURE_ARGS += \
	--with-sdl-exec-prefix=$(STAGING_DIR)

CONFIGURE_VARS += \
	LIBS="-lSDL -ldirect -ldirectfb -lfusion"

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/SDL $(1)/usr/lib/pkgconfig
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/SDL/SDL_image.h \
		$(1)/usr/include/SDL/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libSDL_image*.{a,so*} \
		$(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libsdl-image/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libSDL_image*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsdl-image))
