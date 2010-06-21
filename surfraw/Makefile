# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=surfraw
PKG_VERSION:=2.2.7
PKG_RELEASE:=1
#http://surfraw.alioth.debian.org/dist/surfraw-2.2.7.tar.gz

PKG_SOURCE:=surfraw-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://surfraw.alioth.debian.org/dist
PKG_MD5SUM:=213010e9b7c8478827e8903530cf7787
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/surfraw-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/surfraw
	SECTION:=internet
	CATEGORY:=Network
	TITLE:=command line interface to WWW search engines
	DEPENDS:=+perl +libreadline
	URL:=http://surfraw.alioth.debian.org/
endef

define Package/surfraw/description
	Command line launcher for search engines and other Internet services.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr --disable-opensearch --with-linux-headers="$(LINUX_DIR)" \
		export READLINE=1 \
	)
endef

define Package/surfraw/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/surfraw $(1)/usr/bin/sr
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/surfraw $(1)/usr/bin/surfraw
	$(INSTALL_DIR) $(1)/usr/lib/surfraw
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/elvi/* $(1)/usr/lib/surfraw/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/surfraw.conf $(1)/etc
endef

$(eval $(call BuildPackage,surfraw))
