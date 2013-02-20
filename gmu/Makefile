# 
# Copyright (c) 2010 wejp
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gmu
PKG_VERSION:=0.9.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://wejp.k.vu/files/
PKG_MD5SUM:=b9beb8ae21828c637821fcc98b989603

include $(INCLUDE_DIR)/package.mk

define Package/gmu
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=Gmu Music Player
  URL:=http://wejp.k.vu/projects/gmu/
  MENU:=1
  DEPENDS:=+libsdl +libsdl-image +libsdl-gfx +libmpcdec +libmikmod \
	  +libvorbisidec +libspeex +libflac +libogg +BUILD_PATENTED:libmpg123 \
	  +libncursesw
endef

define Package/gmu/description
  A popular music player for various handheld devices.
  It supports various file formats and comes with a
  file browser and a playlist editor/viewer.
endef

MAKE_VARS += TARGET=nanonote $(if $(CONFIG_BUILD_PATENTED),MORE_DECODERS="decoders/mpg123.so")
TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/SDL -I$(STAGING_DIR)/usr/include/ncursesw
TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/SDL \

define Package/gmu/install
	$(INSTALL_DIR) \
		$(1)/etc/gmu \
		$(1)/usr/bin \
		$(1)/usr/share/gmu \
		$(1)/usr/share/gmu/decoders \
		$(1)/usr/share/gmu/frontends \
		$(1)/usr/share/gmu/themes/default-modern 

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/{gmu.bin,gmuc} \
		$(1)/usr/bin/

	$(INSTALL_BIN) \
		./files/gmu \
		$(1)/usr/bin/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/*.conf \
		$(1)/etc/gmu/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/*.keymap \
		$(1)/etc/gmu/

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/decoders/* \
		$(1)/usr/share/gmu/decoders/

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/frontends/* \
		$(1)/usr/share/gmu/frontends/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/themes/default-modern/* \
		$(1)/usr/share/gmu/themes/default-modern/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/README.txt \
		$(1)/usr/share/gmu/
endef

$(eval $(call BuildPackage,gmu))
