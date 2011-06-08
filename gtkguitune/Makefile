#
# Copyright (C) 2011 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@sharism.cc>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gtkguitune
PKG_VERSION:=0.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-gtk2-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.oocities.org/harpin_floh/mysoft/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/gtkguitune
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    SECTION:=utils
    CATEGORY:=Utilities
    TITLE:=Guitune
    URL:=http://www.oocities.org/harpin_floh/kguitune_page.html
    DEPENDS:=+gtkmm +gtk2 +pango +atk +glib2 $(ICONV_DEPENDS) $(INTL_DEPENDS) +libsigcxx
endef

define Package/gtkguitune/description
Guitune is a linux program for tuning guitars and other instruments by using the method of Schmitt-triggering
endef

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/gtkguitune/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gtkguitune $(1)/usr/bin
endef

$(eval $(call BuildPackage,gtkguitune))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/openwrt-xburst.full_system package/gtkguitune/{clean,compile} -j2 V=99"
# End: