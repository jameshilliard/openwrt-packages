# 
# Copyright (C) Xiangfu Liu <xiangfu@sharism.cc>
#
# License GPLv2 or later.  NO WARRANTY.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=signalgen.py
PKG_VERSION:=1.1
PKG_SOURCE:=$(PKG_NAME)
PKG_SOURCE_URL:=http://www.arachnoid.com/python/python_programs/
PKG_RELEASE:=1
PKG_INSTALL:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk
PKG_UNPACK:=

define Package/signalgen.py
  TITLE:=Signalgen.Py
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://www.arachnoid.com/python/signalgen.py_program.html
  DEPENDS:=+python @BROKEN
# ImportError: No module named gobject when start in nanonote
endef

define Package/signalgen.py/description
Signalgen.Py can generates relatively low frequency signals with the use of a PC sound card.
endef

define Build/Configure
endef

define Build/Compile
endef

define Build/Install
endef

define Package/signalgen.py/install
	$(INSTALL_DIR) $(1)/usr/share/$(PKG_NAME)
	$(INSTALL_BIN) $(DL_DIR)/$(PKG_NAME) $(1)/usr/share/$(PKG_NAME)/
	wget http://www.arachnoid.com/python/python_programs/signalgen_gui.glade \
	  -O $(1)/usr/share/$(PKG_NAME)/signalgen_gui.glade
endef

$(eval $(call BuildPackage,signalgen.py))

# The following comments configure the Signalgen.Py editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/openwrt-xburst.full_system package/signalgen.py/{clean,compile} V=99"
# End:
