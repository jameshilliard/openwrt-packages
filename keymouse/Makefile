# Copyright (C) 2010 tuxbrain.com
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=keymouse
PKG_VERSION:=1.0-git
PKG_RELEASE:=1
PKG_REV:=c60552422fad13dc9c4064d8ea7e5e5ecc58be4a

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=https://github.com/nopper/keymouse.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DEPENDS:=libX11

include $(INCLUDE_DIR)/package.mk

define Package/keymouse
	TITLE:=Just a simple mouse emulator
	SECTION:=utils
	CATEGORY:=Utilities
	URL:=http://keymouse.berlios.de
	DEPENDS:=+libstdcpp
endef
PKG_BUILD_DIR:=$(BUILD_DIR)/keymouse-$(PKG_VERSION)

define Package/keymouse/description
	Just a simple mouse emulator (for Linux) that can be controlled with keyboard. Useful on laptop with broken touch pad or in absence of external mouse device.Requires uinput kernel module
endef

define Build/Configure
	(cd "$(PKG_BUILD_DIR)"; ./autogen.sh );
	$(call Build/Configure/Default)

endef
define Package/keymouse/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/etc $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/keymouse $(1)/usr/bin/
	$(INSTALL_DATA) $(FILES_DIR)/keymouse.cfg $(1)/etc/
	$(INSTALL_BIN) $(FILES_DIR)/keymouse.init $(1)/etc/init.d/keymouse
endef

$(eval $(call BuildPackage,keymouse))
