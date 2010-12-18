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

include $(INCLUDE_DIR)/package.mk
$(call include_mk,qmake.mk)

define Package/kinyin
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=kinyin
	URL:=http://qt-apps.org/content/show.php/kinyin?content=95926
	DEPENDS:=+qt4 +qt4-gui +dejavu-fonts-ttf @BROKEN
endef

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/Configure
	cd $(PKG_BUILD_DIR)/qt4 && \
	$(call Build/Configure/Qmake,qt4/kinyin)
endef

define Package/kinyin/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/kinyin $(1)/usr/bin/
endef

$(eval $(call BuildPackage,kinyin))
