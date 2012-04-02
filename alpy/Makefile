# 
# Copyright (C) 2012 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for Alpy: Allegro Game Library bindings for Python

include $(TOPDIR)/rules.mk

PKG_NAME:=alpy
PKG_VERSION:=0.1.5
PKG_RELEASE:=2
PKG_SOURCE:=Alpy-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/project/pyallegro/alpy/alpy-$(PKG_VERSION)
PKG_MD5SUM:=862925d97931fc81d1e4c3b9159fe2b1
PKG_BUILD_DIR:=$(BUILD_DIR)/Alpy-$(PKG_VERSION)
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/alpy/Default
  SECTION:=libs
  CATEGORY:=Languages
  TITLE:=Alpy (Allegro bindings for Python)
  URL:=http://pyallegro.sourceforge.net/alpy.php
  DEPENDS:=+python-mini +liballegro +liballegro-png +liballegro-jpeg
  MAINTAINER:="David Kuehling" <dvdkhlng TA gmx TOD de>
endef

define Package/alpy/Default/description
Python bindings for the Allegro Game and Graphics Library
endef

# note: needs thee the data-files from liballegro-demo for demo.py and others.
define Package/alpy
$(call Package/alpy/Default)
endef

define Package/alpy/description
$(call Package/alpy/Default/description)
endef

define Package/alpy-examples
$(call Package/alpy/Default)
  TITLE:=Alpy Example Python Scripts
  DEPENDS:=+alpy +liballegro-demo 
endef

define Package/alpy-examples/description
$(call Package/alpy/Default/description)
This package contains the example python scripts, installed to /usr/share/alpy.
First cd to the directory before running the scripts!
endef

define Build/Compile
	$(call Build/Compile/PyMod,,build)
endef
# --prefix="$(PKG_INSTALL_DIR)/usr"	, \
# 	LOCALBASE="$(STAGING_DIR)/usr" \
# 	NO_SCRAP=1 \
# )

# define Build/Configure
# #	$(call Build/Configure/Default)
# endef 

# define Build/Compile
# 	CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(EXTRA_CFLAGS) $(TARGET_LDFLAGS)" \
# 		$(PKG_BUILD_DIR)/setup.py build
# endef

# Note: this linking command will not work correctly when jpgalleg or loadpng
# are linked statically (Note how we patched allegro to make sure these are
# always compiled as dynamic libraries).  The problem probably is, that
# Build/Compile adds these linking options to early in the command line, and
# static libraries won't resolve symbols of objects added later on.
#
# You won't even see a compiler error; the resulting _alpy.so would be going
# to segfault due to an unresolved (0-pointer) symbol.
TARGET_LDFLAGS += -ljpgalleg -lloadpng -lalleg -lpng -lz -lm -lpthread -ldl -lrt

define Build/Install
	$(call Build/Compile/PyMod,, \
		install --root $(PKG_INSTALL_DIR) --prefix=/usr)
endef 

# define Package/alpy/install
# 	$(INSTALL_DIR) $(1)/usr
# 	$(CP) $(PKG_INSTALL_DIR)/usr/* $(1)/usr/
# endef

define PyPackage/alpy/filespec
+|$(PYTHON_PKG_DIR)/alpy.py
+|$(PYTHON_PKG_DIR)/_alpy.so
endef

define Package/alpy-examples/install
	$(INSTALL_DIR) $(1)/usr/share/alpy/examples
	$(CP) $(PKG_BUILD_DIR)/examples/* $(1)/usr/share/alpy/examples/
endef

$(eval $(call PyPackage,alpy))
$(eval $(call BuildPackage,alpy))
$(eval $(call BuildPackage,alpy-examples))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "cd ~/src/nanonote/Alpy-0.1.5 && ~/bin/quilt-export target && make -C ~/h/src/qi/openwrt-xburst package/alpy/compile -j2 V=99"
# End:
