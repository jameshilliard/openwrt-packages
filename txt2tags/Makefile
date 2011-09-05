include $(TOPDIR)/rules.mk

PKG_NAME:=txt2tags
PKG_VERSION:=2.6
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://txt2tags.googlecode.com/files/
PKG_MD5SUM:=ac09fd624f1e3a553d5f0e01271cc0ee
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/txt2tags
    TITLE:=txt2tags
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=+python
endef

define Package/txt2tags/description
    Tagged text converter (to LaTeX, ODT,...).
endef

define Build/Compile
endef

define Package/txt2tags/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/txt2tags $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/share/txt2tags
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/samples/sample.txt $(1)/usr/share/txt2tags
endef

$(eval $(call BuildPackage,txt2tags))
