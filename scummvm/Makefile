# Copyright (C) 2010 tuxbrain.com
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=scummvm
PKG_VERSION:=1.1.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_CAT:=bzcat
PKG_BUILD_DEPENDS:=+libiconv +libsdl +libsdl_sound +libsdl_mixer
DEPENDS:=libiconv libsdl libsdl_sound libsdl_mixer

include $(INCLUDE_DIR)/package.mk

define Package/scummvm
    TITLE:=free implementation of LucasArts SCUMM interpreter
    SECTION:=games
    CATEGORY:=Games
    DEPENDS:=@BROKEN
    URL:=http://www.scummvm.org/
endef
PKG_BUILD_DIR:=$(BUILD_DIR)/scummvm-$(PKG_VERSION)

define Package/scummvm/description
	ScummVM is a program which allows you to run certain classic graphical point-and-click adventure games, provided you already have their data files. The clever part about this: ScummVM just replaces the executables shipped with the games, allowing you to play them on systems for which they were never designed! 
endef

MAKE_FLAGS += AR="mipsel-openwrt-linux-uclibc-ar cru"

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/SDL

define Build/Configure
	$(call Build/Configure/Default, --enable-all-engines --disable-nasm --disable-mad --disable-vorbis --disable-scalers  --disable-mt32emu --disable-hq-scalers --disable-indeo3)

endef
define Package/scummvm/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/scummvm $(1)/usr/bin/
endef

$(eval $(call BuildPackage,scummvm))
