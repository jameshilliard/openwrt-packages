include $(TOPDIR)/rules.mk

PKG_NAME:=abook
PKG_VERSION:=0.5.6
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=87d25df96864a7c507a4965e6d1da49d

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/abook
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=abook
	URL:=http://abook.sourceforge.net/
	DEPENDS:=+libreadline +libncursesw
endef

define Package/abook/description
	Simple address book program.
endef

CONFIGURE_ARGS+="--with-curses=$(STAGING_DIR)/lib"

define Package/abook/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/abook $(1)/usr/bin
endef

$(eval $(call BuildPackage,abook))
