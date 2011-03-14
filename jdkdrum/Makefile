#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=jdkdrum
PKG_VERSION:=
PKG_SOURCE:=$(PKG_NAME).tar.gz
PKG_SOURCE_URL:=http://www.jdkoftinoff.com/main/Free_Projects/Drum_Synth_For_Linux/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_RELEASE:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/jdkdrum
    TITLE:=jdkdrum
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=
    URL:=http://www.jdkoftinoff.com/main/Free_Projects/Drum_Synth_For_Linux/
endef

define Package/jdkdrum/description
    Command Line Drum Synth Program For Linux
endef

define Build/Compile
	$(call Build/Compile/Default,clean)
	$(call Build/Compile/Default)
endef

define Build/Install
endef

define Package/jdkdrum/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share/jdkdrum
	$(INSTALL_BIN) ./files/jdkdrum $(1)/usr/bin/
	cp -f $(PKG_BUILD_DIR)/* $(1)/usr/share/jdkdrum || true
endef

$(eval $(call BuildPackage,jdkdrum))
# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/openwrt-xburst.full_system package/jdkdrum/{clean,compile} -j2 V=99"
# End:
