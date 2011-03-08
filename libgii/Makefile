# 
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for the libGII

include $(TOPDIR)/rules.mk

PKG_NAME:=libgii
PKG_VERSION:=1.0.2
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).src.tar.gz
PKG_SOURCE_URL:=@SF/ggi
PKG_MD5SUM:=205ca1d87042c8e4aafecd6da7c9de39
PKG_BUILD_DIR:=$(BUILD_DIR)/libgii-$(PKG_VERSION)
PKG_INSTALL:=1
PKG_FIXUP:=libtool
PKG_REMOVE_FILES:=aclocal.m4 acinclude.m4

PKG_BUILD_DEPENDS:=

include $(INCLUDE_DIR)/package.mk

define Package/libgii
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GGI Project Input Interface Library
  URL:=http://www.ggi-project.org/packages/libgii.html
  DEPENDS:=
endef

define Package/libgii/description
LibGII is intended to be to input what our LibGGI library is to graphics.

The goal of LibGII is to provide a single easy to use, but yet powerful, API
for all possible input sources. However we are not there yet. The API is far
from set in stone yet, and is likely to change.
endef

TARGET_CFLAGS += 

# fix for dependency between libgii and libgg.  If not rpath configured
# linking with libgii and not libgg fails.
#TARGET_LDFLAGS += -Wl,-rpath -Wl,$(STAGING_DIR)/usr/lib

CONFIGURE_ARGS += \
	--enable-mutexes=builtin \
	--without-x

MAKE_FLAGS += X_CFLAGS=$(STAGING_DIR)/usr/include

define Build/Configure
	$(call Build/Configure/Default)
endef 

define Build/Compile
	$(call Build/Compile/Default,-j2)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{la,a,so*} \
		$(1)/usr/lib/
endef

define Package/libgii/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ggi $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/etc/ggi
	$(CP) $(PKG_INSTALL_DIR)/etc/ggi/* $(1)/etc/ggi/
endef

$(eval $(call BuildPackage,libgii))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/libgii/compile -j2 V=99"
# End:
