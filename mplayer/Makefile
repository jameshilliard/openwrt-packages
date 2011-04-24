# 
# OpenWrt
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=MPlayer
# newer mplayer revisions lack the --enable-system-ffmpeg configure option
# which totally screws us :( (i.e. they want to checkout and rebuild libffmpeg
# from the mplayer source tree, yuck!)
PKG_REV:=33304
FFMPEG_REV:=3d462373f8e8fa58b697a9b2d93a5edf70841937
#32225  -- last revision with enable-system-ffmpeg
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE=$(PKG_NAME)-$(PKG_VERSION).tar.gz
FFMPEG_SOURCE_URL:=git://git.videolan.org/ffmpeg.git
PKG_SOURCE_URL:=svn://svn.mplayerhq.hu/mplayer/trunk
PKG_SOURCE_PROTO:=svn_plus_ffmpeg_git
PKG_SOURCE_VERSION=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define DownloadMethod/svn_plus_ffmpeg_git
	$(call wrap_mirror, \
		echo "Checking out files from the svn repository..."; \
		mkdir -p $(TMP_DIR)/dl && \
		cd $(TMP_DIR)/dl && \
		rm -rf $(SUBDIR) && \
		[ \! -d $(SUBDIR) ] && \
		( svn help export | grep -q trust-server-cert && \
		svn export --non-interactive --trust-server-cert -r$(VERSION) $(URL) $(SUBDIR) || \
		svn export --non-interactive -r$(VERSION) $(URL) $(SUBDIR) ) && \
		git clone --depth 1 $(FFMPEG_SOURCE_URL) $(SUBDIR)/ffmpeg && \
		(cd $(SUBDIR)/ffmpeg && git checkout $(FFMPEG_REV)) && \
		echo "Packing checkout..." && \
		rm -rf $(SUBDIR)/ffmpeg/.git && \
		$(call dl_pack,$(TMP_DIR)/dl/$(FILE),$(SUBDIR)) && \
		mv $(TMP_DIR)/dl/$(FILE) $(DL_DIR)/ && \
		rm -rf $(SUBDIR); \
	)
endef


define Package/MPlayer
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=MPlayer, the movie player
  URL:=http://www.mplayerhq.hu
  DEPENDS:=+libjpeg +libpng +directfb +zlib +libsdl +libfreetype +fontconfig $(ICONV_DEPENDS) +BUILD_PATENTED:libmad +libaa +giflib +fribidi +libtheora +libggi
endef

define Package/MPlayer/description
  MPlayer is a movie player which runs on many systems.
endef

#		  --enable-system-ffmpeg 
#		  --extra-libs="-lavformat -lavcodec -lavutil -lpostproc -lswscale" \

CONFIGURE_ARGS := --target=mips \
		  --disable-mencoder \
		  --disable-pthreads \
		  --enable-cross-compile \
		  --prefix=/usr \
		  --with-sdl-config=$(STAGING_DIR)/usr/bin/sdl-config \
		  --with-freetype-config=$(STAGING_DIR)/host/bin/freetype-config \
		  --enable-rpath \
		  --extra-cflags="-I$(STAGING_DIR)/usr/include/directfb \
		  $(ICONV_CPPFLAGS)" \
		  --extra-ldflags="$(ICONV_LDFLAGS)" \
		  --host-cc=gcc \
		  --enable-fbdev \
		  --confdir=/usr/share/mplayer \
		  --enable-menu \
		  --$(if $(CONFIG_BUILD_PATENTED),enable-mad,disable-mad) \
		  --$(if $(CONFIG_BUILD_PATENTED),enable-mp3lib,disable-mp3lib) \
		  --disable-x11 \
		  --disable-xv \
		  --disable-vm \
		  --disable-vdpau \
		  --disable-gl \
		  --disable-xf86keysym \
		  --enable-vidix \
		  --disable-vidix-pcidb \
		  --with-vidix-drivers="no"

# mplayer makefile is soooo broken.  have to specify libs by hand, if
# compileing with --enable-system-ffmpeg
TARGET_CFLAGS+= -std=c99 -DPATH_MAX=512 -D_GNU_SOURCE
# -lavcore

# todo: remove once building correctly
MAKE_FLAGS = -j4

define Build/Configure
	$(call Build/Configure/Default,)
endef

define Package/MPlayer/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/share/mplayer

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/mplayer \
		$(1)/usr/bin/mplayer
	$(INSTALL_DATA) \
		$(FILES_DIR)/input.conf \
		$(1)/usr/share/mplayer

endef

$(eval $(call BuildPackage,MPlayer))
