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
PKG_BUILD_DIR=$(BUILD_DIR)/$(PKG_ORIG_NAME)-$(PKG_VERSION)
PKG_INSTALL=1

PKG_SOURCE:=$(PKG_ORIG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/gnuplot
PKG_MD5SUM:=e708665bd512153ad5c35252fe499059

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS += \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

CONFIGURE_VARS += \
	CPPFLAGS="$$$$CPPFLAGS -I$(STAGING_DIR)/usr/include/uClibc++" \
	CXXFLAGS="$$$$CXXFLAGS -fno-builtin -fno-rtti -nostdinc++" \
	LIBS="-nodefaultlibs -luClibc++ -lpthread -lgcc"

define Package/gnuplot-ggi
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses +uclibcxx +zlib +libpng +libfreetype +libgd +libintl +libiconv
  TITLE:=A portable command-line driven graphing utility
  URL:=http://sourceforge.net/projects/gnuplot/
endef

define Package/gnuplot-ggi/description
  Gnuplot  is a portable command-line driven graphing utility for linux, OS/2, 
  MS Windows, OSX, VMS, and many other platforms.
endef

CONFIGURE_ARGS += \
	--without-x \
	--without-tutorial \
	--without-row-help \
	--without-lisp-files \
	--with-ggi 

# cannot disable mouse for ggi: compilation fails. (todo: fix)
#	--disable-mouse 

# Use via 'set terminal ggi S320x240x[C24/32]V320x240F1' (?)
# how to set this as default?

#TARGET_LDFLAGS += -Wl,-rpath-link -Wl,$(STAGING_DIR)/usr/lib

define Package/gnuplot-ggi/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/gnuplot $(1)/usr/bin/
endef

$(eval $(call BuildPackage,gnuplot-ggi))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/gnuplot-ggi/compile -j2 V=99"
# End:
