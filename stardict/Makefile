#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=stardict
PKG_VERSION:=3.0.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://downloads.sourceforge.net/stardict/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/stardict
    TITLE:=stardict
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=+libintl +libiconv
    URL:=
endef

define Package/stardict/description
    StarDict is a Cross-Platform and international dictionary Software.
endef

TARGET_CFLAGS+= -I$(STAGING_DIR)/usr/lib/libintl/include
TARGET_LDFLAGS+= -L$(STAGING_DIR)/usr/lib/libintl/lib
TARGET_LDFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CONFIGURE_CMD=./autogen.sh

define Build/Configure
	$(call Build/Configure/Default, \
	        --disable-dependency-tracking \
		--disable-libtool-lock \
		--disable-spell \
		--disable-gucharmap \
		--disable-festival \
		--disable-espeak \
		--disable-dictdotcn \
		--disable-advertisement \
		--disable-man \
		--disable-qqwry \
		--disable-updateinfo \
		--disable-htmlparse \
		--disable-xdxfparse \
		--disable-wordnet \
		--disable-powerwordparse \
		--disable-wikiparse \
		--disable-schemas-install \
		--disable-deprecations \
		--disable-gnome-support \
	)
endef

define Package/stardict/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/share
	$(INSTALL_DIR) $(1)/usr/share/pixmaps

	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/stardict $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/share/pixmaps/stardict.png $(1)/usr/share/pixmaps/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/stardict $(1)/usr/share/
endef

$(eval $(call BuildPackage,stardict))
