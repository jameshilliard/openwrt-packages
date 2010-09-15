#
# Copyright (C) 2010 qi-hardware.com
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=makfa
PKG_VERSION:=20091212
PKG_REV:=e6c80dc33aa94358e767d34cbb5c1e003485db62
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://github.com/lojban/makfa-cli
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/makfa
  SECTION:=education
  CATEGORY:=Education
  TITLE:=Lojban Dictionary
  URL:=http://gittub.com/lojban/makfa-cli
endef

define Build/Configure
endef

# Since the Ben NanoNote does not have internet access, build the dictionary
# on the host machine and copy it into the package.
#
define Build/Compile
	$(PYTHON) $(PKG_BUILD_DIR)/makfa update en $(PKG_BUILD_DIR)/makfa.dump
endef

define Package/makfa/install
	$(INSTALL_DIR) \
		$(1)/usr/share/$(PKG_NAME) \
		$(1)/usr/bin

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/makfa \
		$(1)/usr/bin/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/makfa.dump \
		$(1)/usr/share/$(PKG_NAME)/
endef

$(eval $(call BuildPackage,makfa))
