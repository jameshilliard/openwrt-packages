include $(TOPDIR)/rules.mk

PKG_NAME:=mathomatic
PKG_VERSION:=15.3.4
PKG_RELEASE:=1

PKG_SOURCE:=mathomatic-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://mathomatic.org
PKG_MD5SUM:=cbffaca1634cc50e227dfbcdb0c644dd
PKG_CAT:=bzip2 -cd

PKG_BUILD_DIR:=$(BUILD_DIR)/mathomatic-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/mathomatic
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Small computer algebra system.
  URL:=http://www.mathomatic.org
  DEPENDS:=+libreadline +libncurses
endef

define Package/mathomatic/description
  Computer algebra system.
endef

define Build/Configure
        $(call Build/Compile/Default, \
         READLINE=1\
         HANDHELD=1\
        )
endef

define Package/mathomatic/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mathomatic $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/m4/rmath $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/m4/functions.m4 $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/m4/matho $(1)/usr/bin/
endef

$(eval $(call BuildPackage,mathomatic))
