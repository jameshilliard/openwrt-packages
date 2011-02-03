include $(TOPDIR)/rules.mk

PKG_NAME:=nanonote-files
PKG_VERSION:=1.0

include $(INCLUDE_DIR)/package.mk

define Package/nanonote-files/Default
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    TITLE:=NanoNote Files
    SECTION:=utils
    CATEGORY:=Utilities
endef

define Package/nanonote-example-files
    $(call Package/nanonote-files/Default)
    TITLE+=(Example Files)
endef

define Package/nanonote-script-files
    $(call Package/nanonote-files/Default)
    TITLE+=(Script Files)
endef

define Build/Compile
endef

define Package/nanonote-example-files/install
	$(CP) ./example-files/* $(1)/
endef

define Package/nanonote-script-files/install
	$(CP) ./script-files/* $(1)/
endef

$(eval $(call BuildPackage,nanonote-example-files))
$(eval $(call BuildPackage,nanonote-script-files))
