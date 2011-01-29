# 
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for the SVGAlib

# On the nanonote you might need export SVGALIB_DEFAULT_MODE=54
# for applications to work correctly.

include $(TOPDIR)/rules.mk

PKG_NAME:=svgalib
PKG_VERSION:=1.4.3
PKG_RELEASE:=2
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.svgalib.org/
PKG_MD5SUM:=7d2778e3beebc07dd7c74668f6887c6f
PKG_INSTALL:=1
#PKG_FIXUP:=libtool

#PKG_BUILD_DEPENDS:= libtool/host

include $(INCLUDE_DIR)/package.mk


define Package/svgalib/Default
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Linux SVGA Library
  URL:=http://www.svgalib.org/
endef

define Package/svgalib/Default/description
SVGAlib is a low-level graphics library for Linux.  
This package compiles a portable version that only contains the Linux 
framebuffer driver.
endef

define Package/svgalib
$(call Package/svgalib/Default)
  TITLE += 
  DEPENDS:=
endef

define Package/svgalib/description
$(call Package/svgalib/Default/description)
endef


define Package/svgalib-demo
$(call Package/svgalib/Default)
  TITLE += (demo programs)
  DEPENDS:=svgalib
endef

define Package/svgalib-demo/description
$(call Package/svgalib/Default/description)
This package contains the demo programs.
endef

TARGET_CFLAGS += 

#TARGET_LDFLAGS += -Wl,-rpath -Wl,$(STAGING_DIR)/usr/lib

# Nothing todo.  Makefile.cfg adapted via patch
define Build/Configure
endef 

#MAKE_FLAGS += -j2

SVGALIB_BUILD_TARGETS = \
	shared \
	static

SVGALIB_INSTALL_TARGETS = \
	installstaticlib \
	installsharedlib \
	installheaders \
	installconfig

ifdef CONFIG_PACKAGE_svgalib-demo
SVGALIB_BUILD_TARGETS += demoprogs
define SVGALIB_COMPILE_DEMO
	$(INSTALL_DIR) $(PKG_BUILD_DIR)/tmp-install/usr/lib
	$(call Build/Compile/Default,installsharedlib DESTDIR=$(PKG_BUILD_DIR)/tmp-install)
	$(call Build/Compile/Default,demoprogs LDFLAGS+="-L$(PKG_BUILD_DIR)/tmp-install/usr/lib")
endef
else
SVGALIB_COMPILE_DEMO:=
endif

define Build/Compile
	$(call Build/Compile/Default,shared static)
	$(call SVGALIB_COMPILE_DEMO)
endef

define Build/Install
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/etc/
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/usr/lib
	$(call Build/Install/Default,\
		installstaticlib installsharedlib installheaders installconfig)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{a,so*} \
		$(1)/usr/lib/
endef


define Package/svgalib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
	$(INSTALL_DIR) $(1)/etc/vga
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/vga/* \
		$(1)/etc/vga/
endef

define Package/svgalib-demo/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $$$$(find $(PKG_BUILD_DIR)/demos -executable -type f) \
		$(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/threeDKit/{plane,wrapdemo} \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,svgalib))
$(eval $(call BuildPackage,svgalib-demo))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "cd ~/src/nanonote/svgalib-1.4.3 && ~/bin/quilt-export target && make -C ~/h/src/qi/openwrt-xburst package/svgalib/compile -j2 V=99"
# End:
