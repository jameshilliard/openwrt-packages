# 
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for the libGGI

include $(TOPDIR)/rules.mk

PKG_NAME:=libggi
PKG_VERSION:=2.2.2
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).src.tar.gz
PKG_SOURCE_URL:=@SF/ggi
PKG_MD5SUM:=4fa672b1403c9f06e8cb35e699a693f1
PKG_BUILD_DIR:=$(BUILD_DIR)/libggi-$(PKG_VERSION)
PKG_INSTALL:=1

PKG_FIXUP:=libtool
PKG_REMOVE_FILES:=aclocal.m4 acinclude.m4

include $(INCLUDE_DIR)/package.mk

define Package/libggi/Default
  SECTION:=libs
  CATEGORY:=Libraries
  URL:=http://www.ggi-project.org/packages/libggi.html
endef

define Package/libggi/Default/description
LibGGI is the central library in the GGI project, hence the name.

It provides an opaque interface to the display\'s acceleration functions. It
was originally intended to allow user programs to interface with KGI, the GGI
Kernel Graphics Interface, but other display types can be easily used by
loading the appropriate \"display target\" (e.g. X, memory).
endef

define Package/libggi
$(call Package/libggi/Default)
  TITLE += (library)
  DEPENDS:=+libgii 
#+directfb
endef

define Package/libggi/description
$(call Package/libggi/Default/description)
This package contains the library files.
endef


define Package/libggi-programs
$(call Package/libggi/Default)
  TITLE += (programs)
  DEPENDS:=+libggi
#+directfb
endef

define Package/libggi-programs/description
 $(call Package/libggi/Default/description)
This package contains the test and example programs for libggi.
endef

TARGET_LDFLAGS += -Wl,-rpath-link -Wl,$(STAGING_DIR)/usr/lib
CONFIGURE_VARS += ac_cv_func_mmap_fixed_mapped=yes

TARGET_CPPFLAGS += \
	-I$(STAGING_DIR)/usr/include/directfb \

# searches for fusion* headers that are not present.  different version?
CONFIGURE_ARGS += \
	--disable-x \
	--with-gii=$(STAGING_DIR)/usr/lib \
	--disable-directfb

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
		$(PKG_INSTALL_DIR)/usr/lib/*.{a,la,so*} \
		$(1)/usr/lib/
endef

define Package/libggi/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ggi $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/etc/ggi
	$(CP) $(PKG_INSTALL_DIR)/etc/ggi/* $(1)/etc/ggi/
endef


define Package/libggi-programs/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libggi))
$(eval $(call BuildPackage,libggi-programs))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/libggi/compile -j2 V=99"
# End:
