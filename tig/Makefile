# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=tig
PKG_VERSION:=0.18
PKG_RELEASE:=1

PKG_SOURCE:=tig-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://jonas.nitro.dk/tig/releases/
PKG_MD5SUM:=4fa9e33c5daa76b6fed11e068405356f
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/tig-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/tig
	SECTION:=devel
	CATEGORY:=Development
	TITLE:=Console Git repository viewer
	DEPENDS:=+git +libncurses
	URL:=http://jonas.nitro.dk/tig/releases/
endef

define Package/tig/description
	Command line launcher for search engines and other Internet services.
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Package/tig/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tig $(1)/usr/bin/tig
endef

$(eval $(call BuildPackage,tig))
