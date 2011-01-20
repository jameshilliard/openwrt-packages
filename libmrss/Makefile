include $(TOPDIR)/rules.mk

PKG_NAME:=libmrss
PKG_VERSION:=0.19.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.autistici.org/bakunin/$(PKG_NAME)/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libmrss
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Libmrss
	URL:=http://www.autistici.org/bakunin/libmrss/doc/
	DEPENDS:=+libcurl +libnxml
endef

CONFIGURE_ARGS += --prefix=/usr
TARGET_LDFLAGS += -Wl,-rpath-link -Wl,$(STAGING_DIR)/usr/lib

define Package/libmrss/description
	mRss is a FreeSoftware project released under LGPL 2.0.
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	$(MAKE_VARS) $(MAKE) -C $(PKG_BUILD_DIR) \
		$(MAKE_FLAGS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Package/libmrss/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmrss.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libmrss))
