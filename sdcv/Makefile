#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sdcv
PKG_VERSION:=0.4.2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://cdnetworks-kr-1.dl.sourceforge.net/project/sdcv/sdcv/0.4.2/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=2

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/sdcv
    TITLE:=sdcv
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=$(ICONV_DEPENDS) $(INTL_DEPENDS) +libreadline +glib2
    URL:=http://sdcv.sourceforge.net/
endef

define Package/sdcv/description
    StarDict Command line version
endef

define Package/sdcv/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/sdcv $(1)/usr/bin/
endef

$(eval $(call BuildPackage,sdcv))
