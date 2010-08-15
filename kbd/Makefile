# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=kbd
PKG_RELEASE:=1
PKG_VERSION:=1.15.1
PKG_SOURCE_URL:=ftp://ftp.kernel.org/pub/linux/utils/kbd
PKG_SOURCE:=kbd-$(PKG_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/kbd
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Keyboard and console utilities for Linux
  URL:=ftp://ftp.kernel.org/pub/linux/utils/kbd
endef

define Package/kbd/description
  Keyboard and console utilities for Linux
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR) ; aclocal; autoheader; automake; autoconf )
	$(call Build/Configure/Default, CFLAGS=-Wno-cast-align )
endef

define Package/kbd/install
	$(INSTALL_DIR) $(1)/usr/bin
	for f in setfont psfxtable setmetamode unicode_stop kbdrate loadkeys kbd_mode showconsolefont loadunimap unicode_start deallocvt openvt getkeycodes showkey setleds cad chvt mapscrn fgconsole setkeycodes dumpkeys; do \
            $(INSTALL_BIN) $(PKG_BUILD_DIR)/src/$$$$f $(1)/usr/bin;\
	done
endef

$(eval $(call BuildPackage,kbd))
