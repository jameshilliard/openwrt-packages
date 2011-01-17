#
# Copyright (C) 2010 emdete.de
#
# This is free software, licensed under the GNU General Public License
# v3. See /LICENSE for more information.
# 
include $(TOPDIR)/rules.mk

PKG_NAME:=bwbasic
PKG_VERSION:=2.50
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).zip
PKG_SOURCE_URL:=@SF/bwbasic
PKG_INSTALL:=1
UNPACK_CMD=unzip -d $(1) $(DL_DIR)/$(PKG_SOURCE)

include $(INCLUDE_DIR)/package.mk

define Package/bwbasic
  MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
  SECTION:=utilites
  CATEGORY:=Utilities
  TITLE:=An bwbasic application
  URL:=http://www.bwbasic.at/info.htm
  DEPENDS:=+libncurses
endef

MAKE_FLAGS += -f Makefile.ncu

define Package/bwbasic/description
  A bwbasic application
endef

define Package/bwbasic/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/local/bin/bwbasic \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,bwbasic))
