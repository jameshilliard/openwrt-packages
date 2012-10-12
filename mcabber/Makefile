# $Id: Makefile 5624 2006-11-23 00:29:07Z Jirka $

include $(TOPDIR)/rules.mk

PKG_NAME:=mcabber
PKG_VERSION:=0.9.10
PKG_RELEASE:=3
# http://mcabber.com/files/mcabber-0.10.0.tar.bz2

PKG_SOURCE:=mcabber-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://mcabber.com/files/
PKG_MD5SUM:=887415d16c32af58eab2ec2d9bb17fa6
PKG_CAT:=bzip2 -cd

PKG_BUILD_DIR:=$(BUILD_DIR)/mcabber-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/mcabber
	SECTION:=network
	CATEGORY:=Network
	TITLE:=Mcabber
	DEPENDS:=+libncursesw +libreadline $(INTL_DEPENDS) $(ICONV_DEPENDS) +libcharset +libopenssl +glib2
	URL:=http://mcabber.com/
endef

define Package/mcabber/description
	Terminal Jabber client.
endef

EXTRA_CFLAGS += \
        -I$(STAGING_DIR)/usr/include

EXTRA_LDFLAGS += \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-lm


define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr --disable-opensearch --with-ssl  --disable-gpgme \
		export READLINE=1 \
	)
endef

define Package/mcabber/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/mcabber/help/en/
	$(INSTALL_DIR) $(1)/root/.mcabber/

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/mcabber $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/doc/help/en/*.txt $(1)/usr/share/mcabber/help/en/
	$(INSTALL_DATA) ./files/mcabberrc.example $(1)/root/.mcabber/mcabberrc
endef

$(eval $(call BuildPackage,mcabber))
