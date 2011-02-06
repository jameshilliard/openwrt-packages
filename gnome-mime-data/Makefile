#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gnome-mime-data
PKG_VERSION:=2.4.3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://ftp.acc.umu.se/pub/gnome/sources/gnome-mime-data/2.4/
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/gnome-mime-data
    TITLE:=gnome-mime-data
    SECTION:=libs
    CATEGORY:=Libraries
    DEPENDS:=$(INTL_DEPENDS)
    URL:=
endef

define Package/gnome-mime-data/description
endef
                 
define Build/Configure
	$(call Build/Configure/Default,)
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
endef

define Package/gnome-mime-data/install
	$(INSTALL_DIR) \
		$(1)/usr/lib
endef

$(eval $(call BuildPackage,gnome-mime-data))
