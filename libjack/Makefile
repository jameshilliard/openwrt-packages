#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libjack
PKG_VERSION:=1.9.7
PKG_SOURCE:=jack-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.grame.fr/~letz/
PKG_BUILD_DIR:=$(BUILD_DIR)/jack-$(PKG_VERSION)

PKG_RELEASE:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libjack
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=jack
  URL:=http://jackaudio.org/
  DEPENDS:=@BROKEN
# some python depends error: ImportError: No module named thread
endef

define Package/libjack/description
endef

define Build/Compile
	cd $(PKG_BUILD_DIR) && \
	DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE_VARS) \
	./waf configure && \
	./waf build && \
	./waf install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Package/libjack/install
	$(INSTALL_DIR) $(1)/usr/lib
endef

$(eval $(call BuildPackage,libjack))
