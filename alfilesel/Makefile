# 
# Copyright (C) 2012 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package that compile a simple allegro game library file dialog
# helper application.

include $(TOPDIR)/rules.mk

PKG_NAME:=alfilesel
PKG_VERSION:=0.1.0
PKG_RELEASE:=2
#PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
#PKG_SOURCE_URL:=@SF/forth-brainless
#PKG_MD5SUM:=ed4a4cbbe23628b17edc5aa01f32f7fb
#PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/alfilesel
  SECTION:=utilities
  CATEGORY:=Utilities
  CATEGORY:=Games
  MAINTAINER:="David Kuehling" <dvdkhlng TA gmx TOD de>
  TITLE:=Graphical file selector app to use in shell scripts
  DEPENDS:=+liballegro +liballegro-jpeg +liballegro-png
endef

define Package/alfilesel/description
A graphical file selector dialog using the allegro game library.  Use it
to make allow gmenu2x shortcuts start applications that don\'t provide a menu
themselves (such as mplayer).
endef

define Build/Configure

endef 

TARGET_LDFLAGS +=  -ljpgalleg -lloadpng -lalleg -lpng -lz -lm -lpthread -lrt

define Build/Configure
	$(CP) ./files/alfilesel.c $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(call Build/Compile/Default, alfilesel)
endef

define Package/alfilesel/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/alfilesel $(1)/usr/bin/
endef

$(eval $(call BuildPackage,alfilesel))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/alfilesel/compile -j2 V=99"
# End:
