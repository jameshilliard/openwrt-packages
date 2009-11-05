#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ubi-utils
PKG_VERSION:=1.2.0
PKG_REV:=600337e7c81e812d34460b413c5b044f454bc49d
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://git.infradead.org/mtd-utils.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/ubi-utils
    TITLE:=ubi-utils
    SECTION:=utils
    CATEGORY:=Utilities
    URL:=http://www.linux-mtd.infradead.org/doc/ubi.html
endef

define Package/ubi-utils/description
	UBI (Latin: "where?") stands for "Unsorted Block Images". It is a volume management system for raw flash devices which manages multiple logical volumes on a single physical flash device and spreads the I/O load (i.e, wear-leveling) across whole flash chip.
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR)/$(PKG_NAME); \
	$(MAKE) CC="$(TARGET_CROSS)gcc" \
		ARCH="$(ARCH)"; \
	$(MAKE) CC="$(TARGET_CROSS)gcc" \
		ARCH="$(ARCH)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		SBINDIR="/usr/bin/" \
		install \
	)
endef

define Package/ubi-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mtdinfo	$(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ubinfo	$(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ubimkvol	$(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ubirmvol	$(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ubinize	$(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ubidetach	$(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ubicrc32	$(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ubiformat	$(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ubiupdatevol	$(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ubirsvol	$(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ubiattach	$(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ubirename	$(1)/usr/bin/
endef

$(eval $(call BuildPackage,ubi-utils))
