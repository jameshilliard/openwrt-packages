# 
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for the GNU Octave

include $(TOPDIR)/rules.mk

PKG_NAME:=octave
PKG_VERSION:=3.2.4
PKG_RELEASE:=2
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.octave.org/pub/octave/
PKG_MD5SUM:=90c39fa9e241ad2e978bcee4682a2ba9
PKG_INSTALL:=1
PKG_FIXUP:=libtool

PKG_BUILD_DEPENDS:= libtool/host @INSTALL_GFORTRAN 

#include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/octave/Default
  SUBMENU:=Octave
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=GNU Octave
  URL:=http://www.gnu.org/software/octave/
  SUBMENU:=Octave
endef

define Package/octave/Default/description
GNU Octave is a high-level language, primarily intended for numerical
computations. It provides a convenient command line interface for solving
linear and nonlinear problems numerically, and for performing other numerical
experiments using a language that is mostly compatible with Matlab. It may
also be used as a batch-oriented language.
endef

# todo: graphicsmagick package from multimedia feed is not complete.  We need
# the Magick++ library and the Magick++-config script installed.
define Package/octave
$(call Package/octave/Default)
  DEPENDS:= +libltdl +zlib +libpcre +libncurses +libreadline +libgfortran \
	+octave-data
#+fftw3
#+GraphicsMagick 
  TITLE+= (executable)
endef

define Package/octave/description
$(call Package/octave/Default/description)
 This package contains the Octave executable files
endef

define Package/octave-data
$(call Package/octave/Default)
  TITLE+= (function files)
endef

define Package/octave-data/description
$(call Package/octave/Default/description)
 This package contains the platform-independant .m-files.
endef

# fftw contains a lots of code.  not much use for soft-float anyways.  try to
# keep memory low and go without fftw (using smaller fftpack instead).
# todo: verify how much RAM that actually safes
# todo : need -enable-rpath?
CONFIGURE_ARGS += --without-x --without-fftw 
#MAKE_FLAGS += "LD=$(TARGET_CROSS)gcc -nostdlib" 

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default,-j2)
endef

define Build/Install
	$(call Build/Install/Default)
#	$(INSTALL_DATA) ./files/... $(PKG_INSTALL_DIR)/usr/share/octave/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/octave-$(PKG_VERSION)/octave
	$(CP) $(PKG_INSTALL_DIR)/usr/include/octave-$(PKG_VERSION)/octave/*.h \
		$(1)/usr/include/octave-$(PKG_VERSION)/octave/

	$(INSTALL_DIR) $(1)/usr/lib/octave
	$(INSTALL_DIR) $(1)/usr/lib/octave-$(PKG_VERSION)
	$(CP) -r $(PKG_INSTALL_DIR)/usr/lib/octave/* \
		$(1)/usr/lib/octave/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/octave-$(PKG_VERSION)/* \
		$(1)/usr/lib/octave-$(PKG_VERSION)/

	$(INSTALL_DIR) $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/octave-config-$(PKG_VERSION) \
		$(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mkoctfile-$(PKG_VERSION) \
		$(1)/usr/bin/
	$(SED) 's;\(DEFAULT_[A-Z]*DIR="\)/usr;\1$(STAGING_DIR)/usr;g' \
		$(1)/usr/bin/mkoctfile-$(PKG_VERSION)
	$(LN) mkoctfile-$(PKG_VERSION) $(1)/usr/bin/mkoctfile
	$(LN) octave-config-$(PKG_VERSION) $(1)/usr/bin/octave-config
endef

define Package/octave/install
	$(INSTALL_DIR) $(1)/usr
	cp -r $(PKG_INSTALL_DIR)/usr/{bin,lib} $(1)/usr
endef

define Package/octave-data/install
	$(INSTALL_DIR) $(1)/
	(cd $(PKG_INSTALL_DIR)/ && tar -cf - usr/share) \
	    | (cd $(1)/ && tar -xvf -)
endef

#$(eval $(call HostBuild))
$(eval $(call BuildPackage,octave))
$(eval $(call BuildPackage,octave-data))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/octave/compile -j2 V=99"
# End:
