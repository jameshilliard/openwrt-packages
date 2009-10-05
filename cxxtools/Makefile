#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cxxtools
PKG_VERSION:=1.99.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.tntnet.org/download

PKG_INSTALL:=1

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libiconv/include
TARGET_LDFLAGS+=-liconv -L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/cxxtools
    TITLE:=cxxtools
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=+libiconv
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-atomictype=generic \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/cxxtools $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcxxtools.{a,so*,la} $(1)/usr/lib/
endef

define Package/cxxtools/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcxxtools.so* $(1)/usr/lib/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,cxxtools))
