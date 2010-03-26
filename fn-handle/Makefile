#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fn-handle
PKG_VERSION:=20100316
PKG_REV:=acacde7b404a544d214f4ee01231bf0193a7155d
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/fn-handle.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/fn-handle
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Ben NanoNote PowerOff Daemon
  URL:=http://projects.qi-hardware.com/index.php/f/fn-handle/
endef

define Build/Configure
endef

define Package/fn-handle/install
	$(INSTALL_DIR) \
		$(1)/etc/init.d \
		$(1)/usr/bin

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/fnkeys \
		$(1)/usr/bin/

	$(INSTALL_BIN) \
		./files/$(PKG_NAME).init \
		$(1)/etc/init.d/$(PKG_NAME)
endef

$(eval $(call BuildPackage,fn-handle))
