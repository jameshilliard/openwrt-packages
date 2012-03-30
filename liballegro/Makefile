# 
# Copyright (C) David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for the Allegro game and multimedia library

# todo: 
#
# * both shooter and skater try to load a demo.dat from /usr/bin.  hack them to
# use usr/share subdirs?
#
# * similar problem with setup?
#
# * setup and shoot seem to need 8bpp video modes.  can we hack them for
#   32bpp?  Would it help to use a differnt video driver than just 'fbcon'?
#
include $(TOPDIR)/rules.mk

PKG_NAME:=liballegro
PKG_VERSION:=4.4.2
PKG_RELEASE:=2
PKG_SOURCE:=allegro-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/alleg/allegro/$(PKG_VERSION)
PKG_BUILD_DIR = $(BUILD_DIR)/allegro-$(PKG_VERSION)
HOST_BUILD_DIR = $(BUILD_DIR_HOST)/allegro-$(PKG_VERSION)

PKG_MD5SUM:=4db71b0460fc99926ae91d223199c2e6
PKG_INSTALL:=1

PKG_FIXUP:=libtool
PKG_REMOVE_FILES:=

# PKG_BUILD_DEPENDS:=liballegro/host 

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/liballegro/Default
  SUBMENU:=Liballegro
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=The Allegro Game Programming Library
  URL:=alleg.sf.net
#  SUBMENU:=Editors
endef

define Package/liballegro/Default/description
Allegro is a cross-platform library for computer games and multimedia 
programming.
endef

define Package/liballegro
$(call Package/liballegro/Default)
  DEPENDS:=+alsa-lib
  TITLE+= (library)
endef

define Package/liballegro/description
$(call Package/liballegro/Default/description)
 This package contains the Allegro library
endef

define Package/liballegro-data
$(call Package/liballegro/Default)
  TITLE+= (data)
endef

define Package/liballegro-data/description
$(call Package/liballegro/Default/description)
 This package contains various data files that are used by the Allegro library.
endef

define Package/liballegro-png
$(call Package/liballegro/Default)
  TITLE+= (PNG image support)
  DEPENDS:=+liballegro +zlib +libpng
endef

define Package/liballegro-png/description
$(call Package/liballegro/Default/description)
 This package contains the libloadpng addon that allows interfacing allegro 
 Bitmaps with PNG files.  Although the name of the library suggests otherwise
 saving to PNG is supported as well as loading PNG files.
endef

# note: jpgalleg contains its own jpeg implementation; libjpeg not needed!
define Package/liballegro-jpeg
$(call Package/liballegro/Default)
  TITLE+= (JPEG image support)
  DEPENDS:=+liballegro
endef

define Package/liballegro-jpeg/description
$(call Package/liballegro/Default/description)
 This package contains the libjpgalleg addon that allows interfacing allegro 
 Bitmaps with JPEG files.  Saving to JPEG files is supported as well as loading.
endef

define Package/liballegro-ogg
$(call Package/liballegro/Default)
  TITLE+= (Ogg/Vorbis audio support)
  DEPENDS:=+liballegro +libvorbisidec +libogg
endef

define Package/liballegro-ogg/description
$(call Package/liballegro/Default/description)
 This package contains the liblogg addon that allows play-back and mixing of
 background music from Ogg Vorbis audio files.
endef

define Package/liballegro-demo
$(call Package/liballegro/Default)
  TITLE+= (demo)
  DEPENDS:=+liballegro
endef

define Package/liballegro-demo/description
$(call Package/liballegro/Default/description)
 This package contains the Allegro demo game.
endef

define Package/liballegro-setup
$(call Package/liballegro/Default)
  TITLE+= (setup)
  DEPENDS:=+liballegro
endef

define Package/liballegro-setup/description
$(call Package/liballegro/Default/description)
 This package contains the Allegro setup program
endef

define Package/liballegro-examples
$(call Package/liballegro/Default)
  TITLE+= (examples)
  DEPENDS:=+liballegro
endef

define Package/liballegro-examples/description
$(call Package/liballegro/Default/description)
 This package contains the Allegro example programs named "ex*"
endef

define Package/liballegro-utils
$(call Package/liballegro/Default)
  TITLE+= (utils)
endef

define Package/liballegro-utils/description
$(call Package/liballegro/Default/description)
 This package contains the setup and test tool that ship with Allegro.
endef

HOST_CONFIGURE_ARGS += 
CONFIGURE_ARGS +=

TARGET_CPPFLAGS += 

define Build/Prepare
	$(call Build/Prepare/Default)
endef

HOST_CMAKE_FLAGS=					\
	-DCMAKE_INSTALL_PREFIX=$(STAGING_DIR_HOST)	\
	-DRT_LIBRARY=					\
	-DDL_LIBRARY=					\
	-DWANT_TOOLS=on					\
	-DWANT_TESTS=off				\
	-DWANT_MODULES=off				\
	-DWANT_EXAMPLES=off				\
	-DWANT_ALLEGROGL=off				\
	-DWANT_LOADPNG=off				\
	-DWANT_LOGG=off					\
	-DWANT_JPGALLEG=off				\
	-DWANT_X11=off					\
	-DWANT_LINUX_CONSOLE=on				\
	-DWANT_LINUX_FBCON=off				\
	-DWANT_LINUX_VGA=off				\
	-DWANT_LINUX_SVGALIB=off			\
	-DWANT_ALSA=off					\
	-DWANT_OSS=off					\
	-DWANT_JACK=off					\
	-DWANT_SGIAUDIO=off 

define Host/Configure
	cd $(HOST_BUILD_DIR) && cmake $(HOST_CMAKE_FLAGS) .
endef

## On the host, we only need to compile the allegro develpment tools: 
## dat&friends
define Host/Compile
	$(call Host/Compile/Default, VERBOSE=1 -j4)
endef

define Host/Install
	$(call Host/Install/Default)
#	$(INSTALL_BIN) $(HOST_BUILD_DIR)/lib-src/make-docfile $(STAGING_DIR_HOST)/bin/liballegro-make-docfile
#	$(INSTALL_BIN) $(HOST_BUILD_DIR)/src/prefix-args $(STAGING_DIR_HOST)/bin/liballegro-prefix-args
endef

# workaround for cmake.mk bug
ifneq ($(CONFIG_CCACHE),)
  CMAKE_C_COMPILER:=ccache
  CMAKE_CXX_COMPILER:=ccache
endif

EXTRA_CFLAGS = -DSETUP_SCREEN_W=320 -DSETUP_SCREEN_H=240 -DSETUP_CFG_FILE=\\\"/etc/allegrorc\\\"
TARGET_LDFLAGS = -L$(STAGING_DIR)/usr/lib -ldl -lrt

CMAKE_OPTIONS =								\
	-DRT_LIBRARY=							\
	-DALLEGRO_USE_CONSTRUCTOR_EXITCODE=0				\
	-DRT_LIBRARY=							\
	-DDL_LIBRARY=							\
	-DWANT_TOOLS=on							\
	-DWANT_TESTS=on							\
	-DWANT_MODULES=on						\
	-DWANT_EXAMPLES=on						\
	-DWANT_ALLEGROGL=off						\
	-DWANT_X11=off							\
	-DWANT_LINUX_CONSOLE=on						\
	-DWANT_LINUX_FBCON=on						\
	-DWANT_LINUX_VGA=off						\
	-DWANT_LINUX_SVGALIB=off					\
	-DWANT_ALSA=on							\
	-DWANT_OSS=off							\
	-DWANT_JACK=off							\
	-DWANT_SGIAUDIO=off						\
	-DWANT_LOADPNG=$(if $(CONFIG_PACKAGE_liballegro-png),on,off)	\
	-DWANT_JPGALLEG=$(if $(CONFIG_PACKAGE_liballegro-jpeg),on,off) \
	-DWANT_LOGG=$(if $(CONFIG_PACKAGE_liballegro-ogg),on,off)

# todo: patch CMakeLists.txt to force addons to be compiled as shared libs?
#	-DADDON_LINKAGE=SHARED

MAKE_FLAGS += -j4

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
	$(call Build/Compile/Default -C PKG_BUILD_DIR)
#	ln -sf $(STAGING_DIR_HOST)/bin/liballegro-make-docfile $(PKG_BUILD_DIR)/lib-src/make-docfile
endef

define Build/Install
	$(call Build/Install/Default)
	#$(INSTALL_DATA) ./files/... $(PKG_INSTALL_DIR)/usr/share/..
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* \
		$(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.a \
		$(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
#	$(SED) 's,-I$$$${includedir},,g' $(1)/usr/lib/pkgconfig/plplotd.pc
#	$(SED) 's,-L$$$${libdir},,g' $(1)/usr/lib/pkgconfig/plplotd.pc
endef

define Package/liballegro/install
	$(INSTALL_DIR) $(1)/usr/lib  $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liballeg* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/allegro $(1)/usr/lib/
	$(CP) ./files/allegrorc $(1)/etc/
endef

define Package/liballegro-data/install
	$(INSTALL_DIR) $(1)/usr/share/allegro
	$(CP) $(PKG_BUILD_DIR)/{keyboard.dat,language.dat} $(1)/usr/share/allegro
        # readme file is used by the allegro 'shooter' demo
	$(INSTALL_DIR) $(1)/usr/share/allegro/docs/{txt,src}
	$(CP) $(PKG_BUILD_DIR)/docs/txt/readme.txt \
		$(1)/usr/share/allegro/docs/txt
	$(CP) $(PKG_BUILD_DIR)/docs/src/thanks._tx \
		$(1)/usr/share/allegro/docs/src
endef

define Package/liballegro-png/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libloadpng* $(1)/usr/lib/
endef

define Package/liballegro-jpeg/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libjpgalleg* $(1)/usr/lib/
endef

define Package/liballegro-ogg/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblogg* $(1)/usr/lib/
endef

define Package/liballegro-demo/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/share/allegro
	$(CP) $(PKG_BUILD_DIR)/demos/shooter/shooter $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/demos/shooter/demo.dat $(1)/usr/share/allegro/shooter.dat	
	$(CP) $(PKG_BUILD_DIR)/demos/skater/skater $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/demos/skater/demo.dat $(1)/usr/share/allegro/skater.dat
endef

define Package/liballegro-setup/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/share/allegro/
	$(CP) $(PKG_BUILD_DIR)/setup/setup $(1)/usr/bin/allegro-setup
	$(CP) $(PKG_BUILD_DIR)/setup/setup.dat $(1)/usr/share/allegro/
endef

define Package/liballegro-examples/install
	$(INSTALL_DIR) $(1)/usr/bin/allegro
	$(CP) $(PKG_BUILD_DIR)/examples/* $(1)/usr/bin/allegro/
	rm $(1)/usr/bin/allegro/{*.c,*.h,*.txt,*.cmake}
	rm -r $(1)/usr/bin/allegro/CMakeFiles
endef

define Package/liballegro-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin $(1)/usr
endef


$(eval $(call HostBuild))
$(eval $(call BuildPackage,liballegro))
$(eval $(call BuildPackage,liballegro-data))
$(eval $(call BuildPackage,liballegro-png))
$(eval $(call BuildPackage,liballegro-jpeg))
$(eval $(call BuildPackage,liballegro-ogg))
$(eval $(call BuildPackage,liballegro-demo))
$(eval $(call BuildPackage,liballegro-setup))
$(eval $(call BuildPackage,liballegro-examples))
$(eval $(call BuildPackage,liballegro-utils))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "cd ~/src/nanonote/allegro-4.4.2 && ~/bin/quilt-export target && make -C ~/h/src/qi/openwrt-xburst package/liballegro/compile -j2 V=99"
# End:
