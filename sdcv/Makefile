#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sdcv
PKG_VERSION:=0.4.2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=f624662b333daa5da2d3e99cef519f17

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/sdcv
    TITLE:=sdcv
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=$(ICONV_DEPENDS) $(INTL_DEPENDS) +libreadline +glib2 +libstdcpp +libncurses +PACKAGE_libncursesw:libncursesw
    URL:=http://sdcv.sourceforge.net/
endef

define Package/sdcv/description
    StarDict Command line version
endef

TARGET_LDFLAGS+=-liconv

define Package/sdcv/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/sdcv $(1)/usr/bin/
endef

$(eval $(call BuildPackage,sdcv))
