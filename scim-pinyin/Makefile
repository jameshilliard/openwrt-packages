#
# Copyright (C) 2009-2010 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@sharism.cc>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=scim-pinyin
PKG_VERSION:=0.5.91

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/scim-pinyin
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/scim-pinyin
    TITLE:=Smart Common Input Method_Chinese PinYin
    SECTION:=utils
    CATEGORY:=Utilities
    URL:=http://www.scim-im.org/projects/imengines
    DEPENDS:=+libintl +libiconv +scim
# ERROR: scim is broken
endef

define Package/scim-pinyin/description
    Smart Common Input Method, PinYin
endef

define Package/scim-pinyin/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/scim-pinyin $(1)/usr/bin/
endef

$(eval $(call BuildPackage,scim-pinyin))
