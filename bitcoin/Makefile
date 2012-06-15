#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=bitcoin
PKG_VERSION:=0.6.2
PKG_RELEASE:=1

PKG_REV:=790fe2e558d93572f87b7f4117a54d899903c5bf
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/gmenu2x.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/bitcoin
    TITLE:=bitcoin
    SUBMENU:=Web
    SECTION:=network
    CATEGORY:=Network
    URL:=http://bitcoin.sourceforge.net/
    DEPENDS:=
endef

define Package/bitcoin/description
    Bitcoin is an experimental new digital currency that enables instant payments to anyone, anywhere in the world.
endef

CONFIGURE_ARGS += 
TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/Configure
	$(call Build/Configure/Default)
endef

define Package/bitcoin/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib/bitcoin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bitcoin $(1)/usr/bin/
endef

$(eval $(call BuildPackage,bitcoin))
