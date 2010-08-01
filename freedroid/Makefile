# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=freedroid
PKG_VERSION:=1.0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.sourceforge.net/project/freedroid/freedroidClassic/FreedroidClassic-1.0.2/
PKG_CAT:=zcat
PKG_MD5SUM:=585a65f61c2cd308ab45d5c514f695dc

PKG_BUILD_DIR:=$(BUILD_DIR)/freedroid-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/freedroid
  TITLE:=FreeDroid
  SECTION:=games
  CATEGORY:=Games
  URL:=http://freedroid.sourceforge.net/
  DEPENDS:=+libsdl-image +libsdl-mixer +libvorbis
endef

define Package/freedroid/description
  A free clone of the C64-classic "Paradroid"
endef

CONFIGURE_VARS+=LDFLAGS="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib" ac_cv_lib_vorbis_ov_open="yes"
CONFIGURE_ARGS+=--with-x="no"

define Package/freedroid/install
	$(INSTALL_DIR) \
		$(1)/usr/bin/ \
		$(1)/usr/share/freedroid/ \
		$(1)/usr/share/freedroid/graphics/ \
		$(1)/usr/share/freedroid/graphics/classic_theme/ \
		$(1)/usr/share/freedroid/graphics/lanzz_theme/ \
		$(1)/usr/share/freedroid/map/ \
		$(1)/usr/share/freedroid/sound

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/src/freedroid \
		$(1)/usr/bin/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/graphics/*.png \
		$(PKG_BUILD_DIR)/graphics/*.jpg \
		$(1)/usr/share/freedroid/graphics/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/graphics/classic_theme/*.png \
		$(PKG_BUILD_DIR)/graphics/classic_theme/config.theme \
		$(1)/usr/share/freedroid/graphics/classic_theme/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/graphics/lanzz_theme/*.png \
		$(PKG_BUILD_DIR)/graphics/lanzz_theme/config.theme \
		$(1)/usr/share/freedroid/graphics/lanzz_theme/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/map/freedroid.ruleset \
		$(PKG_BUILD_DIR)/map/Paradroid.* \
		$(1)/usr/share/freedroid/map/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/sound/*.wav \
		$(PKG_BUILD_DIR)/sound/*.mod \
		$(PKG_BUILD_DIR)/sound/*.ogg \
		$(1)/usr/share/freedroid/sound/
endef

$(eval $(call BuildPackage,freedroid))
