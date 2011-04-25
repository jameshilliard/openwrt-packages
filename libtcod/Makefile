include $(TOPDIR)/rules.mk

PKG_NAME:=libtcod
PKG_REV:=522
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://doryen.eptalys.net/svn-libtcod/tags/1.5.0/
PKG_BUILD_DIR=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

define Package/libtcod
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Libtcod
	URL:=http://www.autistici.org/bakunin/libtcod/doc/
	DEPENDS:=+libpng +zlib +libsdl
endef

define Package/libtcod/description
	libtcod, a.k.a. “The Doryen Library”, is a free, fast, portable and uncomplicated API for roguelike developpers providing an advanced true color console, input, and lots of other utilities frequently used in roguelikes.
endef

TARGET_CFLAGS+=-fPIC
TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

MAKE_VARS+=TEMP=$(PKG_BUILD_DIR)/obj

define Build/Compile
	$(MAKE_VARS) $(MAKE) -C $(PKG_BUILD_DIR) \
		$(MAKE_FLAGS) \
		-f makefiles/makefile-linux \
		release
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libtcod.so* $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/libtcodxx.so* $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/libtcodgui.so* $(1)/usr/lib/
endef

define Package/libtcod/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libtcod.so* $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/libtcodxx.so* $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/libtcodgui.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libtcod))
