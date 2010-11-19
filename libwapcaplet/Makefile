include $(TOPDIR)/rules.mk

PKG_NAME:=libwapcaplet
PKG_VERSION:=0.0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=http://www.netsurf-browser.org/projects/releases/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libwapcaplet
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Libwapcaplet is a string internment library, written in C
	URL:=http://www.netsurf-browser.org/projects/libwapcaplet/
endef

define Package/libwapcaplet/description
	LibWapcaplet is a string internment library, written in C. It provides reference counted string interment and rapid string comparison functionality. It was developed as part of the NetSurf project.
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		COMPONENT_TYPE=lib-shared \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/local/include/* $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/* $(1)/usr/lib/
endef

define Package/libwapcaplet/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/libwapcaplet.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libwapcaplet))
