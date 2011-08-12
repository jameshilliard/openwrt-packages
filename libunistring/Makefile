#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Bart van Strien <bart.bes@gmail.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libunistring
PKG_VERSION:=0.9.2.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.gnu.org/gnu/$(PKG_NAME)/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libunistring
    MAINTAINER:="Bart van Strien" <bart.bes@gmail.com>
    TITLE:=libunistring
    SECTION:=libs
    CATEGORY:=Libraries
    DEPENDS:=+libiconv
    URL:=http://savannah.gnu.org/projects/libunistring/
endef

define Package/libunistring/description
    This library implements Unicode strings, together with functions for Unicode characters and functions for string processing.
endef

define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)"\
		DESTDIR="$(PKG_INSTALL_DIR)"\
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include \
		$(1)/usr/lib \
		$(1)/usr/share
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/* \
		$(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/* \
		$(1)/usr/share
endef

define Package/libunistring/install
	$(INSTALL_DIR) $(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libunistring))
