#
# Copyright (C) 2010 Sharism.cc
# Author: Xiangfu Liu <xiangfu@sharism.cc>
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=kinyin
PKG_VERSION:=0.43
PKG_RELEASE:=1

PKG_SOURCE:=95926-$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://qt-apps.org/CONTENT/content-files/
PKG_MD5SUM:=f7a39e4c86a688fcd6653c2e75d59a8c

include $(INCLUDE_DIR)/package.mk
$(call include_mk,qmake.mk)

define Package/kinyin
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=kinyin
	URL:=http://qt-apps.org/content/show.php/kinyin?content=95926
	DEPENDS:=+qt4 +qt4-gui +dejavu-fonts-ttf +wqy-microhei
endef

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/Prepare
	$(call Build/Prepare/Default)
	mv $(PKG_BUILD_DIR)/kinyin $(PKG_BUILD_DIR)/kinyin-data
endef

define Build/Configure
	$(call Build/Configure/Qmake,qt4/kinyin)
endef

define Package/kinyin/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share/kinyin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/kinyin $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/kinyin-data/* $(1)/usr/share/kinyin/
endef

$(eval $(call BuildPackage,kinyin))
