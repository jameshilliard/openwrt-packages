#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# modified 16/08/2010
# author: jmoore@zedstar.org

# install the "guile" in your HOST pc for compile this package

include $(TOPDIR)/rules.mk

PKG_NAME:=guile
PKG_VERSION:=1.8.7

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.gnu.org/gnu/guile/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/guile
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    TITLE:=guile
    SECTION:=lang
    CATEGORY:=Languages
    DEPENDS:=+libgmp +libpthread +libltdl +libncurses +libreadline
    URL:=http://savannah.gnu.org/projects/guile/
endef

define Package/guile/description
    GNU Guile is an interpreter for Scheme, packaged as a library that you can link into your applications to give them their own scripting language.
endef

TARGET_LDFLAGS+="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib"

# should fix issue with threads
CONFIGURE_ARGS += --without-threads --without-gettext

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include \
		$(1)/usr/lib \
		$(1)/usr/lib/pkgconfig
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/* \
		$(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig \
		$(1)/usr/lib/
endef

define Package/guile/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/share/guile/1.8

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libguile*.so* \
		$(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/guile/1.8/* \
		$(1)/usr/share/guile/1.8/

endef

$(eval $(call RequireCommand,guile,$(PKG_NAME) requires guile on the host system.))
$(eval $(call BuildPackage,guile))
