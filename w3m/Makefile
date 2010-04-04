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
PKG_SOURCE_URL:=http://nchc.dl.sourceforge.net/project/w3m/w3m/w3m-0.5.2/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/w3m
    TITLE:=w3m
    SECTION:=network
    CATEGORY:=Network
    URL:=http://w3m.sourceforge.net/
    DEPENDS:=@BROKEN
endef

define Package/w3m/description
    w3m is a text-based web browser
endef

define Package/w3m/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/w3m $(1)/usr/bin/
endef

$(eval $(call BuildPackage,w3m))
