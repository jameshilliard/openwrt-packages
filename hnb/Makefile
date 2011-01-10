include $(TOPDIR)/rules.mk

PKG_NAME:=hnb
PKG_VERSION:=1.9.17

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/hnb
    TITLE:=hnb
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=+libncurses
    URL:=http://hnb.sourceforge.net/
endef

define Package/hnb/description
    Powerfull outline editor/notebook for text console.
endef

define Build/Configure
        $(call Build/Compile/Default, \
              CFLAGS="-I$(STAGING_DIR)/usr/include -I. -I./src -I./src/libcli -I./libcli -I$(PKG_BUILD_DIR) -DHAVE_CONFIG_H "  \
              LIBS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib libcli/libcli.a -lm -lncurses" \
        )
endef



define Package/hnb/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/root
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/hnb $(1)/usr/bin/
	$(INSTALL_DATA) ./files/hnbrc.example $(1)/root/.hnbrc
endef

$(eval $(call BuildPackage,hnb))
