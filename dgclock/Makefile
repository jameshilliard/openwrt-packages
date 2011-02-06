# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dgclock
PKG_VERSION:=091222
PKG_RELEASE:=1

PKG_SOURCE:=dgclock$(PKG_VERSION).zip
PKG_SOURCE_URL:=http://clogging.web.fc2.com/dingoo/
PKG_MD5SUM:=2a5143b7a3db464488c917387445e092
PKG_BUILD_DIR:=$(BUILD_DIR)/dgclock-$(PKG_VERSION)

UNPACK_CMD=unzip -d $(1) $(DL_DIR)/$(PKG_SOURCE)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_CFLAGS += \
	-I$(STAGING_DIR)/usr/include/SDL

TARGET_LDFLAGS += \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-lSDL -lSDL_ttf

define Package/dgclock
  SECTION:=xorg-apps
  CATEGORY:=Xorg
  TITLE:=dgclock - sdl based date and time
  URL:=http://clogging.web.fc2.com/dingoo/
  DEPENDS:=+libsdl +libsdl-image +libsdl-ttf +dejavu-fonts-ttf
endef

define Package/dgclock/description
  Clock and date in sdl
endef

define Build/Compile
	( cd $(PKG_BUILD_DIR) ; \
		mkdir bin obj ; \
		$(TARGET_CC) -c $(TARGET_CFLAGS) -o obj/text.o src/text.c ; \
		$(TARGET_CC) -c $(TARGET_CFLAGS) -o obj/settime.o src/settime.c ; \
		$(TARGET_CC) -c $(TARGET_CFLAGS) -o obj/main.o src/main.c ; \
		$(TARGET_CC) -o bin/dgclock obj/text.o obj/main.o obj/settime.o $(TARGET_LDFLAGS) ; \
	)
endef

define Package/dgclock/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/share/icons \
		$(1)/usr/share/applications
        
	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/bin/dgclock \
		$(1)/usr/bin/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/dgclock/dgclock.png \
		$(1)/usr/share/icons/

	$(INSTALL_DATA) \
		./files/dgclock.desktop \
		$(1)/usr/share/applications/
endef

$(eval $(call BuildPackage,dgclock))
