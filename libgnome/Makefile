#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libgnome
PKG_VERSION:=2.28.0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://ftp.gnome.org/pub/GNOME/sources/libgnome/2.28/
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libgnome
    TITLE:=libgnome
    SECTION:=libs
    CATEGORY:=Libraries
    DEPENDS:=+libbonobo +libgnome-vfs
    URL:=
endef

define Package/libgnome/description
    
endef

TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/gnome-vfs-2.0/include
                                           
TARGET_LDFLAGS+= \
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
        -L$(STAGING_DIR)/usr/lib/libintl/lib \
        -L$(STAGING_DIR)/usr/lib/gnome-vfs-2.0/modules

CONFIGURE_ARGS += --disable-esd

define Build/Configure
	$(call Build/Configure/Default,)
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include \
		$(1)/usr/lib \
		$(1)/usr/lib/libgnome
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/* \
		$(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgnome \
		$(1)/usr/lib/
endef

define Package/libgnome/install
	$(INSTALL_DIR) \
		$(1)/usr/lib \
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgnome*.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libgnome))
