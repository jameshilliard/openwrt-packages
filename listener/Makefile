#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=listener
PKG_VERSION:=1.7.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://www.vanheusden.com/listener/
PKG_MD5SUM:=8ad9c24c45c7d28aed606304a2bf80bf

include $(INCLUDE_DIR)/package.mk

define Package/listener
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libncurses +libsndfile
  TITLE:=Listener automatically records when sound is detected
  URL:=http://www.vanheusden.com/listener/
endef

define Package/listener/description
  This program listens for sound. If it detects any, it starts recording
  automatically and also automatically stops when things become silent
  again.
endef

TARGET_CFLAGS+= -DCONFIGFILE=\\\"/etc/listener.conf\\\"

define Package/listener/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/{listener,listenersoundpipe,setlistener} $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc
	$(CP) $(FILES_DIR)/listener.conf $(1)/etc/

	$(INSTALL_DIR) $(1)/usr/share/listener
	$(CP) $(PKG_BUILD_DIR)/manual.html $(1)/usr/share/listener/
endef

$(eval $(call BuildPackage,listener))
