include $(TOPDIR)/rules.mk

PKG_NAME:=xz
PKG_VERSION:=4.999.9beta
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://tukaani.org/xz
PKG_MD5SUM:=f2073579b6da2fe35d453adee1aaf1b2

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/xz
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libpthread
  TITLE:=xz utils
  URL:=http://tukaani.org/
endef

TARGET_CFLAGS += -std=c99

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/xz/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_NAME) $(1)/usr/bin/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.{a,la,so*} $(1)/usr/lib/
endef

$(eval $(call BuildPackage,xz))
