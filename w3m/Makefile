#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=w3m
PKG_VERSION:=0.5.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=1b845a983a50b8dec0169ac48479eacc

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/w3m
    TITLE:=w3m
    SUBMENU:=Web
    SECTION:=network
    CATEGORY:=Network
    URL:=http://w3m.sourceforge.net/
    DEPENDS:=+libopenssl +gc +libncurses +PACKAGE_libncursesw:libncursesw +gtk2
endef

define Package/w3m/description
    w3m is a text-based web browser
endef

CONFIGURE_ARGS += --with-ssl=$(STAGING_DIR)/usr \
		  --with-gc=$(STAGING_DIR)/usr/lib \
		  --disable-xface \
		  --with-imagelib="gtk2" \
		  --enable-image="fb" \
		  --with-termlib="ncurses"

TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib -liconv

define Build/Configure
	$(call Build/Configure/Default)
	(mkdir $(PKG_BUILD_DIR)/host && \
	cd $(PKG_BUILD_DIR)/host && \
	$(HOSTCC) -DDUMMY -c -o dummy.o ../entity.c && \
	$(HOSTCC) -o mktable ../mktable.c dummy.o ../Str.c ../hash.c ../myctype.c -Wl,-rpath="$(STAGING_DIR_HOST)/lib" -L$(STAGING_DIR_HOST)/lib -I$(STAGING_DIR_HOST)/include -lgc)
endef

define Package/w3m/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib/w3m
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/w3m $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/w3mimgdisplay $(1)/usr/lib/w3m/
endef

$(eval $(call BuildPackage,w3m))
