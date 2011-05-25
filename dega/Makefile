# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dega
PKG_VERSION:=1.14
PKG_RELEASE:=1

PKG_SOURCE:=degap-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/dega
PKG_BUILD_DIR:=$(BUILD_DIR)/degap-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS+= -I$(STAGING_DIR)/usr/include/SDL

TARGET_LDFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
		-lSDL -lSDL -ldirectfb -lfusion

define Package/degap
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=games
	CATEGORY:=Games
	TITLE:=dega
	URL:=http://dega.sourceforge.net/
	DEPENDS:=+libsdl
endef

define Package/degap/description
a emulator for sega master system and game gear which uses SDL
endef

define Package/degap/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dega $(1)/usr/bin/
endef

$(eval $(call BuildPackage,degap))
