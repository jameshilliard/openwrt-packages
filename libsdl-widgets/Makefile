#
# Copyright (C) 2011 Xiangfu Liu <xiangfu@sharism.cc>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsdl-widgets
PKG_VERSION:=0.4
PKG_SOURCE:=SDL-widgets-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://members.chello.nl/w.boeke/SDL-widgets/
PKG_BUILD_DIR:=$(BUILD_DIR)/SDL-widgets-$(PKG_VERSION)

PKG_RELEASE:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libsdl-widgets
  MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=SDL-widgets
  URL:=http://members.chello.nl/w.boeke/SDL-widgets/index.html
  DEPENDS:=+libsdl-gfx +libsdl-ttf +dejavu-fonts-ttf-DejaVuSans +dejavu-fonts-ttf-DejaVuSans-Bold
endef

define Package/libsdl-widgets/description
SDL-widgets is a GUI toolkit on top of the SDL libraries. It is written in C++. It's not especially intended for games, more for normal applications. This implicates: a possibly complicated SDL_Surface hierarchy, where surfaces can be hidden or shown, with sliders, menus, text areas, etc. Threads are supported, they may communicate via messages.
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/SDL \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/Install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/sdl-widgets.h $(1)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/sdl-widgets.o $(1)/usr/lib/
endef

define Package/libsdl-widgets/install
	$(INSTALL_DIR) $(1)/usr/share/sdl-widgets/
	$(CP) $(PKG_BUILD_DIR)/testsw $(1)/usr/share/sdl-widgets/
	$(CP) $(PKG_BUILD_DIR)/hello/hello $(1)/usr/share/sdl-widgets/
	$(CP) $(PKG_BUILD_DIR)/make-waves/make-waves $(1)/usr/share/sdl-widgets/
	$(CP) $(PKG_BUILD_DIR)/bouncy-tune/bouncy-tune $(1)/usr/share/sdl-widgets/
	$(CP) $(PKG_BUILD_DIR)/bouncy-tune/rising.bcy $(1)/usr/share/sdl-widgets/
endef

$(eval $(call BuildPackage,libsdl-widgets))
