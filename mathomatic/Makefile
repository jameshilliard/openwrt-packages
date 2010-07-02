# $Id: Makefile 2010-07-02 00:29:07Z Jirka $

include $(TOPDIR)/rules.mk

PKG_NAME:=mathomatic
PKG_VERSION:=15.1.4
PKG_RELEASE:=3
#http://mathomatic.org/mathomatic-15.1.4.tar.bz2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.panix.com/~gesslein
PKG_MD5SUM:=a844d982bcfe120bf7987e90495f8f1e
PKG_CAT:=bzip2 -cd

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/mathomatic
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Calc
	URL:=http://www.panix.com/~gesslein/
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
endef

$(eval $(call BuildPackage,mathomatic))
