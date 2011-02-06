#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vido
PKG_VERSION:=20100326
PKG_REV:=c544a52e18c5aae130002d05aca62940ba744597
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/vido.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

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
