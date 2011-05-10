# 
# Gnuplot package for OpenWrt.
#
# Adapted to support LibGGI/SVGAlib video output by 
# David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#

# Todo for GGI support (svgalib works, so GGI is disabled for now)
#
# - After 21acf8eb423af24ca00835192239d50f2e4570a8 I once had proper plot
#   display from Octave (but didn't came back to the console afterwards).
#   Even after building again with mouse support, this isn't working any more.
#   Why?  Must be related to the 050-ggi-close.patch but that patch is doing
#   close to nothing.
#
# - Somebody seems to mess with the console/stdin.  Even when using
#   GGI_FBDEV_OPTIONS=-noinput and setting GGI_NEWVT.  Can be easily tested
#   when launching from ssh.
#
# - When using GGI_NEWVT in Octave, it seems like somebody is injecting text
#   or something into Octave's stdin or into the file handles Octave uses.  It
#   would abort with some strange error message noting that it doesn't know
#   some corrupted command name (stuff like "setset").  Very frightening.

include $(TOPDIR)/rules.mk

PKG_NAME:=gnuplot-gfx
PKG_ORIG_NAME=gnuplot
PKG_VERSION:=4.4.2
PKG_RELEASE:=3
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_ORIG_NAME)-$(PKG_VERSION)
HOST_BUILD_DIR = $(BUILD_DIR_HOST)/$(PKG_ORIG_NAME)-$(PKG_VERSION)
PKG_FIXUP:=libtool

PKG_INSTALL=1
PKG_SOURCE:=$(PKG_ORIG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/gnuplot
PKG_MD5SUM:=a4f0dd89f9b9334890464f687ddd9f50

PKG_BUILD_DEPENDS:= gnuplot-gfx/host 

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/gnuplot-gfx/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A portable command-line driven graphing utility
  URL:=http://sourceforge.net/projects/gnuplot/
endef

define Package/gnuplot-gfx/Default/description
  Gnuplot  is a portable command-line driven graphing utility for linux, OS/2, 
  MS Windows, OSX, VMS, and many other platforms.  This version is compiled
  to use LibGGI as default terminal, allowing gnuplot to draw directly to
  the Linux framebuffer.
endef

define Package/gnuplot-gfx
$(call Package/gnuplot-gfx/Default)
  DEPENDS:=+libncurses +zlib +libpng +libfreetype +libgd $(INTL_DEPENDS) $(ICONV_DEPENDS) +svgalib
  TITLE+=
endef

define Package/gnuplot-gfx-gih
$(call Package/gnuplot-gfx/Default)
  DEPENDS:=+gnuplot-gfx
  TITLE+=(integrated help)
endef

define Package/gnuplot-gfx-gih/description
$(call Package/gnuplot-gfx/Default/description)
This package contains the documentation files needed for GNUplot\'s internal
help system.
endef

##
## Compile for the host
##

# We need the doc2gih tool compiled on the *host* to get GNUplot's online
# documentation when compiling for the target.

HOST_CONFIGURE_ARGS += \
	--without-x \
	--without-tutorial \
	--without-lisp-files \
	--without-ggi \
	--without-cairo \
	--disable-wxwidgets \
	--disable-rgip \
	--disable-mgr \
	--without-latex \
	--without-lisp-files \
	--without-row-help \
	--without-tutorial 
HOST_CONFIGURE_VARS += DIST_CONTACT="David Kuehling <dvdkhlng TA gmx TOD de>"

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
	--without-lisp-files \
	--without-ggi \
	--without-cairo \
	--disable-wxwidgets \
	--disable-rgip \
	--disable-mgr \
	--without-latex \
	--without-lisp-files \
	--without-tutorial \
	--without-row-help \
	--without-lisp-files \
	--without-ggi \
	--with-linux-vga \
	--with-gihdir=/usr/share/gnuplot

# Without mouse, gnuplot works in console mode where it closes the graphics
# device after keypress to get into text mode.  This makes it impossible to
# use Octave which relies on proper suspend/resume behaviour with multiplot.

#--disable-mouse

CONFIGURE_VARS += DIST_CONTACT="David Kuehling <dvdkhlng TA gmx TOD de>"


TARGET_CPPFLAGS += -DDEFAULTTERM=\\\"linux\\\" 

# todo: insto cppflags

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

# todo: remove -j when stable
MAKE_FLAGS += -j2 config m4 term src docs share

# cannot disable mouse for ggi: compilation fails. (todo: fix)
#	--disable-mouse 

# Use via 'set terminal ggi S320x240x[C24/32]V320x240F1' (?)
# how to set this as default?

#TARGET_LDFLAGS += -Wl,-rpath-link -Wl,$(STAGING_DIR)/usr/lib
TARGET_LDFLAGS += -lncursesw

define Package/gnuplot-gfx/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/gnuplot $(1)/usr/bin/
endef

define Package/gnuplot-gfx-gih/install
	$(INSTALL_DIR) $(1)/usr/share/gnuplot/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/gnuplot/gnuplot.gih \
		$(1)/usr/share/gnuplot/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,gnuplot-gfx))
$(eval $(call BuildPackage,gnuplot-gfx-gih))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/gnuplot-gfx/compile -j2 V=99"
# End:
