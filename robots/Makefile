#
# Copyright (C) 2010 emdete.de
#
# This is free software, licensed under the GNU General Public License
# v3. See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=robots
PKG_VERSION:=6.6.6
PKG_RELEASE:=6

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pyneo.org/t
PKG_MD5SUM:=bbc3134ec29c15fac7e39793046ba6ab
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/robots
  SECTION:=utilites
  CATEGORY:=Utilities
  TITLE:=An robots application
  URL:=http://pyneo.org/t/robots
  DEPENDS:=+libncurses
endef

define Package/robots/description
  A robots application
endef

define Package/robots/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/games/lib
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/games/robots \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,robots))
