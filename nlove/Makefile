include $(TOPDIR)/rules.mk

PKG_NAME:=nlove
PKG_REV:=494
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://bitbucket.org/bartbes/nlove
PKG_SOURCE_PROTO:=hg
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/nlove
	SECTION:=games
	CATEGORY:=Games
	TITLE:=LÖVE
	DEPENDS:=+libphysfs +libsdl +libsdl-image +libsdl-gfx +libsdl-mixer +lua +libvorbisidec +libvorbis
	URL:=http://bartbes.ath.cx/
endef

define Package/nlove/description
	The LÖVE 2D lua game engine.
endef

define Build/Configure
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR);\
	 STAGING_DIR="$(STAGING_DIR)" \
	 CFLAGS="-fhonour-copts -std=gnu99" \
	 PLATFORM="NanoNote" \
	platform/nlove/build.sh);$
endef

define Package/nlove/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nlove $(1)/usr/bin/
	$(INSTALL_BIN) $(FILES_DIR)/nlove-run $(1)/usr/bin/
endef

$(eval $(call BuildPackage,nlove))
