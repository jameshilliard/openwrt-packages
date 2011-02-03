# 
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for the Zgv

# On the nanonote you might need export SVGALIB_DEFAULT_MODE=54
# for applications to work correctly.

include $(TOPDIR)/rules.mk

PKG_NAME:=zgv
PKG_VERSION:=5.9
PKG_RELEASE:=2
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.svgalib.org/rus/zgv/
PKG_MD5SUM:=d65a434ddeb612f0c488177f873afad2
#PKG_INSTALL:=1
#PKG_FIXUP:=libtool

PKG_BUILD_DEPENDS:= zgv/host

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/zgv/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Picture Viewer featuring Thumbnails
  URL:=http://www.svgalib.org/rus/zgv/
endef

define Package/zgv/Default/description
gv is a picture viewer with a thumbnail-based file selector, for the Linux 
and FreeBSD console (it uses svgalib). It\'s pretty featureful, and is 
probably the best svgalib-based viewer. 
endef

define Package/zgv
$(call Package/zgv/Default)
  TITLE += 
  DEPENDS:=+svgalib +zlib +libjpeg +libpng +libtiff
endef

define Package/zgv/description
$(call Package/zgv/Default/description)
endef

#
# ZGV build some tools that it needs during compilation.  Compile those as a
# 'hos' compile step.  Be careful to not add a dependency on a host-version of
# svgalib
#
define Host/Configure
endef

define Host/Compile
	$(MAKE) -C $(HOST_BUILD_DIR)/src bdf2h
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/bin
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/src/bdf2h \
		$(STAGING_DIR_HOST)/bin/zgv-bdf2h
endef

TARGET_CFLAGS += 

#TARGET_LDFLAGS += -Wl,-rpath -Wl,$(STAGING_DIR)/usr/lib

# Nothing todo.  Makefile.cfg adapted via patch
define Build/Configure
endef 

#MAKE_FLAGS += -j2


define Build/Compile
	$(call Build/Compile/Default, -j4)
endef

define Package/zgv/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/zgv $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) files/zgv.conf $(1)/etc/
endef


$(eval $(call HostBuild))
$(eval $(call BuildPackage,zgv))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "cd ~/src/nanonote/zgv-5.9 && ~/bin/quilt-export target && make -C ~/h/src/qi/openwrt-xburst package/zgv/compile -j2 V=99"
# End:
