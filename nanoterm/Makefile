#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@sharism.cc>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nanoterm
PKG_VERSION:=0.2
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://downloads.sourceforge.net/project/nterm/nanoterm/0.2/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/nanoterm
    SECTION:=utils
    CATEGORY:=Utilities
    SUBMENU:=Terminal
    TITLE:=terminal emulator
    URL:=http://nterm.sourceforge.net/
endef

define Package/nanoterm/description
    Nanoterm is a terminal emulator with i minimal font for the Linux framebuffer
endef

define Package/nanoterm/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/nanoterm \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,nanoterm))