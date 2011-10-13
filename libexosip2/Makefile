# 
# Copyright (C) 2011 Xiangfu Liu <xiangfu@sharism.cc>
# License GPLv2 or later.  NO WARRANTY.
#
# libphone depends on libexosip2

include $(TOPDIR)/rules.mk

PKG_NAME:=libexosip2
PKG_VERSION:=3.5.0
PKG_RELEASE:=1
PKG_SOURCE:=libeXosip2-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.savannah.gnu.org/releases/exosip/
PKG_BUILD_DIR:=$(BUILD_DIR)/libeXosip2-$(PKG_VERSION)
PKG_INSTALL:=1

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/libexosip2
  MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Libexosip2
  URL:=http://savannah.nongnu.org/projects/exosip/
  DEPENDS:=@BROKEN
# ERROR: ./configure: line 2766: syntax error near unexpected token `scripts'
#        ./configure: line 2766: `AM_ACLOCAL_INCLUDE(scripts)'
endef

define Package/libexosip2/description
eXosip is a library that hides the complexity of using the SIP protocol for mutlimedia session establishement. This protocol is mainly to be used by VoIP telephony applications (endpoints or conference server) but might be also usefull for any application that wish to establish sessions like multiplayer games.
endef

TARGET_LDFLAGS += -Wl,-rpath-link -Wl,$(STAGING_DIR)/usr/lib

TARGET_CPPFLAGS +=

CONFIGURE_ARGS +=

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{a,la,so*} \
		$(1)/usr/lib/
endef

define Package/libexosip2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libexosip2))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/openwrt-xburst.full_system package/libexosip2/{clean,compile} -j2 V=99"
# End:
