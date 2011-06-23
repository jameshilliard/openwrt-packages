# 
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# OpenWRT package for ASEPrite -- the Allegro Sprite Editor
#
# License GPLv2 or later.  NO WARRANTY.

include $(TOPDIR)/rules.mk

PKG_NAME:=ase
PKG_VERSION:=0.8.2
PKG_RELEASE:=2
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).zip
PKG_SOURCE_URL:=http://aseprite.googlecode.com/files/
PKG_MD5SUM:=ef941a91a05646c39005748b4d2178ed
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

#PKG_BUILD_DEPENDS := liballegro

include $(INCLUDE_DIR)/package.mk

define Package/ase/Default
  TITLE:=Allegro Sprite Aditor
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://www.aseprite.org/
endef

define Package/ase/Default/description
ASE (now ASEPRITE, aka Allegro Sprite Editor) is an open source program to
create animated sprites & pixel art. Sprites are little images that can be
used in your website or in a video game. You can draw characters with
movement, intros, textures, patterns, backgrounds, logos, color palettes,
isometric levels, etc.
endef

define Package/ase
$(call Package/ase/Default)
  TITLE +=
  DEPENDS:=+liballegro +libpng +libjpeg +libgd +libfreetype
endef

define Package/ase/description
$(call Package/ase/Default/description)
endef

#TARGET_LDFLAGS += -Wl,-rpath-link -Wl,$(STAGING_DIR)/usr/lib
TARGET_CPPFLAGS += -DNDEBUG
#TARGET_CPPFLAGS += -DDEBUGMODE

TARGET_LDFLAGS += -L$(STAGING_DIR)/usr/lib -lalleg

define Build/Install
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/usr/{bin,share}
$(call Build/Install/Default)
endef 

MAKE_FLAGS += \
	-f $(PKG_BUILD_DIR)/makefile.linux \
	CONFIGURED=1 RELEASE=1 DEFAULT_PREFIX=/usr \
	CPP="$(TARGET_CXX)" \
	BUILD_CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(EXTRA_CFLAGS)" \
	LIBFREETYPE_DIR=$(STAGING_DIR)/usr/include/freetype2 \
	LIBGD_DIR=$(STAGING_DIR)/usr/include/ \
	LIBJPEG_DIR=$(STAGING_DIR)/usr/include/ \
	LIBPNG_DIR=$(STAGING_DIR)/usr/include/ \
	ZLIB_DIR=$(STAGING_DIR)/usr/include/


define Package/ase/install
	$(INSTALL_DIR) $(1)/usr/{bin,share}
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/* $(1)/usr/share/
endef

$(eval $(call BuildPackage,ase))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "cd ~/src/nanonote/ase-0.8.2 && ~/bin/quilt-export target && make -C ~/h/src/qi/openwrt-xburst package/ase/compile -j2 V=99"
# End:
