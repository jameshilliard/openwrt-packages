# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=man-tiny
PKG_VERSION:=20110518
PKG_REV:=4b5bd45caa1ddd157e54197578b0b4f6a17d05bb
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/man-tiny.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/man-tiny
  TITLE:=Man page viewer
  SECTION:=utilities
  CATEGORY:=Utilities
  URL:=http://projects.qi-hardware.com/index.php/p/man-tiny/
  DEPENDS:=+mandoc
endef

define Package/man-tiny/description
  An extremely simple man page viewer that uses mandoc
endef

define Package/man-tiny/install
	$(INSTALL_DIR) \
		$(1)/usr/bin/

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/src/man \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,man-tiny))
