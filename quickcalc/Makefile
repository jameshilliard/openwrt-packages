include $(TOPDIR)/rules.mk

PKG_NAME:=quickcalc
PKG_VERSION:=1.28
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.ac-grenoble.fr/ge/mathematics/
PKG_MD5SUM:=1d89b963c84d6cd32918da8a779f3f24

include $(INCLUDE_DIR)/package.mk

define Package/quickcalc
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=QuickCalc
	URL:=http://freshmeat.net/projects/quickcalc
	DEPENDS:=+libreadline +libncurses
endef

define Package/quickcalc/description
	Computer algebra system.
endef

define Build/Configure
        $(call Build/Compile/Default, \
              CFLAGS="-I$(STAGING_DIR)/usr/include -O2 "  \
              LDFLAGS="-L$(STAGING_DIR)/usr/lib "  \
        )
endef


define Package/quickcalc/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/qc $(1)/usr/bin/
endef

$(eval $(call BuildPackage,quickcalc))
