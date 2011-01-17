# Author: Jirka #

include $(TOPDIR)/rules.mk

PKG_NAME:=mandoc
PKG_VERSION:=1.10.6
PKG_RELEASE:=1

PKG_SOURCE:=mdocml-1.10.6.tar.gz
PKG_SOURCE_URL:=http://mdocml.bsd.lv/snapshots/
PKG_MD5SUM:=4b4dd6c50806c0d520d57318ebd3f412
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/mdocml-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/mandoc
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Manual pages formatter.
  URL:=http://mdocml.bsd.lv/
endef

define Package/mandoc/description
	mandoc (mdocml) is convertor for roff sources (mainly for manula pages)
	to text, html or postscript. Use: "mandoc man_page.1 |less"
endef

define Package/mandoc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mandoc $(1)/usr/bin/
endef

$(eval $(call BuildPackage,mandoc))
