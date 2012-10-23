#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=qball
PKG_VERSION:=1.4
PKG_REV:=8ff218394bc1815ab9e274752598039b0ef18bbe
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://git.code.sf.net/p/q-ball/code
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

$(call include_mk,qmake.mk)

define Package/qball
	SECTION:=games
	CATEGORY:=Games
	TITLE:=simple breakout style game
	DEPENDS:=+qt4 +qt4-gui +dejavu-fonts-ttf
	URL:=http://homepage.ntlworld.com/mark.harman/comp_qball.html
endef

define Build/Configure
	$(call Build/Configure/Qmake,QBall)
endef

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/qball/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/QBall $(1)/usr/bin/qball
endef

$(eval $(call BuildPackage,qball))
