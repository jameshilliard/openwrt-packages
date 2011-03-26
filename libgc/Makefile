#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gc
PKG_VERSION:=7.2alpha4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/
PKG_MD5SUM:=0a6785ebb61c6e2b50c3952c3bbf9ea1

PKG_INSTALL:=1
PKG_BUILD_DEPENDS:=gc/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

define Package/gc
    TITLE:=gc
    SECTION:=libs
    CATEGORY:=Libraries
    URL:=http://www.hpl.hp.com/personal/Hans_Boehm/gc/
endef

define Package/gc/description
    garbage collector can be used as a garbage collecting replacement for C malloc or C++ new
endef

TARGET_CFLAGS+="-I./include"

TARGET_LDFLAGS+=-lpthread

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-gcj-support \
		--disable-java-finalization \
		--disable-atomic-uncollectible \
	)
endef

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

define Package/gc/install
	$(INSTALL_DIR) \
		$(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/lib{cord,gc}.so* \
		$(1)/usr/lib/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,gc))
