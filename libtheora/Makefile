#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libtheora
PKG_VERSION:=1.2.0alpha1
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.xiph.org/releases/theora/
PKG_MD5SUM:=a2b9b631aede517cf22dcd3f4abf8dd6
PKG_FIXUP:=libtool

PKG_BUILD_DEPENDS:=libvorbis

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/libtheora
  MAINTAINER:="David Kuehling" <dvdkhlng TA gmx TOD de>
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libtheora
  URL:=http://xiph.org/theora/
  DEPENDS:=+libogg
endef

define Package/libtheora/description
Theora is Xiph.Org\'s first publicly released video codec, intended
for use within the Foundation\'s Ogg multimedia streaming system.
Theora is derived directly from On2\'s VP3 codec. Theora adds more
degrees of freedom to the compression parameters and recent encoders
contain optimizations that make it much better than VP3\'s original code.
endef

CONFIGURE_ARGS += --disable-float \
		--disable-examples \
		--disable-oggtest \
		--disable-vorbistest \
		--disable-sdltest \

# override -Os, to not cripple theora's performance
TARGET_CFLAGS += -O2

# remove, once we're done with tuning
MAKE_FLAGS += -j4

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/theora/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/include/theora/* $(1)/usr/include/theora/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig/
endef

define Package/libtheora/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libtheora))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/libtheora/compile -j2 V=99"
# End:
