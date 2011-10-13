#
# Copyright (C) 2009 Qi Hardware.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# ERROR: eggtrayicon.h:27:25: fatal error: gtk/gtkplug.h: No such file or directory

include $(TOPDIR)/rules.mk

PKG_NAME:=gimmix
PKG_VERSION:=0.5.7.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.berlios.de/gimmix/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/gimmix
    SECTION:=sound
    CATEGORY:=Sound
    TITLE:=Gimmix is a GTK2 client for MPD
    DEPENDS:=+gtk2 +libintl +libglade +libmpd +taglibc @BROKEN
    URL:=http://gimmix.berlios.de/
endef

define Package/gimmix/description
    Gimmix is a GTK2 client for MPD
endef

CONFIGURE_ARGS += --disable-libtool-lock --disable-lyrics --disable-cover

define Package/gimmix/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/gimmix $(1)/usr/bin/
endef

$(eval $(call BuildPackage,gimmix))
