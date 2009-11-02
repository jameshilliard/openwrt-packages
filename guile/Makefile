#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=guile
PKG_VERSION:=1.8.7

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.gnu.org/gnu/guile/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/guile
    TITLE:=guile
    SECTION:=libs
    CATEGORY:=Libraries
    DEPENDS:=+libgmp +libpthread
    URL:=http://savannah.gnu.org/projects/guile/
endef

define Package/guile/description
    GNU Guile is an interpreter for Scheme, packaged as a library that you can link into your applications to give them their own scripting language.
endef

TARGET_LDFLAGS+="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib"

CONFIGURE_ARGS += 

define Package/guile/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/guile $(1)/usr/bin/
endef

$(eval $(call BuildPackage,guile))
