# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=gcal
PKG_VERSION:=3.6
PKG_RELEASE:=1

PKG_SOURCE:=gcal-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gnu.org/pub/gnu/gcal/
PKG_MD5SUM:=9c3819ca118d6e3adb6a716858cba7d6
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/gcal
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=GCal
	URL:=http://www.gnu.org/software/gcal/
endef

define Package/gcal/description
	GNU version of unix calendar program cal(1).
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr --with-linux-headers="$(LINUX_DIR)" \
	)
endef

define Package/gcal/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/gcal $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/gcal2txt $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/txt2gcal $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/tcal $(1)/usr/bin/
endef

$(eval $(call BuildPackage,gcal))
