# 2010-06-22 22:44 jirka $

include $(TOPDIR)/rules.mk

PKG_NAME:=o3read
PKG_VERSION:=0.0.4
PKG_RELEASE:=2

PKG_SOURCE:=o3read-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://siag.nu/pub/o3read/
PKG_MD5SUM:=583361b559ccf5a764edb586795d1b06
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/o3read-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/o3read
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=O3read
	URL:=http://siag.nu/o3read/
endef

define Package/o3read/description
	Converts OpenOffice.org Writer files to plain text.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr --with-linux-headers="$(LINUX_DIR)" \
		export READLINE=1 \
	)
endef

define Package/o3read/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/o3read $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/o3totxt $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/o3tohtml $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/utf8tolatin1 $(1)/usr/bin/
endef

$(eval $(call BuildPackage,o3read))
