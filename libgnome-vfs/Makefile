#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gnome-vfs
PKG_VERSION:=2.24.2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://ftp.gnome.org/pub/gnome/sources/gnome-vfs/2.24/
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/gnome-vfs
    TITLE:=gnome-vfs
    SECTION:=libs
    CATEGORY:=Libraries
    DEPENDS:=@BROKEN $(INTL_DEPENDS) +libpopt +gnome-mime-data
    URL:=
endef

define Package/gnome-vfs/description
endef
                                           
TARGET_LDFLAGS+= \
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include \
		$(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/* \
		$(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/
endef

define Package/gnome-vfs/install
	$(INSTALL_DIR) \
		$(1)/usr/lib \
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/gnome-vfs*.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,gnome-vfs))
