#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=ks7010
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define KernelPackage/ks7010
  SUBMENU:=Wireless Drivers
  TITLE:=ks7010 SDIO wireless card
  DEPENDS:=
  FILES:=$(PKG_BUILD_DIR)/ks7010.$(LINUX_KMOD_SUFFIX)
  AUTOLOAD:=$(call AutoLoad,10,ks7010)
endef

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	SUBDIRS="$(PKG_BUILD_DIR)"

define Build/Prepare
	$(INSTALL_DIR) $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		$(MAKE_OPTS) \
		modules
endef

define KernelPackage/ks7010/install
	$(INSTALL_DIR) $(1)/lib/firmware/
	$(CP) ./files/* $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,ks7010))
