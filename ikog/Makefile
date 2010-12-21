include $(TOPDIR)/rules.mk

PKG_NAME:=ikog
PKG_VERSION:=1.90
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/ikog
    TITLE:=ikog
    SECTION:=utils
    CATEGORY:=Utilities
    DEPNEDS:=python
endef

define Package/ikog/description
    the simple todo list
endef

define Build/Prepare
	( \
	mkdir $(PKG_BUILD_DIR); \
	cd $(PKG_BUILD_DIR); \
	wget http://www.henspace.co.uk/ikog/app/$(PKG_NAME).py.gz; \
	gzip -d $(PKG_NAME).py.gz; \
	)
endef

define Build/Compile
endef

define Package/ikog/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ikog.py $(1)/usr/bin
endef

$(eval $(call BuildPackage,ikog))