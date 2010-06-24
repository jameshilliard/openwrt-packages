#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=links
PKG_VERSION:=2.2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://links.twibright.com/download/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/links
    TITLE:=links
    SECTION:=network
    CATEGORY:=Network
    URL:=http://links.twibright.com/
    DEPENDS:=+libpng +libtiff
endef

define Package/links/description
    Text and graphics WWW browser
endef

CONFIGURE_ARGS += --enable-graphics \
  --enable-debuglevel=0 \
  --without-gpm \
  --without-svgalib \
  --without-pmshell \
  --without-atheos \
  --without-x \
  --without-fb

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/directfb

CONFIGURE_VARS += \
	DIRECTFB_CONFIG="$(STAGING_DIR)/root-xburst/usr/bin/directfb-config"

define Package/links/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/links $(1)/usr/bin/
endef

$(eval $(call BuildPackage,links))
