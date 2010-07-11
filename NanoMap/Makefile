#
# Copyright (C) 2010 Sharism.cc
# Author: Xiangfu Liu <xiangfu@sharism.cc>
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=NanoMap
PKG_VERSION:=0.3
PKG_REV:=012268a764a05e3b7226a248dd81b247713d6f2f
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/nanomap.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/NanoMap
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Qt4-based map viewer
	DEPENDS:=@BROKEN +qt4 +qt4-gui +qt4-network
	URL:=http://projects.qi-hardware.com/index.php/p/nanomap/
endef


MAKE_VARS += TARGETPATH=$(STAGING_DIR)

define Build/Configure
	$(STAGING_DIR)/usr/bin/qmake -spec $(STAGING_DIR)/usr/share/mkspecs/qws/linux-openwrt-g++ -o $(PKG_BUILD_DIR)/Makefile $(PKG_BUILD_DIR)/nanomap.pro
endef

define Package/NanoMap/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/NanoMap $(1)/usr/bin/
endef

$(eval $(call BuildPackage,NanoMap))
