# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk
PKG_NAME:=sarien
PKG_VERSION:=0.7.0
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_CAT:=zcat
PKG_BUILD_DIR:=$(BUILD_DIR)/sarien-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/sarien
    TITLE:=Sarien
    SECTION:=games
    CATEGORY:=Games
    DEPENDS:=@BROKEN +libsdl
    URL:=http://sourceforge.net/projects/sarien/
endef

define Package/sarien/description
	Sarien is a portable implementation of the Sierra On-Line Adventure Game Interpreter (AGI)
endef

MAKE_ARGS += ipkg
CONFIGURE_ARGS += --with-sdl --with-alsa

define Package/sarien/Build/Compile
	$(call Build/Compile/Default)
endef

define Package/sarien/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/share/sarien
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/sarien $(1)/sarien
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/sarien.cfg $(1)/usr/share/sarien/sarien.cfg
endef

$(eval $(call BuildPackage,sarien))
