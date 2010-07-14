#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mlterm
PKG_VERSION:=2.9.4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://cdnetworks-kr-2.dl.sourceforge.net/project/mlterm/01%20release/mlterm-2.9.4/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/mlterm
    TITLE:=mlterm
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=@BROKEN
    URL:=http://mlterm.sourceforge.net/
endef

define Package/mlterm/description
    Mlterm is a multilingual terminal emulator on X11
endef

TARGET_CFLAGS+=
TARGET_LDFLAGS+=

CONFIGURE_ARGS += 

define Package/mlterm/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mlterm $(1)/usr/bin/
endef

$(eval $(call BuildPackage,mlterm))
