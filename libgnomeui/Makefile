#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libgnomeui
PKG_VERSION:=2.0.6

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.gnome.org/pub/GNOME/sources/libgnomeui/2.0/
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libgnomeui
    TITLE:=libgnomeui
    SECTION:=libs
    CATEGORY:=Libraries
    DEPENDS:=+gconf2 +libgnome +libgnomecanvas +libbonoboui
    URL:=
endef

define Package/libgnomeui/description
    
endef

TARGET_CFLAGS+=

define Build/Configure
	$(call Build/Configure/Default,)
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include \
		$(1)/usr/lib \
		$(1)/usr/lib/pklibgnomeuionfig
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/* \
		$(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pklibgnomeuionfig \
		$(1)/usr/lib/
endef

define Package/libgnomeui/install
	$(INSTALL_DIR) \
		$(1)/usr/lib \
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgnomeui*.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libgnomeui))
