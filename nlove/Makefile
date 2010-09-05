include $(TOPDIR)/rules.mk

PKG_NAME:=nlove
PKG_VERSION:=0.0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://dl.dropbox.com/u/440010/nlove/
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/nlove
	SECTION:=games
	CATEGORY:=Games
	TITLE:=LÖVE
	DEPENDS:=+libphysfs libsdl libsdl-image libsdl-gfx libsdl-mixer
	URL:=http://bartbes.ath.cx/
endef

define Package/nlove/description
	The LÖVE 2D lua game engine.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR);\
	 IN_OPENWRT=1 \
	 AR="$(TARGET_CROSS)ar" \
	 AS="$(TARGET_CC) -c $(TARGET_CFLAGS) $(TARGET_COPTS)" \
	 LD="$(TARGET_CROSS)ld" \
	 NM="$(TARGET_CROSS)nm" \
	 CC="$(TARGET_CC)" \
	 GCC="$(TARGET_CC)" \
	 CXX="$(TARGET_CROSS)g++" \
	 RANLIB="$(TARGET_CROSS)ranlib" \
	 STRIP="$(TARGET_CROSS)strip" \
	 OBJCOPY="$(TARGET_CROSS)objcopy" \
	 OBJDUMP="$(TARGET_CROSS)objdump" \
	 TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
	 TARGET_CFLAGS="$(TARGET_CFLAGS) $(TARGET_COPTS)" \
	 TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
	 STAGING_DIR="$(STAGING_DIR)" \
	 CFLAGS="-fhonour-copts -std=gnu99" \
	 CXXFLAGS="-fhonour-copts" \
	cmake . -DCMAKE_CXX_FLAGS=-g);$
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR); \
	CFLAGS="-fhonour-copts --std=gnu99" \
	CXXFLAGS="-fhonour-copts --std=gnu99" \
	make);$
endef


define Package/nlove/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/liblove.so $(1)/usr/lib/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nlove $(1)/usr/bin/
endef

$(eval $(call BuildPackage,nlove))
