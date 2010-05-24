# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=mathomatic
PKG_VERSION:=15.0.5
PKG_RELEASE:=1
#http://www.panix.com/~gesslein/mathomatic-15.0.5.tar.bz2

PKG_SOURCE:=mathomatic-$(PKG_VERSION).tar.bz2
	PKG_SOURCE_URL:=http://www.panix.com/~gesslein
	PKG_MD5SUM:=e7dc6cc8dded760f41811aecf33cf2ea
	PKG_CAT:=bzip2 -cd

PKG_BUILD_DIR:=$(BUILD_DIR)/mathomatic-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/mathomatic
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Mathomatic
	URL:=http://www.panix.com/~gesslein/mathomatic-15.0.5.tar.bz2
endef

define Package/mathomatic/description
	Computer algebra system.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr --with-linux-headers="$(LINUX_DIR)" \
	)
endef

define Package/mathomatic/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mathomatic $(1)/usr/bin/
endef

$(eval $(call BuildPackage,mathomatic))
