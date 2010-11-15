#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gmenu2x
PKG_VERSION:=20101115
PKG_REV:=42ae8268e4a2bac88609ca242c1aeaaaf4010af9
PKG_RELEASE:=1
PKG_INSTALL:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/gmenu2x.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DEPENDS:=sparsehash

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS+= \
	-I$(STAGING_DIR)/usr/include/SDL \
	-I$(STAGING_DIR)/usr/include/google/sparsehash \
	-I$(PKG_BUILD_DIR)/src/tinyxml \
	-DTIXML_USE_STL -DTARGET_GP2X -O3 -msoft-float -fomit-frame-pointer -ffast-math -funroll-loops -Wall -Wno-unknown-pragmas -Wno-format \

TARGET_CPPFLAGS+= \
  -I$(STAGING_DIR)/usr/include/SDL \
  -I$(STAGING_DIR)/usr/include/google/sparsehash \
  -I$(PKG_BUILD_DIR)/src/tinyxml \

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/SDL \

define Package/gmenu2x
  SECTION:=xorg-apps
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=Gmenu2x
  URL:=http://projects.qi-hardware.com/index.php/p/gmenu2x/
  DEPENDS:=+libsdl +libsdl-image +libsdl-ttf +libstdcpp +libsdl-gfx
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default)
endef

define Package/gmenu2x/install
	$(INSTALL_DIR) \
		$(1)/usr/bin/ \
		$(1)/usr/share/gmenu2x/ \

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/gmenu2x \
		$(1)/usr/share/gmenu2x/

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/gmenu2x.sh \
		$(1)/usr/bin/gmenu2x

	$(CP) \
		$(PKG_BUILD_DIR)/pandora/* \
		$(1)/usr/share/gmenu2x/

	$(CP) \
		$(PKG_BUILD_DIR)/input.conf.nanonote \
		$(1)/usr/share/gmenu2x/input.conf

	rm -rf \
		$(1)/usr/share/gmenu2x/sections/{emulators,games}
endef

$(eval $(call BuildPackage,gmenu2x))
