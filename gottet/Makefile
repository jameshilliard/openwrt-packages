#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gottet
PKG_VERSION:=1.0.4
PKG_RELEASE:=1
PKG_REV:=41f066f7801fbf9a10b90ba779076a03eb5353c3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/gottcode/gottet.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)


include $(INCLUDE_DIR)/package.mk

$(call include_mk,qmake.mk)

define Package/gottet
	SECTION:=games
	CATEGORY:=Games
	TITLE:=Tetris clone, written in Qt
	DEPENDS:=+qt4 +qt4-gui +dejavu-fonts-ttf
endef

define Build/Configure
	$(call Build/Configure/Qmake,gottet)
endef

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/gottet/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gottet $(1)/usr/bin/
endef

$(eval $(call BuildPackage,gottet))
