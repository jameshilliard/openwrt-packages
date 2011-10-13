#
# Copyright (C) 2009-2010 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@sharism.cc>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=scim
PKG_VERSION:=1.4.7

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/scim
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/scim
    TITLE:=Smart Common Input Method
    SECTION:=utils
    CATEGORY:=Utilities
    URL:=http://www.scim-im.org/
    DEPENDS:=+libintl +libiconv @BROKEN
# ERROR: checking for /usr/share/sgml/docbook/xsl-stylesheets/html/tldp-html.xsl... configure: error: cannot check for file existence when cross compiling
endef

define Package/scim/description
    Smart Common Input Method
endef

define Package/scim/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/scim $(1)/usr/bin/
endef

$(eval $(call BuildPackage,scim))
