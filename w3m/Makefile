#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=w3m
PKG_VERSION:=0.5.2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=ba06992d3207666ed1bf2dcf7c72bf58

include $(INCLUDE_DIR)/package.mk

define Package/w3m
    TITLE:=w3m
    SUBMENU:=Web
    SECTION:=network
    CATEGORY:=Network
    URL:=http://w3m.sourceforge.net/
    DEPENDS:=+libopenssl +gc +libncurses
endef

define Package/w3m/description
    w3m is a text-based web browser
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) $(FILES_DIR)/functable.c $(PKG_BUILD_DIR)
	$(CP) $(FILES_DIR)/tagtable.c $(PKG_BUILD_DIR)
endef

CONFIGURE_ARGS += --with-ssl=$(STAGING_DIR)/usr \
		  --with-gc=$(STAGING_DIR)/usr/lib

CONFIGURE_VARS += ac_cv_lib_gc_GC_init=yes


define Package/w3m/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/w3m $(1)/usr/bin/
endef

$(eval $(call BuildPackage,w3m))
