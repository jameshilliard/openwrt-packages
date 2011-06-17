# 
# Copyright (C) 2011 Xiangfu Liu <xiangfu@sharism.cc>
#                            bitcoin: 1CGeqFzCZnAPEEcigr8LzmWTqf8cvo8toW
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dega
PKG_VERSION:=1.14
PKG_RELEASE:=2

PKG_SOURCE:=dega-$(PKG_VERSION)-NanoNote-Edition.tar.gz
PKG_SOURCE_URL:=@SF/dega
PKG_BUILD_DIR:=$(BUILD_DIR)/dega-$(PKG_VERSION)
PKG_MD5SUM:=e070eea91fee9c65d1cece0bf39d488f

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS+= -I$(STAGING_DIR)/usr/include/SDL

TARGET_LDFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
		-lSDL -lSDL -ldirectfb -lfusion

define Package/dega
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=games
	CATEGORY:=Games
	TITLE:=dega
	URL:=http://dega.sourceforge.net/
	DEPENDS:=+libsdl
endef

define Package/dega/description
a emulator for sega master system and game gear which uses SDL
endef

define Build/Patch
	chmod -R 755 $(PKG_BUILD_DIR)
	$(call Build/Patch/Default)
endef

define Package/dega/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dega $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dega))
