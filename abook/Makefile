include $(TOPDIR)/rules.mk

PKG_NAME:=abook
PKG_VERSION:=0.5.6
PKG_RELEASE:=2

PKG_SOURCE:=abook-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/abook
	PKG_MD5SUM:=87d25df96864a7c507a4965e6d1da49d
	PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/abook-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/abook
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=abook
	URL:=http://abook.sourceforge.net/
	DEPENDS:= +libreadline +libncurses @BROKEN
endef

define Package/abook/description
	Simple address book program.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr \
	)
endef

#define Build/Configure
#	(cd $(PKG_BUILD_DIR); \
#		$(TARGET_CONFIGURE_OPTS) \
#		CFLAGS="$(TARGET_CFLAGS) $(FPIC)" \
#		UNAME_S="Linux" \
#		./configure \
#		--host=mipsel \
#			--prefix=/usr \
#	);
#endef


define Package/abook/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/abook $(1)/usr/bin/
endef

$(eval $(call BuildPackage,abook))
