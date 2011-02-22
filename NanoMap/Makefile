#
# Copyright (C) 2010 Sharism.cc
# Author: Xiangfu Liu <xiangfu@sharism.cc>
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=NanoMap
PKG_VERSION:=0.3.1
PKG_REV:=88239a2debeb5b068a6922c8251fcf08a2f755c8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/nanomap.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk
$(call include_mk,qmake.mk)

define Package/NanoMap/Default
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Qt4-based map viewer
	URL:=http://projects.qi-hardware.com/index.php/p/nanomap/
endef

define Package/NanoMap
	$(call Package/NanoMap/Default)
	DEPENDS:=+qt4 +qt4-gui +qt4-network +dejavu-fonts-ttf
endef

define Package/NanoMap-maps
	$(call Package/NanoMap/Default)
	TITLE+=(Sample Maps)
	DEPENDS:=+NanoMap
endef

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/Configure
	$(call Build/Configure/Qmake,nanomap)
endef

define Package/NanoMap/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib/monav
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/NanoMap $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/monav/*.so $(1)/usr/lib/monav
endef

define Package/NanoMap-maps/install
	$(INSTALL_DIR) $(1)/root
	$(CP) ./files/Maps/ $(1)/root/
endef

$(eval $(call BuildPackage,NanoMap))
$(eval $(call BuildPackage,NanoMap-maps))
