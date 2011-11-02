# 
# Copyright (C) Xiangfu Liu <xiangfu@sharism.cc>
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tinygl
PKG_VERSION:=0.4
PKG_SOURCE:=TinyGL-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://bellard.org/TinyGL/
PKG_RELEASE:=1
PKG_INSTALL:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/TinyGL

include $(INCLUDE_DIR)/package.mk

define Package/tinygl
  TITLE:=Tinygl
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://bellard.org/TinyGL/
  DEPENDS:=@BROKEN
#depends on X11
endef

define Package/tinygl/description
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/Install
	$(call Build/Install/Default)
endef

define Package/tinygl/install
	$(INSTALL_DIR) /usr/bin/
endef

$(eval $(call BuildPackage,tinygl))

# The following comments configure the Tinygl editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/openwrt-xburst.full_system package/tinygl/{clean,compile} V=99"
# End:
