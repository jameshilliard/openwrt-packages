include $(TOPDIR)/rules.mk

PKG_NAME:=quickcalc
PKG_VERSION:=1.26
PKG_RELEASE:=1

PKG_SOURCE:=quickcalc-$(PKG_VERSION).tgz
	PKG_SOURCE_URL:=ftp://ftp.ac-grenoble.fr/ge/mathematics/
	PKG_MD5SUM:=152599c038c06ecc11e7db9dad4d4dce
	PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/quickcalc-$(PKG_VERSION)

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
