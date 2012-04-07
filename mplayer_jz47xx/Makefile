# 
# Copyright (C) 2011,2012 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for mplayer_jz47xx accelerated mplayer video driver

include $(TOPDIR)/rules.mk

PKG_NAME:=mplayer_jz47xx
PKG_VERSION:=0.1.6
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/mplayer-jz47xx
PKG_MD5SUM:=a6a5121a43a420ba4cda1b153d64c41d
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/mplayer_jz47xx/Default
  MAINTAINER:="David Kuehling" <dvdkhlng TA gmx TOD de>
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=MPlayer accelerated vidix for Ingenic Jz47xx IPU
  URL:=https://sourceforge.net/projects/mplayer_jz47xx/
  DEPENDS:=+MPlayer
endef

define Package/mplayer_jz47xx/Default/description
  Accelerated vidix driver for MPlayer.  Start mplayer with option
  \'-vo cvidix -srceenw 320 screenh 240 -fs\' to use it.  Note: needs small
  patch applied to mplayer codebase for MPlayer to detect/load it.  See source
  tar ball\'s README.txt for details.
endef

define Package/mplayer_jz47xx
$(call Package/mplayer_jz47xx/Default)
endef

define Package/mplayer_jz47xx/description
$(call Package/mplayer_jz47xx/Default/description)
endef


#CONFIGURE_ARGS += 
TARGET_LDFLAGS+= 

define Build/Configure
	$(call Build/Configure/Default)
endef 

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/mplayer_jz47xx/install
	$(INSTALL_DIR) $(1)/usr
	$(CP) $(PKG_INSTALL_DIR)/usr/* $(1)/usr/
endef

$(eval $(call BuildPackage,mplayer_jz47xx))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/mplayer_jz47xx/compile -j2 V=99"
# End:
