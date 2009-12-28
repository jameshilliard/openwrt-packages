#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libbonoboui
PKG_VERSION:=2.24.2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://ftp.gnome.org/pub/GNOME/sources/libbonoboui/2.24/
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libbonoboui
    TITLE:=libbonoboui
    SECTION:=libs
    CATEGORY:=Libraries
    DEPENDS:=+libpopt +libgnomecanvas +libbonobo +libgnome +bonobo-activation
    URL:=
endef

define Package/libbonoboui/description
    
endef

TARGET_CFLAGS+=

define Build/Configure
	$(call Build/Configure/Default,)
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include \
		$(1)/usr/lib \
		$(1)/usr/lib/libbonoboui
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/* \
		$(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libbonoboui \
		$(1)/usr/lib/
endef

define Package/libbonoboui/install
	$(INSTALL_DIR) \
		$(1)/usr/lib \
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libbonoboui*so.* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libbonoboui))
