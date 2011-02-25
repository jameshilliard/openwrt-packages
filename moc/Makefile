#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

#
# Don't forget:
#
# ./scripts/feeds update
# ./scripts/feeds install iconv libcurl alsa-utils libvorbis usbutils libmad libflac libid3tag
#

include $(TOPDIR)/rules.mk

PKG_NAME:=moc
PKG_VERSION:=2.4.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.daper.net/pub/soft/moc/stable/
PKG_MD5SUM:=647c770a5542a4ae5437386807a89796

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/moc
  MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libcurl +BUILD_PATENTED:libmad +libvorbis $(ICONV_DEPENDS) +alsa-utils +libid3tag +libflac +libncursesw
  TITLE:=Music On Console
endef

define Package/moc/description
	MOC (music on console) is a console audio player for LINUX/UNIX designed to be powerful and easy to use.
endef

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CONFIGURE_ARGS += \
	$(if $(CONFIG_BUILD_PATENTED),,--without-mp3) \
	--enable-shared \
	--disable-static \
	--disable-debug

define Package/moc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mocp $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/moc/decoder_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/moc/decoder_plugins/*.so $(1)/usr/lib/moc/decoder_plugins
endef

$(eval $(call BuildPackage,moc))
