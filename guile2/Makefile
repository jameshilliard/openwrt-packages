#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# modified 16/08/2010
# author: jmoore@zedstar.org


# modified 20/02/2012
# author: jnbagale@gmail.com

# install the "guile 2" in your HOST pc for compile this package

include $(TOPDIR)/rules.mk

PKG_NAME:=guile
PKG_VERSION:=2.0.5

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.gnu.org/gnu/guile/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/guile2
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    TITLE:=guile2
    SECTION:=lang
    CATEGORY:=Languages
    DEPENDS:=+libgmp +libpthread +libltdl +libncurses +libreadline +libffi +libunistring +gc
    URL:=http://savannah.gnu.org/projects/guile/
endef

define Package/guile2/description
    GNU Guile is an interpreter for Scheme, packaged as a library that you can link into your applications to give them their own scripting language.
endef

# should fix issue with threads
CONFIGURE_ARGS += --with-libgmp-prefix --with-libunistring-prefix --with-libltdl-prefix 
CONFIGURE_VARS += gl_cv_func_duplocale_works=yes guile_cv_use_csqrt="no, Ben NanoNote (cross-compiling)"

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

define Package/guile2/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/lib/guile/2.0
	$(INSTALL_DIR) $(1)/usr/share/guile/2.0

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libguile*.so* \
		$(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/guile/2.0/* \
		$(1)/usr/lib/guile/2.0/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/guile/2.0/* \
		$(1)/usr/share/guile/2.0/

endef

$(eval $(call RequireCommand,guile,$(PKG_NAME) requires guile on the host system.))
$(eval $(call BuildPackage,guile2))
