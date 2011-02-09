#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=links
PKG_VERSION:=2.3pre1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://links.twibright.com/download/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/links
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    TITLE:=Text and graphics WWW browser
    SUBMENU:=Web
    SECTION:=net
    CATEGORY:=Network
    URL:=http://links.twibright.com/
    DEPENDS:=+libpng +libtiff +libopenssl +directfb +svgalib +libjpeg
endef

define Package/links/description
    Text and graphics WWW browser
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) $(FILES_DIR)/directfb-config $(PKG_BUILD_DIR)
endef

CONFIGURE_ARGS += --enable-graphics \
  --enable-debuglevel=0 \
  --without-gpm \
  --without-pmshell \
  --without-atheos \
  --without-x

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/directfb

CONFIGURE_VARS += \
	DIRECTFB_CONFIG="$(PKG_BUILD_DIR)/directfb-config $(STAGING_DIR)"
#DIRECTFB_CONFIG="$(STAGING_DIR)/root-xburst/usr/bin/directfb-config"

define Package/links/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/links $(1)/usr/bin/
endef

$(eval $(call BuildPackage,links))
