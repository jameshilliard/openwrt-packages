# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=climm
PKG_VERSION:=0.7.1
PKG_RELEASE:=1

PKG_SOURCE:=climm-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://www.climm.org/source/
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/climm-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/climm
	SECTION:=network
	CATEGORY:=Network
	TITLE:=Climm
	URL:=http://www.climm.org/
	DEPENDS:=+zlib +libncurses +libreadline $(INTL_DEPENDS) +libcharset +libopenssl +libgnutls +libgnutls-openssl
endef

define Package/climm/description
	Terminal Jabber client.
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include
TARGET_LDFLAGS += -lm -lz

# when enalbe xmpp, the IKS_LIBS get wrong value
CONFIGURE_ARGS += --disable-xmpp

define Package/climm/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/climm $(1)/usr/bin/
endef

$(eval $(call BuildPackage,climm))
