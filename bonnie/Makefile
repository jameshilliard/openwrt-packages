# 
# Copyright (C) Xiangfu Liu <xiangfu@sharism.cc>
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bonnie
PKG_VERSION:=1.4
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.garloff.de/kurt/linux/bonnie/
PKG_RELEASE:=1
PKG_INSTALL:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/bonnie
  TITLE:=Bonnie
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://www.garloff.de/kurt/linux/bonnie/
endef

define Package/bonnie/description
Bonnie is a simple but useful tool to determine the speed of your filesystem,
your OS caching, the underlying device and your libc
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/Install
endef

define Package/bonnie/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/Bonnie $(1)/usr/bin/$(PKG_NAME)
endef

$(eval $(call BuildPackage,bonnie))

# The following comments configure the Bonnie editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/openwrt-xburst.full_system package/bonnie/{clean,compile} V=99"
# End:
