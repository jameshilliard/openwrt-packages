#
# Copyright (C) 2012 Xiangfu Liu <xiangfu@openmobilefree.net>
#                            bitcoin: 12h6gdGnThW385JaX1LRMA8cXKmbYRTP8Q
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mini-jtag
PKG_VERSION:=$(shell date +%Y%m%d)
PKG_REV:=HEAD
PKG_RELEASE:=1
PKG_INSTALL:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://github.com/xiangfu/mini-jtag.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/mini-jtag
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=mini-jtag
	URL:=https://github.com/ckolivas/mini-jtag
	DEPENDS:=+libusb +libftdi
endef

define Package/mini-jtag/description
Mini-jtag is a minimal jtag for communicate with fpga chip
endef

TARGET_LDFLAGS += -lusb -lftdi

define Package/mini-jtag/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mini-jtag $(1)/usr/bin
endef

$(eval $(call BuildPackage,mini-jtag))
