#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gmenu2x
PKG_VERSION:=20111111
PKG_REV:=1f955e523358796189db503e624788d5337c15a3
PKG_RELEASE:=1
PKG_INSTALL:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/gmenu2x.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DEPENDS:=sparsehash

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_CFLAGS+= \
	-I$(STAGING_DIR)/usr/include/SDL \
	-I$(STAGING_DIR)/usr/include/google/sparsehash \
	-I$(PKG_BUILD_DIR)/src/tinyxml \
	-DTIXML_USE_STL -DTARGET_GP2X -O3 -msoft-float -fomit-frame-pointer \
	-ffast-math -funroll-loops -Wall -Wno-unknown-pragmas -Wno-format \

TARGET_CPPFLAGS+= \
  -I$(STAGING_DIR)/usr/include/SDL \
  -I$(STAGING_DIR)/usr/include/google/sparsehash \
  -I$(PKG_BUILD_DIR)/src/tinyxml \
  -DLOG_LEVEL=0

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/SDL

define Package/gmenu2x
  SECTION:=xorg-apps
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=Gmenu2x
  URL:=http://projects.qi-hardware.com/index.php/p/gmenu2x/
  DEPENDS:=+libsdl +libpng +libsdl-ttf +libstdcpp +libsdl-gfx
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default,\
		--enable-platform=nanonote)
endef

define Package/gmenu2x/install
	$(INSTALL_DIR) \
		$(1)/usr/bin/ \
		$(1)/usr/share/gmenu2x/ \

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/gmenu2x \
		$(1)/usr/bin/gmenu2x.bin

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/gmenu2x/* \
		$(1)/usr/share/gmenu2x/

	mv \
		$(1)/usr/share/gmenu2x/gmenu2x.sh \
		$(1)/usr/bin/gmenu2x
endef

$(eval $(call BuildPackage,gmenu2x))
