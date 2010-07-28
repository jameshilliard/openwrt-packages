#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=snownews
PKG_VERSION:=1.5.12
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://kiza.kcore.de/media/software/snownews/
PKG_MD5SUM:=80da8943fc5aa96571924aec0087d4c0

#

include $(INCLUDE_DIR)/package.mk

define Package/snownews
	SECTION:=utils
	CATEGORY:=Utilities
	DEPENDS:=+libncurses +libxml2 +libopenssl +zlib
	TITLE:=SnowNews
	URL:=http://kiza.kcore.de/software/snownews/
endef

define Package/snownews/description
	RSS feed reader
endef

define Build/Configure
	$(call Build/Compile/Default,\
	EXTRA_CFLAGS="-I$(STAGING_DIR)/usr/lib/libintl/include -I$(STAGING_DIR)/usr/lib/libiconv/include -I$(STAGING_DIR)/usr/include"\
	EXTRA_LDFLAGS="-L$(STAGING_DIR)/usr/lib/ -L$(STAGING_DIR)/usr/lib/libintl/lib -L$(STAGING_DIR)/usr/lib/libiconv/lib -liconv -lcharset -lintl -lm -lz "\
		)
endef

define Package/snownews/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/snownews $(1)/usr/bin
	$(STRIP) $(1)/usr/bin/snownews
endef

$(eval $(call BuildPackage,snownews))
