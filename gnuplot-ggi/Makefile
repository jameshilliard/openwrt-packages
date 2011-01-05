# 
# Gnuplot package for OpenWrt.
#
# Adapted to support LibGGI video output by 
# David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gnuplot-ggi
PKG_ORIG_NAME=gnuplot
PKG_VERSION:=4.4.0
PKG_RELEASE:=2
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_ORIG_NAME)-$(PKG_VERSION)
HOST_BUILD_DIR = $(BUILD_DIR_HOST)/$(PKG_ORIG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_ORIG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/gnuplot
PKG_MD5SUM:=e708665bd512153ad5c35252fe499059

PKG_INSTALL=1
PKG_BUILD_DEPENDS:= gnuplot-ggi/host libtool/host 

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/gnuplot-ggi/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A portable command-line driven graphing utility
  URL:=http://sourceforge.net/projects/gnuplot/
endef

define Package/gnuplot-ggi/Default/description
  Gnuplot  is a portable command-line driven graphing utility for linux, OS/2, 
  MS Windows, OSX, VMS, and many other platforms.  This version is compiled
  to use LibGGI as default terminal, allowing gnuplot to draw directly to
  the Linux framebuffer.
endef

define Package/gnuplot-ggi
$(call Package/gnuplot-ggi/Default)
  DEPENDS:=+libncurses +uclibcxx +zlib +libpng +libfreetype +libgd +libintl +libiconv
  TITLE+=
endef

define Package/gnuplot-ggi-gih
$(call Package/gnuplot-ggi/Default)
  DEPENDS:=+gnuplot-ggi
  TITLE+=(integrated help)
endef

define Package/gnuplot-ggi-gih/description
$(call Package/gnuplot-ggi/Default/description)
This package contains the documentation files needed for GNUplot\'s internal
help system.
endef

##
## Compile for the host
##

# We need the doc2gih tool compiled on the *host* to get GNUplot's online
# documentation when compiling for the target.

HOST_CONFIGURE_VARS += \
	--without-x \
	--without-tutorial \
	--without-lisp-files \
	--without-ggi

define Host/Configure
	$(call Host/Configure/Default)
endef

define Host/Compile
	$(MAKE) -C $(HOST_BUILD_DIR)/docs doc2gih alldoc2gih
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/bin/
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/docs/{doc2gih,alldoc2gih} \
		$(STAGING_DIR_HOST)/bin/
endef

##
## Compile for the target
##

CONFIGURE_ARGS += \
	--without-x \
	--without-tutorial \
	--without-row-help \
	--without-lisp-files \
	--with-ggi \
	--with-gihdir=/usr/share/gnuplot

CONFIGURE_VARS += \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/uClibc++" \
	CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti -nostdinc++" \
	LIBS="-nodefaultlibs -luClibc++ -lpthread -lgcc"

TARGET_CPPFLAGS += -DDEFAULTTERM=\\\"ggi\\\"

# todo: insto cppflags
TARGET_CFLAGS += \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

# cannot disable mouse for ggi: compilation fails. (todo: fix)
#	--disable-mouse 

# Use via 'set terminal ggi S320x240x[C24/32]V320x240F1' (?)
# how to set this as default?

#TARGET_LDFLAGS += -Wl,-rpath-link -Wl,$(STAGING_DIR)/usr/lib

define Package/gnuplot-ggi/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/gnuplot $(1)/usr/bin/
endef

define Package/gnuplot-ggi-gih/install
	$(INSTALL_DIR) $(1)/usr/share/gnuplot/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/gnuplot/gnuplot.gih \
		$(1)/usr/share/gnuplot/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,gnuplot-ggi))
$(eval $(call BuildPackage,gnuplot-ggi-gih))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/gnuplot-ggi/compile -j2 V=99"
# End:
