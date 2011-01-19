#
# Copyright (C) 2010 Sharism.cc
# Author: Xiangfu Liu <xiangfu@sharism.cc>
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=imgv
PKG_VERSION:=0.3.0
PKG_REV:=933f92b86b355e482ea41d89f72982e8b0bf4475
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/imgv.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/imgv
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=SDL-based image viewer
	DEPENDS:=+libsdl +libsdl-gfx +libsdl-image +libsdl-ttf +directfb +libfreetype
	URL:=http://projects.qi-hardware.com/index.php/p/imgv/
endef

TARGET_CFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib
MAKE_VARS += TARGETPATH=$(STAGING_DIR)

define Package/imgv/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/imgv $(1)/usr/bin/
endef

$(eval $(call BuildPackage,imgv))
