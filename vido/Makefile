#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vido
PKG_VERSION:=20091107
PKG_REV:=046bb78668ceefb0cc7f1dc9df9fe22242d3e873
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/vido.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS+= \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/libiconv/include

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/vido
  SECTION:=xorg-apps
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=Vido
  URL:=http://projects.qi-hardware.com/index.php/p/vido/
  DEPENDS:=+gtkhtml +gtkmm +zimlib
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default)
endef

define Package/vido/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/share/applications \
		$(1)/usr/share/pixmaps

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/vido \
		$(1)/usr/bin/

	#$(INSTALL_DATA) \
	#	$(PKG_INSTALL_DIR)/usr/share/applications/vido.desktop \
	#	$(1)/usr/share/applications/
endef

$(eval $(call BuildPackage,vido))
