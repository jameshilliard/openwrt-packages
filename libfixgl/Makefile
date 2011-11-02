#
# Copyright (C) Xiangfu Liu <xiangfu@sharism.cc>
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libfixgl
PKG_REV:=17
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://libfixgl.svn.sourceforge.net/svnroot/libfixgl
PKG_BUILD_DIR=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

define Package/libfixgl
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Libfixgl
	URL:=http://code.google.com/p/libfixgl/
	DEPENDS:=+libsdl +libpng
endef

define Package/libfixgl/description
libfixgl, is an implementation of the OpenGL standard for realtime 3D graphics, based on fixed point arithmetic.
endef

define Build/Compile
	$(call Build/Compile/Default)
	(cd $(PKG_BUILD_DIR)/example/lord/; \
	 make CC="$(TARGET_CC)" \
	      CFLAGS="\
		$(TARGET_CFLAGS) \
		-std=gnu89 -pedantic -Wall \
		-I../../src \
		`$(SDL_CONFIG) --cflags` \
		-I$(STAGING_DIR)/usr/include \
		-I$(STAGING_DIR)/usr/include/SDL" \
	     LDFLAGS="$(TARGET_LDFLAGS) \
		`$(SDL_CONFIG) --libs` \
		-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
		-L$(STAGING_DIR)/usr/lib/SDL \
		-lm -lpng -lz -lpthread -lSDL -ldirectfb -lfusion")
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/libfixgl/include
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/libGL.a $(1)/usr/lib/libfixgl/
	$(CP) $(PKG_BUILD_DIR)/src/*.h $(1)/usr/lib/libfixgl/include
endef

define Package/libfixgl/install
	$(INSTALL_DIR)  $(1)/usr/lib/libfixgl
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/libGL.a $(1)/usr/lib/libfixgl/
	$(INSTALL_BIN)  $(PKG_BUILD_DIR)/example/lord/example $(1)/usr/lib/libfixgl/
endef

$(eval $(call BuildPackage,libfixgl))
