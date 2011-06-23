# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nightsky
PKG_VERSION:=20100829
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=fa2ab06368988678aa14319aa3f07aac

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/nightsky
  TITLE:=Nightsky
  SECTION:=education
  CATEGORY:=Education
  URL:=https://sourceforge.net/projects/nightsky/
  DEPENDS:=+libsdl +libsdl-image
endef

define Package/nightsky/description
  Nightsky is a very basic rendering of the stars in the sky for devices that aren't powerful enough to run Stellarium
endef

TARGET_CFLAGS+=-DNANONOTE
TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/nightsky/install
	$(INSTALL_DIR) \
		$(1)/usr/bin/ \
		$(1)/usr/share/nightsky/ \

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/src/nightsky \
		$(1)/usr/bin/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/example-nightsky.yml \
		$(PKG_BUILD_DIR)/README \
		$(PKG_BUILD_DIR)/data/*.tsv \
		$(PKG_BUILD_DIR)/data/cursor.png \
		$(1)/usr/share/nightsky/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/data/un-fuzzy-6x10-font.png \
		$(1)/usr/share/nightsky/font.png

endef

define Package/nightsky/postinst
#! /bin/sh
mkdir -p $${IPKG_INSTROOT}/root && cp $${IPKG_INSTROOT}/usr/share/nightsky/example-nightsky.yml $${IPKG_INSTROOT}/root/.nightsky.yml
endef

$(eval $(call BuildPackage,nightsky))
