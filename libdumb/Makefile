# 
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for the libdumb -- the Dynamic Universal Music Bibliotheque

include $(TOPDIR)/rules.mk

PKG_NAME:=libdumb
PKG_VERSION:=0.9.3
PKG_RELEASE:=1
PKG_SOURCE:=dumb-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/dumb
PKG_MD5SUM:=f48da5b990aa8aa822d3b6a951baf5c2
PKG_BUILD_DIR:=$(BUILD_DIR)/dumb-$(PKG_VERSION)
PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=

include $(INCLUDE_DIR)/package.mk

define Package/libdumb
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Dynamic Universal Music Bibliotheque
  URL:=http://www.ggi-project.org/packages/libdumb.html
  DEPENDS:=liballegro
endef

define Package/libdumb/description
DUMB is a library for playing back IT, XM, S3M and MOD audio files
endef

TARGET_CPPFLAGS += -Iinclude
TARGET_LDFLAGS +=
MAKE_FLAGS += \
	ALL_TARGETS="core core-headers allegro allegro-examples allegro-headers" \
	PREFIX=/usr \
	CFLAGS_RELEASE="$(TARGET_CFLAGS) $(EXTRA_CFLAGS) $(TARGET_CPPFLAGS)" \
	CFLAGS_DEBUG="$(TARGET_CFLAGS) $(EXTRA_CFLAGS) $(TARGET_CPPFLAGS)" \
	LINK_ALLEGRO="-L$(STAGING_DIR)/usr/lib -lalleg"

define Build/Configure
	echo "include make/unix.inc" > $(PKG_BUILD_DIR)/make/config.txt
endef 

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/Install
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/usr/{bin,lib,include}
	$(call Build/Install/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.a \
		$(1)/usr/lib/
endef

# currently no .so in package, as only static lib produced :/

define Package/libdumb/install
	$(INSTALL_DIR) $(1)/usr/bin
#	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libdumb))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/libdumb/compile -j2 V=99"
# End:
