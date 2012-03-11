include $(TOPDIR)/rules.mk

PKG_NAME:=dopewars
PKG_VERSION:=1.5.12

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.sourceforge.net/dopewars/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/dopewars/Default
    SECTION:=games
    CATEGORY:=Games
    TITLE:=DopeWars
endef

define Package/dopewars/description
    Drug selling game. Needs more porting to fit the Ben screen better but now at least works.
endef

define Package/dopewars
    $(call Package/dopewars/Default)
    DEPENDS:=$(ICONV_DEPENDS) $(INTL_DEPENDS) +libgconf2 +gtk2 +libstdcpp +libsigcxx
endef


TARGET_LDFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

#CONFIGURE_CMD =./autogen.sh
CONFIGURE_ARGS += \
	--disable-dependency-tracking \
	--disable-libtool-lock \
	--without-esd \
	--without-sdl \
	--disable-gui-server \
	--disable-nls \
	--disable-gui-client \
	--without-nls \
	--disable-server \
	--disable-networking

define Package/dopewars/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/share/pixmaps

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/dopewars \
		$(1)/usr/bin/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pixmaps/dopewars-weed.png \
		$(1)/usr/share/pixmaps/
endef

$(eval $(call BuildPackage,dopewars))
