# 
# OpenWrt Package for the SWIG interface generator.
#
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=swig
PKG_VERSION:=2.0.1
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/swig
PKG_MD5SUM:=df4465a62ccc5f0120fee0890ea1a31f

#PKG_INSTALL=1
#PKG_BUILD_DEPENDS:= libtool/host 

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/swig
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Simplified Wrapper and Interface Generator
  URL:=http://www.swig.org
  DEPENDS:=+swig/host
  MAINTAINER=David Kuehling <dvdkhlng TA gmx TOD de>
endef

define Package/swig/description
SWIG is a software development tool that connects programs written in C and
C++ with a variety of high-level programming languages. SWIG is used with
different types of target languages including common scripting languages such
as Perl, PHP, Python, Tcl and Ruby.

You don\'t need to enable this package to build packages that rely on SWIG. 
Instead just add \'+swig/host\' to the PKG_BUILD_DEPENDS line of your 
package.
endef

##
## Compile for the host
##

HOST_CONFIGURE_ARGS += --without-pcre

define Host/Configure
	$(call Host/Configure/Default)
endef

define Host/Compile
	$(call Host/Compile/Default)
endef

define Host/Install
	$(call Host/Install/Default)
endef

##
## Compile for the target
##

# nothing to target-compile; everything done during host-compile step
define Package/swig/compile
endef

define Package/swig/install
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,swig))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/swig/compile -j2 V=99"
# End:
