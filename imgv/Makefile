#
# Copyright (C) 2010 Sharism.cc
# Author: Xiangfu Liu <xiangfu@sharism.cc>
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=imgv
PKG_VERSION:=0.2.1
PKG_REV:=8ebb97009538d637f8860192c505b67011b2e781
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/imgv.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/imgv
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=SDL-based image viewer
	DEPENDS:=+libsdl +libsdl-gfx +libsdl-image +directfb
	URL:=http://projects.qi-hardware.com/index.php/p/imgv/
endef


MAKE_FLAGS+= TARGETPATH=$(STAGING_DIR)

define Package/imgv/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/imgv $(1)/usr/bin/
endef

$(eval $(call BuildPackage,imgv))
