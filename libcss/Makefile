include $(TOPDIR)/rules.mk

PKG_NAME:=libcss
PKG_VERSION:=0.0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=http://www.netsurf-browser.org/projects/releases/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libcss
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=LibCSS is a CSS parser and selection engine, written in C
	URL:=http://www.netsurf-browser.org/projects/libcss/
	DEPENDS:=@BROKEN
endef

define Package/libcss/description
	LibCSS is a CSS parser and selection engine, written in C. It aims to parse the forward compatible CSS grammar. It was developed as part of the NetSurf project
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	#$(CP) $(PKG_INSTALL_DIR)/usr/local/include/physfs.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	#$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/libcss.so* $(1)/usr/lib/
endef

define Package/libcss/install
	#$(INSTALL_DIR) $(1)/usr/lib
	#$(CP) $(PKG_BUILD_DIR)/libcss.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libcss))
