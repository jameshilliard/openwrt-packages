# 
# Copyright (C) 2010 
# Author xiangfu@sharism.cc
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=font
PKG_NAME:=wqy-microhei
PKG_RELEASE:=2
PKG_VERSION:=0.2.0-beta
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/${PKG_NAME}/
#PKG_SOURCE_URL:=@SF/wqy-microhei
PKG_SOURCE_URL:=http://downloads.sourceforge.net/project/wqy/wqy-microhei/0.2.0-beta

include $(INCLUDE_DIR)/package.mk

define Package/wqy-microhei
  SECTION:=xorg-font
  CATEGORY:=Xorg
  SUBMENU:=font
  DEPENDS:= @DISPLAY_SUPPORT
  TITLE:=WenQuanYi-chinese-font-ttc
  URL:=http://wqy.sourceforge.net/
endef

define Build/Compile
	echo
endef

define Build/Configure
	echo
endef

define Package/wqy-microhei/install
	$(INSTALL_DIR) $(1)/usr/share/fonts/wqy-microhei $(1)/usr/share/fonts/ttf-dejavu
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/*.ttc $(1)/usr/share/fonts/wqy-microhei
	ln -s /usr/share/fonts/wqy-microhei/wqy-microhei.ttc $(1)/usr/share/fonts/ttf-dejavu/wqy-microhei.ttc
endef

$(eval $(call BuildPackage,wqy-microhei))

