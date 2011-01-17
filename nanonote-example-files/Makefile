include $(TOPDIR)/rules.mk

PKG_NAME:=nanonote-example-files
PKG_VERSION:=1.0

include $(INCLUDE_DIR)/package.mk

define Package/nanonote-example-files
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    TITLE:=nanonote-example-files
    SECTION:=utils
    CATEGORY:=Utilities
endef

define Package/nanonote-example-files/description
    Example Music files, etc.
endef

define Build/Compile
endef

define Package/nanonote-example-files/install
	$(INSTALL_DIR) $(1)/root/
	$(CP) ./files/* $(1)/root/
endef

$(eval $(call BuildPackage,nanonote-example-files))
