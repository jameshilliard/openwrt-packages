#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@sharism.cc>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=fusion
PKG_VERSION=8.1.1
PKG_RELEASE:=1

PKG_SOURCE:=linux-$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.directfb.org/downloads/Core/linux-fusion/
PKG_BUILD_DIR:=$(BUILD_DIR)/linux-$(PKG_NAME)-$(PKG_VERSION)
SUB:=linux/drivers/char/fusion
export CONFIG_FUSION_DEVICE=m

include $(INCLUDE_DIR)/package.mk

define KernelPackage/fusion
  SUBMENU:=Wireless Drivers
  TITLE:=fusion for Directfb
  DEPENDS:=@BROKEN
  FILES:=$(PKG_BUILD_DIR)/$(SUB)/fusion.$(LINUX_KMOD_SUFFIX)
  AUTOLOAD:=$(call AutoLoad,10,fusion)
endef

AUTOCONF_H = -include $(LINUX_DIR)/include/linux/autoconf.h

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	KBUILD_CPPFLAGS="-D__KERNEL__ -I$(PKG_BUILD_DIR)/linux/include -I$(LINUX_DIR)/include $(AUTOCONF_H)" \
	SUBDIRS=$(PKG_BUILD_DIR)/$(SUB)

define Build/Compile
	rm -f $(PKG_BUILD_DIR)/$(SUB)/Makefile
	ln -s $(PKG_BUILD_DIR)/$(SUB)/Makefile-2.6 $(PKG_BUILD_DIR)/$(SUB)/Makefile
	$(MAKE) -C "$(LINUX_DIR)" \
		$(MAKE_OPTS) \
		modules
endef

$(eval $(call KernelPackage,fusion))
