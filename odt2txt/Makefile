include $(TOPDIR)/rules.mk

PKG_NAME:=odt2txt
PKG_VERSION:=0.4
PKG_RELEASE:=1

PKG_SOURCE:=odt2txt-$(PKG_VERSION).tar.gz
	PKG_SOURCE_URL:=http://stosberg.net/odt2txt/
	PKG_MD5SUM:=6fe3bd261ce2dde2810244bbe969bbc5
	PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/odt2txt-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/odt2txt
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=odt2txt
	URL:=http://stosberg.net/odt2txt/
	DEPENDS:=$(ICONV_DEPENDS) +zlib
endef

define Package/odt2txt/description
	Converts OpenDocument files to plain text.
endef

define Build/Configure
        $(call Build/Compile/Default, \
              CFLAGS="-I$(STAGING_DIR)/usr/include -O2 -DNO_ICONV"  \
              LDFLAGS="-L$(STAGING_DIR)/usr/lib "  \
        )
endef


define Package/odt2txt/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/odt2txt $(1)/usr/bin/
endef

$(eval $(call BuildPackage,odt2txt))
