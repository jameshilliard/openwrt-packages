#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ben-poweroff
PKG_VERSION:=20091221
PKG_REV:=f4476cedc2aef66ee5734a3eeeb0828d97dfbf39
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/fn-handle.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/ben-poweroff
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Ben-Poweroff
  URL:=http://projects.qi-hardware.com/index.php/p/ben-poweroff/
  DEPENDS:=
endef

define Package/ben-poweroff/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/rc.d
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/ben-poweroff \
		$(1)/usr/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/etc/init.d/poweroff-daemon \
		$(1)/etc/init.d/
	(cd $(1)/etc/rc.d/; \
	 ln -sf \
	 ../init.d/poweroff-daemon \
	 $(1)/etc/rc.d/S50poweroff-daemon)
endef

$(eval $(call BuildPackage,ben-poweroff))
