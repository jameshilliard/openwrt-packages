include $(TOPDIR)/rules.mk

PKG_NAME:=snownews
PKG_VERSION:=1.5.12
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://kiza.kcore.de/media/software/snownews/
PKG_MD5SUM:=80da8943fc5aa96571924aec0087d4c0

#

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/snownews
	SECTION:=utils
	CATEGORY:=Utilities
	DEPENDS:=+libncursesw +libxml2 +libopenssl +zlib $(ICONV_DEPENDS) $(INTL_DEPENDS) +libcharset
	TITLE:=SnowNews
	URL:=http://kiza.kcore.de/software/snownews/
endef

define Package/snownews/description
	RSS feed reader
endef

define Build/Configure
	$(call Build/Compile/Default,\
	EXTRA_CFLAGS="$(ICONV_CFLAGS) $(INTL_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/usr/include/libxml2/ "\
	EXTRA_LDFLAGS="-L$(STAGING_DIR)/usr/lib/ $(ICONV_LDFLAGS) $(INTL_LDFLAGS) -lcharset -lintl -liconv -lm -lz "\
		)
endef

define Package/snownews/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/snownews $(1)/usr/bin
	$(STRIP) $(1)/usr/bin/snownews
endef

$(eval $(call BuildPackage,snownews))
