#
# Copyright (C) 2012 xiangfu liu <xiangfu@openmobilefree.net>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=urjtag
PKG_VERSION:=20120715
PKG_REV:=2f2c7920242addf60b3f498528741812d3c9beda
PKG_RELEASE:=1
PKG_INSTALL:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://urjtag.git.sourceforge.net/gitroot/urjtag/urjtag
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/urjtag
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Urjtag
  URL:=http://urjtag.org/
  DEPENDS:=+libusb-1.0 +libftdi $(INTL_DEPENDS) @BROKEN
endef

PKG_BUILD_DEPENDS:=python

TARGET_CFLAGS  += $(INTL_CFLAGS)
TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib $(INTL_LDFLAGS)
MAKE_FLAGS     += -C urjtag

CONFIGURE_PATH  = ./urjtag
CONFIGURE_CMD   = ./autogen.sh
CONFIGURE_ARGS += --with-libusb --with-libftdi --without-ftd2xx \
		  --disable-svf --disable-bsdl

define Package/urjtag/install
	$(INSTALL_DIR) \
		$(1)/usr/bin/ \
		$(1)/usr/share/urjtag/ \
endef

$(eval $(call BuildPackage,urjtag))
