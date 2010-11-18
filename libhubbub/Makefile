include $(TOPDIR)/rules.mk

PKG_NAME:=libhubbub
PKG_VERSION:=0.0.2
PKG_RELEASE:=1

PKG_SOURCE:=hubbub-$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=http://www.netsurf-browser.org/projects/releases/
PKG_BUILD_DIR:=$(BUILD_DIR)/hubbub-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libhubbub
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Hubbub is an HTML5 compliant parsing library
	URL:=http://www.netsurf-browser.org/projects/hubbub/
	DEPENDS:=+libparserutils
endef

define Package/libhubbub/description
	Hubbub is an HTML5 compliant parsing library, written in C. It was developed as part of the NetSurf project and is available for use by other software under the MIT licence.
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	#$(CP) $(PKG_INSTALL_DIR)/usr/local/include/physfs.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	#$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/libhubbub.so* $(1)/usr/lib/
endef

define Package/libhubbub/install
	$(INSTALL_DIR) $(1)/usr/lib
	#$(CP) $(PKG_BUILD_DIR)/libhubbub.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libhubbub))
