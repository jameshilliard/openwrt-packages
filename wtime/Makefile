include $(TOPDIR)/rules.mk

PKG_NAME:=wtime
PKG_VERSION:=0.2
PKG_RELEASE:=2

PKG_SOURCE:=wtime_0_2.tar.gz
PKG_SOURCE_URL:=@SF/wtime
PKG_MD5SUM:=59c2d41048706993ca260afcdab337c3
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/wtime

include $(INCLUDE_DIR)/package.mk

define Package/wtime
	SECTION:=utils
	CATEGORY:=Utilities
	DEPENDS:=
	TITLE:=WTime time tracker
	URL:=http://wtime.sourceforge.net
endef

define Package/wtime/description
  Time tracking command-line utility.
endef

define Build/Configure
        $(call Build/Compile/Default, \
        )
endef


define Package/wtime/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wtime $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/root/.wtimed/
	$(INSTALL_DIR) $(1)/usr/share/
	$(INSTALL_DIR) $(1)/usr/share/wtime/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/LICENCE $(1)/usr/share/wtime/
endef

$(eval $(call BuildPackage,wtime))
