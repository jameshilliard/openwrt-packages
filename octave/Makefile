# 
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for the GNU Octave

include $(TOPDIR)/rules.mk

PKG_NAME:=octave
PKG_VERSION:=3.2.4
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.octave.org/pub/octave/
PKG_MD5SUM:=90c39fa9e241ad2e978bcee4682a2ba9
PKG_INSTALL:=1
PKG_FIXUP:=libtool

PKG_BUILD_DEPENDS:= libtool/host @INSTALL_GFORTRAN 

#include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

# todo: graphicsmagick package from multimedia feed is not complete.  We need
# the Magick++ library and the Magick++-config script installed.
define Package/octave/Default
  SUBMENU:=Octave
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:= +libltdl +zlib +libpcre +libncurses +libreadline \
	+octave-data
#+fftw3
#+GraphicsMagick 

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

define Package/octave
$(call Package/octave/Default)
  DEPENDS:=+octave-data
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
CONFIGURE_ARGS += --without-x --without-fftw 
#MAKE_FLAGS += "LD=$(TARGET_CROSS)gcc -nostdlib" 

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default,-j3)
endef

define Build/Install
	$(call Build/Install/Default)
#	$(INSTALL_DATA) ./files/... $(PKG_INSTALL_DIR)/usr/share/octave/
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
