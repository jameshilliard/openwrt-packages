#
# Copyright (C) 2010 emdete.de
#
# This is free software, licensed under the GNU General Public License
# v3. See /LICENSE for more information.
# 
include $(TOPDIR)/rules.mk

PKG_NAME:=bwbasic
PKG_VERSION:=master
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pyneo.org/t
PKG_MD5SUM:=8d42bb36260bfa276a1ca065bf464355
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/bwbasic
  SECTION:=utilites
  CATEGORY:=Utilities
  TITLE:=An bwbasic application
  URL:=http://pyneo.org/t/bwbasic
  DEPENDS:=@BROKEN +libncurses
endef
#DEPENDS:=+libreadline +libtermcap

define Package/bwbasic/description
A bwbasic application
endef

define Package/bwbasic/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/bwbasic \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,bwbasic))
