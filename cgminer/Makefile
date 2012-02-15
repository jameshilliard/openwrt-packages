#
# Copyright (C) 2012 Xiangfu Liu <xiangfu@sharism.cc>
#                            bitcoin: 1BQvUsuQBYUyVuX4jjFk4dVBpWJVQEUHTZ
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cgminer
PKG_VERSION:=20120215
PKG_REV:=9a0e4f8facababf54cf6dcac7bf93a0e6099047e
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

CONFIGURE_ARGS += --disable-opencl --disable-adl --enable-icarus
TARGET_CFLAGS  += 
TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/cgminer/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/cgminer $(1)/usr/bin/
endef

$(eval $(call BuildPackage,cgminer))
