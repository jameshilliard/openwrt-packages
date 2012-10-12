include $(TOPDIR)/rules.mk

PKG_NAME:=libnsgif
PKG_VERSION:=0.0.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=http://download.netsurf-browser.org/libs/releases/
PKG_MD5SUM:=1f9efcdbbf0096eee639dc1e263b20dc

include $(INCLUDE_DIR)/package.mk

define Package/libnsgif
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=GIF decoding library
	URL:=http://www.netsurf-browser.org/projects/libnsgif
endef

define Package/libnsgif/description
	Libnsgif is a decoding library for the GIF image file format, written in C. It was developed as part of the NetSurf project and is available for use by other software under the MIT licence.
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	$(MAKE_VARS) $(MAKE) -C $(PKG_BUILD_DIR) \
		$(MAKE_FLAGS) \
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

define Package/libnsgif/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/libnsgif.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libnsgif))
