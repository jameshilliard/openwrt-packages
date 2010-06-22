# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=catdoc
PKG_VERSION:=0.94
PKG_RELEASE:=3

PKG_SOURCE:=catdoc-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://site.n.ml.org/download/20050502084842/catdoc/
	PKG_MD5SUM:=f884dabe366d66c6cda35dacb0cdceab
	PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/catdoc-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/catdoc
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Catdoc
	URL:=http://site.n.ml.org/info/catdoc/
endef

define Package/catdoc/description
	"Office" to plain text converters.
	The catdoc, catppt and xls2csv tools are included.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr \
	)
endef

define Package/catdoc/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/catdoc $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/xls2csv $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/catppt $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/
	$(INSTALL_DIR) $(1)/usr/share/catdoc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/charsets/*.* $(1)/usr/share/catdoc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/charsets/ascii.spc $(1)/usr/share/catdoc/ascii.specchars
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/charsets/ascii.rpl $(1)/usr/share/catdoc/ascii.replchars
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/charsets/tex.spc $(1)/usr/share/catdoc/tex.specchars
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/charsets/tex.rpl $(1)/usr/share/catdoc/tex.replchars
endef

$(eval $(call BuildPackage,catdoc))
