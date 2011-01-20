include $(TOPDIR)/rules.mk

PKG_NAME:=ikog
PKG_VERSION:=1.90
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME).py.gz
PKG_SOURCE_URL:=http://www.henspace.co.uk/ikog/app/
UNPACK_CMD=zcat $(DL_DIR)/$(PKG_SOURCE) > $(1)/ikog.py

include $(INCLUDE_DIR)/package.mk

define Package/ikog
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    TITLE:=ikog
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=python
endef

define Package/ikog/description
    the simple todo list
endef

define Build/Compile
endef

define Package/ikog/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ikog.py $(1)/usr/bin
endef

$(eval $(call BuildPackage,ikog))
