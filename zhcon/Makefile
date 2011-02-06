#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@sharism.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=zhcon
PKG_VERSION:=0.2.5

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ncu.dl.sourceforge.net/project/zhcon/zhcon/0.2.6/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/zhcon
    TITLE:=zhcon
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=@BROKEN
    URL:=http://zhcon.sourceforge.net/
endef

define Package/zhcon/description
	zhcon is a Fast double-byte virtual console for Chinese/Japanese/Korean (CJK) running under GNU/Linux and FreeBSD
endef


TARGET_LDFLAGS+=-lcharset -liconv

CONFIGURE_ARGS += 

define Package/zhcon/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib/zhcon/font
	$(INSTALL_DIR) $(1)/usr/lib/zhcon/input
endef

$(eval $(call BuildPackage,zhcon))
