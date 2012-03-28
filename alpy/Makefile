# 
# Copyright (C) 2012 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for Alpy: Allegro Game Library bindings for Python

include $(TOPDIR)/rules.mk

PKG_NAME:=alpy
PKG_VERSION:=0.1.5
PKG_RELEASE:=1
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
  URL:=https://sourceforge.net/projects/forth-alpy/
  DEPENDS:=+python-mini +liballegro
endef

define Package/alpy/Default/description
Python bindings for the Allegro Game and Graphics Library
endef

define Package/alpy
$(call Package/alpy/Default)
endef

define Package/alpy/description
$(call Package/alpy/Default/description)
endef

CONFIGURE_ARGS += 

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

TARGET_LDFLAGS += -lalleg -lm -lpthread

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

$(eval $(call PyPackage,alpy))
$(eval $(call BuildPackage,alpy))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/alpy/compile -j2 V=99"
# End:
