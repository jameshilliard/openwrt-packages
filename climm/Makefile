# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=climm
PKG_VERSION:=0.7.1
PKG_RELEASE:=1

PKG_SOURCE:=climm-$(PKG_VERSION).tgz
	PKG_SOURCE_URL:=http://www.climm.org/source/
	#PKG_MD5SUM:=887415d16c32af58eab2ec2d9bb17fa6
	PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/climm-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/climm
	SECTION:=network
	CATEGORY:=Network
	TITLE:=Climm
	DEPENDS:=+zlib +libncurses +libreadline +libintl +libcharset +libopenssl +libgnutls +libgnutls-openssl
	URL:=http://www.climm.org/
endef

define Package/climm/description
	Terminal Jabber client.
endef

EXTRA_CFLAGS += \
        -I$(STAGING_DIR)/usr/lib/libintl/include \
        -I$(STAGING_DIR)/usr/lib/libiconv/include \
        -I$(STAGING_DIR)/usr/include

EXTRA_LDFLAGS += \
        -L$(STAGING_DIR)/usr/lib/libintl/lib \
        -L$(STAGING_DIR)/usr/lib/libiconv/lib -lm -lz


define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr --with-ssl  \
		export READLINE=1 \
	)
endef

define Package/climm/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/climm $(1)/usr/bin/
endef

$(eval $(call BuildPackage,climm))
