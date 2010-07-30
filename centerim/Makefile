include $(TOPDIR)/rules.mk

PKG_NAME:=centerim
PKG_VERSION:=4.22.9
PKG_RELEASE:=3

PKG_SOURCE:=centerim-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.centerim.org/download/releases
	#PKG_MD5SUM:=89c0d76f2c0aabe1cf1c80eae7a13e8f
	PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/centerim-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/centerim
	SECTION:=utils
	CATEGORY:=Utilities
	DEPENDS:=+libncurses +libreadline
	TITLE:=Universal IM client
	URL:=http://www.centerim.org
endef

define Package/centerim/description
	Centerim is a multi-protocol messaging client.
	Works in a character terminal.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr --with-linux-headers="$(LINUX_DIR)" \
	)
endef


define Package/centerim/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/centerim $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/misc/cimconv $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/misc/CenterIMLog2HTML.py $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/share/email.wav $(1)/usr/share/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/share/msg.wav $(1)/usr/share/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/share/offline.wav $(1)/usr/share/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/share/online.wav $(1)/usr/share/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/share/sms.wav $(1)/usr/share/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/share/url.wav $(1)/usr/share/
endef

$(eval $(call BuildPackage,centerim))
