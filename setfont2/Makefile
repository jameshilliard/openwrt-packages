# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=setfont2
PKG_VERSION:=20110213
PKG_REV:=30bc03576863c97fac48ec103044e3f21b2375c7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/setfont2.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)


include $(INCLUDE_DIR)/package.mk

define Package/setfont2
  TITLE:=Set 32-bit color fonts with fbcon
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://projects.qi-hardware.com/index.php/p/setfont2/
endef

define Package/setfont2/description
  Setfont2 is a utility to set 32-bit fonts on the framebuffer console ( fbcon).  Fonts with 32-bit glyphs can make use of SubLCD effects to make them easier to read than black and white fonts at the same point size
endef

define Build/Configure
      $(call Build/Configure/Default)

endef

define Build/Compile
     cd $(PKG_BUILD_DIR); \
	     $(TARGET_CC) -Wl,-rpath-link=$(STAGING_DIR)/usr/lib -Wall -Os -o setfont2 setfont2.c
endef

define Package/setfont2/install
	$(INSTALL_DIR) \
		$(1)/etc/init.d \
		$(1)/usr/sbin \
		$(1)/usr/share/setfont2

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/setfont2 \
		$(1)/usr/sbin/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/fonts/un-fuzzy-6x10-font.pnm \
		$(PKG_BUILD_DIR)/fonts/un-fuzzy-4x8-font.pnm \
		$(PKG_BUILD_DIR)/fonts/ben_uni.trans \
		$(1)/usr/share/setfont2/
endef

$(eval $(call BuildPackage,setfont2))
