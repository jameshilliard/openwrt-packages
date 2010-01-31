#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tntnet
PKG_VERSION:=1.6.991.20091227-1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.tntnet.org/download

PKG_INSTALL:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

PKG_BUILD_DEPENDS:=cxxtools/host

TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libiconv/include
TARGET_LDFLAGS+=-liconv -L$(STAGING_DIR)/usr/lib/libiconv/lib

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/tntnet
    TITLE:=tntnet
    SECTION:=libs
    CATEGORY:=Libraries
    DEPENDS:=+zlib +cxxtools
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-epoll=no \
		--with-ssl=no \
		--with-cgi=no \
		--with-demos=no \
		--with-server=no \
		--with-sdk=no \
		--disable-unittest \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/tnt $(1)/usr/include/
	#$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtntnet.{a,so*,la} $(1)/usr/lib/ # no static library is created (bug?)
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtntnet.{so*,la} $(1)/usr/lib/
endef

define Package/tntnet/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtntnet.so* $(1)/usr/lib/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,tntnet))
