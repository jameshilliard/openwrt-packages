#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lynx
PKG_VERSION:=2.8.7rel.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://lynx.isc.org/current

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)2-8-7

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/lynx
    TITLE:=lynx
    SECTION:=network
    CATEGORY:=Network
    DEPENDS:=+libncurses +zlib
    URL:=http://lynx.isc.org
endef

define Package/lynx/description
    text console browser
endef

CONFIGURE_ARGS += --with-zlib

define Package/lynx/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/etc
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/lynx $(1)/usr/bin/
	$(INSTALL_DATA) ./files/etc/lynx.cfg $(1)/etc/
	$(INSTALL_DATA) ./files/etc/lynx.lss $(1)/etc/
endef

$(eval $(call BuildPackage,lynx))
