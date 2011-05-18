# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
#
# NOTE: This file is badly done because I don't know how to do it better.  The
# files in the upstream tarball are prepended only with a man3/ directory, not
# a libsdl-doc-man-1.2/man3/ directory, which means that the OpenWRT directives
# int this file unpack the upstream tarball in:
#
#   .../target-mipsel_uClibc-0.9.30.1/man3/
#
# ..rather than the intended:
#
#   .../target-mipsel_uClibc-0.9.30.1/libsdl-doc-man-1.2/man3/
#
# ..so the cheesily patched Makefile moves the unpacked files in to place.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsdl-doc-man
PKG_VERSION:=1.2
PKG_RELEASE:=1

PKG_SOURCE:=sdldoc-man3.tar.gz
PKG_SOURCE_URL:=http://www.libsdl.org/archives/
PKG_CAT:=zcat
PKG_MD5SUM:=80e8752091874743ccd63ff4387fa9bb

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

UNPACK_CMD=tar xzf $(DL_DIR)/$(PKG_SOURCE) -C $(1)

include $(INCLUDE_DIR)/package.mk

define Package/libsdl-doc-man
  TITLE:=SDL API man pages
  SECTION:=documentation
  CATEGORY:=Documentation
  URL:=http://www.libsdl.org/
  DEPENDS:=+mandoc
endef

define Package/libsdl-doc-man/description
  Man pages for the libSDL 1.2 API
endef

define Build/Compile
endef

define Package/libsdl-doc-man/install
	$(INSTALL_DIR) \
		$(1)/usr/share/man/man3

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/man3/* \
		$(1)/usr/share/man/man3
endef

$(eval $(call BuildPackage,libsdl-doc-man))
