# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsdl-gfx
PKG_VERSION:=2.0.20
PKG_RELEASE:=1

PKG_SOURCE:=SDL_gfx-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.ferzkopp.net/Software/SDL_gfx-2.0/
PKG_MD5SUM:=8a787e538a8e4d80d4927535be5af083
PKG_BUILD_DIR:=$(BUILD_DIR)/SDL_gfx-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/libsdl-gfx
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Simple DirectMedia Layer Gfx
  URL:=https://sourceforge.net/projects/sdlgfx/
  DEPENDS:=+libsdl
endef

define Package/libsdl-gfx/description
  The SDL_gfx library evolved out of the SDL_gfxPrimitives code which provided basic drawing routines such as lines, circles or polygons and SDL_rotozoom which implemented a interpolating rotozoomer for SDL surfaces.
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/SDL

CONFIGURE_VARS += \
	LIBS="-lSDL -ldirect -ldirectfb -lfusion"

define Build/Configure
    $(call Build/Configure/Default, \
      --disable-mmx \
      --with-sdl-exec-prefix=$(STAGING_DIR)\
    )
endef 

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include/SDL \
		$(1)/usr/lib \
		$(1)/usr/lib/pkgconfig

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/SDL/* \
		$(1)/usr/include/SDL/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{a,so*} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig
endef

define Package/libsdl-gfx/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libSDL_gfx*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsdl-gfx))
