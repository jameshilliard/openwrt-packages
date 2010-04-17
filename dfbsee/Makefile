# 
# Copyright (c) 2010 wejp
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dfbsee
PKG_VERSION:=0.7.4
PKG_RELEASE:=1

PKG_SOURCE:=DFBSee-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.directfb.org/download/DFBSee/
PKG_MD5SUM:=3320a976457d3b3e9eaef530fdf56b37
PKG_BUILD_DIR:=$(BUILD_DIR)/DFBSee-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/dfbsee
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=directfb media player
  URL:=
  MENU:=1
  DEPENDS:=@BROKEN
endef

define Package/dfbsee/description
  A popular music player for various handheld devices.
  It supports various file formats and comes with a
  file browser and a playlist editor/viewer.
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include

define Build/Compile
	-$(MAKE) -C $(PKG_BUILD_DIR) distclean
	(cd $(PKG_BUILD_DIR); \
	./configure \
	);
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		volume-tables-gen

	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		volume-tables.header

	$(MAKE) -C $(PKG_BUILD_DIR) distclean

	$(call Build/Configure/Default, \
	);
	
	$(MAKE) -C $(PKG_BUILD_DIR)/src/gfx \
		$(MAKE_OPTS) \
		gfx.h

	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		dfbsee
endef

define Package/dfbsee/install
	$(INSTALL_DIR) \
		$(1)/usr/share/DFBSee \
		$(1)/usr/bin \
  
	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/src/dfbsee \
		$(1)/usr/bin/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/data/decker.ttf \
		$(1)/usr/share/DFBSee/
endef

$(eval $(call BuildPackage,dfbsee))
