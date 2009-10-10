#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=DirectFB
PKG_VERSION:=1.4.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.directfb.org/downloads/Core/DirectFB-1.4

PKG_INSTALL:=1

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/DirectFB
    TITLE:=DirectFB
    SECTION:=libs
    CATEGORY:=Libraries
    URL:=http://directfb.org
    DEPENDS:=+libpng
endef

define Package/DirectFB/description
    DirectFB is a thin library that provides hardware graphics acceleration, input device handling and abstraction, integrated windowing system with support for translucent windows and multiple display layers, not only on top of the Linux Framebuffer Device. It is a complete hardware abstraction layer with software fallbacks for every graphics operation that is not supported by the underlying hardware.
endef

TARGET_LDFLAGS+="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib"

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default, \
		--disable-osx \
		--disable-x11 \
		--disable-debug-support \
		--disable-network \
		--disable-mmx \
		--disable-sse \
		--enable-fbdev \
		--disable-sdl \
		--disable-vnc \
		--enable-sysfs \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include \
		$(1)/usr/lib \
		$(1)/usr/lib/pkgconfig \
		$(1)/usr/lib/directfb-1.4-0-pure/systems \
		$(1)/usr/lib/directfb-1.4-0-pure/wm \
		$(1)/usr/lib/directfb-1.4-0-pure/inputdrivers \
		$(1)/usr/lib/directfb-1.4-0-pure/gfxdrivers \
		$(1)/usr/lib/directfb-1.4-0-pure/interfaces/IDirectFBFont \
		$(1)/usr/lib/directfb-1.4-0-pure/interfaces/IDirectFBImageProvider \
		$(1)/usr/lib/directfb-1.4-0-pure/interfaces/IDirectFBVideoProvider
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/lib{directfb,fusion}*.{so*,a,la} \
		$(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/directfb \
		$(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/directfb-internal \
		$(1)/usr/include/
endef

define Package/DirectFB/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/lib \
		$(1)/usr/lib/directfb-1.4-0-pure/interfaces/IDirectFBFont \
		$(1)/usr/lib/directfb-1.4-0-pure/interfaces/IDirectFBImageProvider \
		$(1)/usr/lib/directfb-1.4-0-pure/interfaces/IDirectFBVideoProvider \
		$(1)/usr/lib/directfb-1.4-0-pure/wm \
		$(1)/usr/lib/directfb-1.4-0-pure/systems \
		$(1)/usr/lib/directfb-1.4-0-pure/inputdrivers \
		$(1)/usr/lib/directfb-1.4-0-pure/gfxdrivers
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/lib{direct,fusion}*.so* \
		$(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/directfb-1.4-0-pure/interfaces/IDirectFBFont/*.so* \
		$(1)/usr/lib/directfb-1.4-0-pure/interfaces/IDirectFBFont/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/directfb-1.4-0-pure/interfaces/IDirectFBImageProvider/*.so* \
		$(1)/usr/lib/directfb-1.4-0-pure/interfaces/IDirectFBImageProvider/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/directfb-1.4-0-pure/interfaces/IDirectFBVideoProvider/*.so* \
		$(1)/usr/lib/directfb-1.4-0-pure/interfaces/IDirectFBVideoProvider/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/directfb-1.4-0-pure/wm/*.so* \
		$(1)/usr/lib/directfb-1.4-0-pure/wm/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/directfb-1.4-0-pure/systems/*.so* \
		$(1)/usr/lib/directfb-1.4-0-pure/systems/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/directfb-1.4-0-pure/inputdrivers/*.so* \
		$(1)/usr/lib/directfb-1.4-0-pure/inputdrivers/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/directfb-1.4-0-pure/gfxdrivers/*.so* \
		$(1)/usr/lib/directfb-1.4-0-pure/gfxdrivers/
endef

$(eval $(call BuildPackage,DirectFB))
