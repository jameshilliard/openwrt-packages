# 
# Copyright (C) Xiangfu Liu <xiangfu@sharism.cc>
#
# License GPLv2 or later.  NO WARRANTY.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=signalgen
PKG_VERSION:=1.3
PKG_SOURCE:=$(PKG_NAME).tar.bz2
PKG_SOURCE_URL:=http://www.arachnoid.com/SignalGen/
PKG_RELEASE:=1
PKG_INSTALL:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/signalgen
  TITLE:=SignalGen
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://www.arachnoid.com/SignalGen/index.html
  DEPENDS:=@BROKEN
# Depends on X 
endef

define Package/signalgen/description
SignalGen can generates relatively low frequency signals with the use of a PC sound card.
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

define Package/signalgen/install
	$(INSTALL_DIR) /usr/bin/
endef

$(eval $(call BuildPackage,signalgen))

# The following comments configure the Signalgen editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/openwrt-xburst.full_system package/signalgen/{clean,compile} V=99"
# End:
