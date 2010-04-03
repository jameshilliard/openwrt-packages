#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dfbmp
PKG_VERSION:=0.1.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.maui-systems.org/oss/dfbmp

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/dfbmp
    TITLE:=dfbmp
    SECTION:=sound
    CATEGORY:=Sound
    DEPENDS:=@BROKEN +libcurl +libfreetype +zlib
    URL:=http://www.maui-systems.org/opensource/dfbmp/index.php
endef

TARGET_CFLAGS+=-lcurl -lssl -lcrypto -lz

define Package/dfbmp/description
	This code is a very simplistic DirectFB client for MPD
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default)
endef

define Package/dfbmp/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/share/dfbmp/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/dfbmp $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/share/dfbmp/decker.ttf $(1)/usr/share/dfbmp/
endef

$(eval $(call BuildPackage,dfbmp))
