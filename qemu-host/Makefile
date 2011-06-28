# 
# OpenWrt Package for building Qemu on the host to be used during the
# compilation of weird packages that need a target environment for certain
# build steps (like Emacs).
#
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=qemu-host
PKG_VERSION:=0.14.1
PKG_RELEASE:=1
PKG_SOURCE:=qemu-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=b6c713a8db638e173af53a62d5178640
PKG_SOURCE_URL:=http://download.savannah.gnu.org/releases/qemu/
HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/qemu-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/qemu-$(PKG_VERSION)
HOST_BUILD_PARALLEL := 1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/qemu-host
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Qemu user-space emulation for the host
  URL:=http://www.qemu.org
  DEPENDS:=+qemu-host/host
  MAINTAINER=David Kuehling <dvdkhlng TA gmx TOD de>
endef

define Package/qemu-host/description
Qemu emulator for the toolchain dummy package.  Enable this package just to 
force compilation of qemu-host.

You don\'t need to enable this package to build packages that rely on qemu 
during build-time.  Instead just add \'+qemu-host/host\' to the 
PKG_BUILD_DEPENDS line of your package.
endef

##
## Compile for the host
##

HOST_CONFIGURE_VARS =

HOST_CONFIGURE_ARGS =						\
	--cc=$(HOSTCC) 						\
	--prefix=$(STAGING_DIR_HOST)				\
	--extra-cflags="$(HOST_CFLAGS) $(HOST_CPPFLAGS)"	\
	--extra-ldflags="$(HOST_LDFLAGS)"			\
	--sysconfdir=$(STAGING_DIR_HOST)/etc			\
	--disable-sdl						\
	--disable-werror					\
	--audio-drv-list=					\
	--disable-curses					\
	--disable-check-utests					\
	--disable-bluez						\
	--disable-kvm						\
	--disable-system					\
	--disable-user						\
	--enable-linux-user 



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
define Package/qemu-host/compile
endef

define Package/qemu-host/install
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,qemu-host))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/qemu-host/compile -j2 V=99"
# End:
