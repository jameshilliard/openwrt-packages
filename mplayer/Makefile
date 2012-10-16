# 
# OpenWrt
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=MPlayer
PKG_REV:=33341
FFMPEG_REV:=3b6bbfa0631d237f2bbc85a7b43907733bea1e82
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=5

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
		git clone $(FFMPEG_SOURCE_URL) $(SUBDIR)/ffmpeg && \
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
  DEPENDS:=+libjpeg +libpng +directfb +zlib +libsdl +libfreetype +fontconfig $(ICONV_DEPENDS) +BUILD_PATENTED:libmad +BUILD_PATENTED:libmpg123 +libaa +giflib +fribidi +libtheora +libggi +PACKAGE_libspeex:libspeex +liblzo
endef

define Package/MPlayer/description
  MPlayer is a movie player which runs on many systems.
endef

#		  --enable-system-ffmpeg 
#		  --extra-libs="-lavformat -lavcodec -lavutil -lpostproc -lswscale" \

CONFIGURE_ARGS := --target=mips \
		  --disable-pulse \
		  --disable-mencoder \
		  --disable-pthreads \
		  --enable-cross-compile \
		  --prefix=/usr \
		  --with-sdl-config=$(STAGING_DIR)/usr/bin/sdl-config \
		  --with-freetype-config=$(STAGING_DIR)/host/bin/freetype-config \
		  --enable-rpath					\
		  --extra-cflags="-I$(STAGING_DIR)/usr/include/directfb	\
		  $(ICONV_CPPFLAGS)"					\
		  --extra-ldflags="$(ICONV_LDFLAGS)"			\
		  --host-cc=gcc						\
		  --enable-fbdev					\
		  --confdir=/etc/mplayer				\
		  --enable-menu						\
		  --disable-x11						\
		  --disable-xmga                                        \
		  --disable-xshape                                      \
		  --disable-xinerama                                    \
		  --disable-gif                                         \
		  --disable-xv						\
		  --disable-vm						\
		  --disable-vdpau					\
		  --disable-gl						\
		  --disable-libgsm					\
		  --disable-xf86keysym					\
		  --disable-ossaudio					\
		  --enable-alsa						\
		  --enable-vidix					\
		  --disable-vidix-pcidb					\
		  --with-vidix-drivers="no"				\
	          --enable-tremor-internal				\
	          --enable-tremor-low					\
		  --enable-decoder=RAWVIDEO_DECODER			\
		  --enable-decoder=THEORA_DECODER			\
		  --enable-decoder=VP3_DECODER				\
		  --enable-decoder=VP8_DECODER				\
		  --enable-decoder=MP2_DECODER				\
		  --enable-decoder=FLAC_DECODER				\
		  --enable-decoder=PCM_U8_DECODER			\
		  --enable-decoder=PCM_U16BE_DECODER			\
		  --enable-decoder=PCM_U16LE_DECODER			\
		  --enable-decoder=PCM_S8_DECODER			\
		  --enable-decoder=PCM_S16BE_DECODER			\
		  --enable-decoder=PCM_S16LE_DECODER			\
		  --enable-decoder=PCM_MULAW_DECODER			\
		  --enable-decoder=PCM_ALAW_DECODER			\
		  --enable-demuxer=RAWVIDEO_DEMUXER			\
		  --enable-demuxer=AVI_DEMUXER				\
		  --enable-demuxer=FLAC_DEMUXER				\
		  --enable-demuxer=MATROSKA_DEMUXER			\
		  --enable-demuxer=MATROSKA_AUDIO_DEMUXER		\
		  --enable-demuxer=SRT_DEMUXER				\
		  --enable-demuxer=WAV_DEMUXER				\
		  --enable-demuxer=YUV4MPEGPIPE_DEMUXER			\
		  --enable-parser=VP3_PARSER				\
		  --enable-parser=VP8_PARSER				\
		  --enable-parser=PNM_PARSER				\
		  --enable-parser=DIRAC_PARSER				\
		  --enable-parser=FLAC_PARSER				\
		  --enable-protocol=HTTP_PROTOCOL			\
		  --enable-protocol=CONCAT_PROTOCOL			\
		  --enable-protocol=FILE_PROTOCOL			\
		  --enable-protocol=PIPE_PROTOCOL			\
		  --enable-protocol=TCP_PROTOCOL			\
		  --enable-protocol=UDP_PROTOCOL

# cannot enable, pulls in mpegts, and realmedia stuff (?):
#		  --enable-protocol=RTP_PROTOCOL

# not compiling working with libspeex version from openwrt:
#		  --enable-decoder=LIBSPEEX_DECODER			

# ffmpeg ogg demuxer disabled for now (leaks memory, use mplayer's native ogg
# support instead) --enable-demuxer=OGG_DEMUXER

# ffmpeg vorbis is float-based and slow, using mplayer's internal tremor
#instead --enable-decoder=VORBIS_DECODER 

ifdef CONFIG_BUILD_PATENTED
CONFIGURE_ARGS+= --enable-mad \
		 --enable-mp3lib
else
CONFIGURE_ARGS+= --disable-mad \
		 --disable-mp3lib \
		 --disable-libmpeg2 \
		 --disable-libmpeg2-internal \
		 --disable-faad
endif

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
		$(1)/etc/mplayer

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/mplayer \
		$(1)/usr/bin/mplayer
	$(INSTALL_DATA) \
		$(FILES_DIR)/input.conf \
		$(FILES_DIR)/mplayer.conf \
		$(1)/etc/mplayer/

endef

$(eval $(call BuildPackage,MPlayer))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/mplayer/compile -j4 V=99"
# End:
