#
# Copyright (C) 2012 Xiangfu Liu <xiangfu@sharism.cc>
#                            bitcoin: 1BQvUsuQBYUyVuX4jjFk4dVBpWJVQEUHTZ
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cgminer
PKG_VERSION:=20120210
PKG_REV:=6e3ad7ad250b5d63be2472d9dc56325d143d7ace
PKG_RELEASE:=1
PKG_INSTALL:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://github.com/ckolivas/cgminer.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/cgminer
	MAINTAINER:="Xiangfu Liu" \
		<xiangfu@sharism.cc> <1BQvUsuQBYUyVuX4jjFk4dVBpWJVQEUHTZ>
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=cgminer
	URL:=https://github.com/ckolivas/cgminer
	DEPENDS:=+libcurl +libpthread +libncurses +jansson
endef

define Package/cgminer/description
endef

CONFIGURE_ARGS += --enable-bitforce --disable-opencl --disable-adl --enable-cpumining
TARGET_CFLAGS  += 
TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/cgminer/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/cgminer $(1)/usr/bin/
endef

$(eval $(call BuildPackage,cgminer))
