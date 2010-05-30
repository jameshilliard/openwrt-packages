# Author: Jirka

include $(TOPDIR)/rules.mk

PKG_NAME:=sc
PKG_VERSION:=7.15
PKG_RELEASE:=1
#http://www.ibiblio.org/pub/linux/apps/financial/spreadsheet/sc-7.15.tar.gz

PKG_SOURCE:=sc-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.ibiblio.org/pub/linux/apps/financial/spreadsheet
PKG_MD5SUM:=89c0d76f2c0aabe1cf1c80eae7a13e8f
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/sc-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/sc
	SECTION:=utils
	CATEGORY:=Utilities
	DEPENDS:=+libncurses
	TITLE:=SC Spreadsheet Calculator
	URL:=http://www.ibiblio.org/pub/linux/apps/financial/spreadsheet
endef

define Package/sc/description
	SC is a classic unix speadsheet calculator.
	Works in a character terminal.
endef

define Build/Configure
        $(call Build/Compile/Default, \
              CFLAGS="-I$(STAGING_DIR)/usr/include -DSYSV3 -O2 -pipe"  \
              LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -lm -lncurses" \
        )
endef



define Package/sc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sc $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/psc $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/scqref $(1)/usr/bin/
endef

$(eval $(call BuildPackage,sc))
