include $(TOPDIR)/rules.mk

PKG_NAME:=centerim
PKG_VERSION:=4.22.9
PKG_RELEASE:=4

PKG_SOURCE:=centerim-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.centerim.org/download/releases
PKG_MD5SUM:=c43911508205e0277529230c8316a298

PKG_BUILD_DIR:=$(BUILD_DIR)/centerim-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/centerim
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Instant Messaging
	DEPENDS:=+libncurses +libreadline +libgpgme +libopenssl +libcurl
	TITLE:=Universal IM client
	URL:=http://www.centerim.org
endef

define Package/centerim/description
	Centerim is a multi-protocol messaging client.
	Works in a character terminal.
endef

CONFIGURE_VARS+=ac_cv_lib_ncurses_initscr=yes

define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr \
		--with-openssl=$(STAGING_DIR)/usr/lib \
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
