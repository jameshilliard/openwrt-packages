include $(TOPDIR)/rules.mk

PKG_NAME:=picoc
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE:=picoc-$(PKG_VERSION).tar.bz2
	PKG_SOURCE_URL:=http://picoc.googlecode.com/files
	PKG_MD5SUM:=7af179f5f9351228df8a34ed7add436a
	PKG_CAT:=bzip2 -cd

PKG_BUILD_DIR:=$(BUILD_DIR)/picoc-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/picoc
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=PicoC
	URL:=http://code.google.com/p/picoc/
	#DEPENDS:= +libreadline
endef

define Package/picoc/description
	Simple C interpreter.
endef

define Build/Configure
        $(call Build/Compile/Default)
endef


define Package/picoc/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/picoc $(1)/usr/bin/
	 $(INSTALL_DIR) $(1)/usr/share/picoc/
	 $(INSTALL_DIR) $(1)/usr/share/picoc/tests/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/tests/* $(1)/usr/share/picoc/tests/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/README $(1)/usr/share/picoc/
endef

$(eval $(call BuildPackage,picoc))
