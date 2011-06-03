# 
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# Package 'freepats' digital instrument samples for use with liballegro's
# 'digmid' software-synthesized midi driver

include $(TOPDIR)/rules.mk

PKG_NAME:=liballegro-digmid
PKG_VERSION:=20060219
PKG_RELEASE:=1
PKG_SOURCE:=freepats-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://freepats.zenvoid.org/
PKG_MD5SUM:=b947806304bc559a644a2c06deda8404
PKG_BUILD_DIR:=$(BUILD_DIR)/freepats

# need liballegro host-tool 'pat2dat' for packaging the samples
PKG_BUILD_DEPENDS:=liballegro/host 

include $(INCLUDE_DIR)/package.mk

define Package/liballegro-digmid
  SUBMENU:=Liballegro
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Freepats data file for liballegro software MIDI playback
  URL:=http://freepats.zenvoid.org/
endef

define Package/liballegro-digmid/description
This package contains the freepats digital instrument samples packaged for
use with liballegro\'s DIGMID software-synthesized midi driver
endef


define Build/Configure
endef 


define Build/Compile
	cd $(PKG_BUILD_DIR) && \
	LD_LIBRARY_PATH="$(STAGING_DIR_HOST)/lib:$$$$LD_LIRARY_PATH" \
	pat2dat -o -8 -c digmid.dat crude.cfg 
endef

define Package/liballegro-digmid/install
	$(INSTALL_DIR) $(1)/usr/share/allegro
	$(CP) $(PKG_BUILD_DIR)/digmid.dat $(1)/usr/share/allegro
endef

$(eval $(call BuildPackage,liballegro-digmid))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/liballegro-digmid/compile -j2 V=99"
# End:
