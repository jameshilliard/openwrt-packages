# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gnuchess
PKG_VERSION:=5.07
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.gnu.org/pub/gnu/chess
PKG_CAT:=zcat


include $(INCLUDE_DIR)/package.mk

define Package/gnuchess
  TITLE:=Chess GNU from FSF
  SECTION:=games
  CATEGORY:=Games
  URL:=http://www.gnu.org/software/chess/chess.html
endef
PKG_BUILD_DIR:=$(BUILD_DIR)/gnuchess-$(PKG_VERSION)

define Package/gnuchess/description
  GNU Chess lets most modern computers play a full game of chess. It has a plain terminal interface but supports visual interfaces such as xboard and eboard
endef
 
define Build/Configure
      $(call Build/Configure/Default)

endef 
define Package/gnuchess/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/gnuchess $(1)/usr/bin/
endef 

$(eval $(call BuildPackage,gnuchess))
