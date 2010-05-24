# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=remind
PKG_VERSION:=03.01.07
PKG_RELEASE:=1
#http://www.roaringpenguin.com/files/download/remind-03.01.07.tar.gz

PKG_SOURCE:=remind-$(PKG_VERSION).tar.gz
	PKG_SOURCE_URL:=http://www.roaringpenguin.com/files/download/
	PKG_MD5SUM:=9335189e78a11b78d848aeade30058d6
	PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/remind-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/remind
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Reminder
	URL:=http://www.roaringpenguin.com/files/download/
endef

define Package/remind/description
	Remind is a powerfull commadline reminder.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr --with-linux-headers="$(LINUX_DIR)" \
	)
endef

define Package/remind/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/remind $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/rem2ps $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/www/rem2html $(1)/usr/bin/
endef

$(eval $(call BuildPackage,remind))
