include $(TOPDIR)/rules.mk

PKG_NAME:=libparserutils
PKG_VERSION:=0.0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=http://www.netsurf-browser.org/projects/releases/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libparserutils
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=LibParserUtils has some built-in charset converters
	URL:=http://www.netsurf-browser.org/projects/libparserutils/
	DEPENDS:=
endef

define Package/libparserutils/description
	LibParserUtils has the following built-in charset converters. UTF-8, UTF-16 (platform-native endian), ISO-8859-n, Windows-125n, US-ASCII.
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

define Package/libparserutils/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/libparserutils.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libparserutils))
