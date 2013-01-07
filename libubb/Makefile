# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=libubb
PKG_VERSION:=20130107
PKG_REV:=127e18d7edd3747435ba8ad74ffe8b5d3a4e54b5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/ben-blinkenlights.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/libubb
    TITLE:=Helper functions for the Universal Breakout Board
    SECTION:=libs
    CATEGORY:=Libraries
    URL:=http://projects.qi-hardware.com/index.php/p/ben-blinkenlights/source/tree/master/libubb/README
endef

define Package/libubb/description
libubb gives convenient access to the GPIOs accessible via UBB.
It also includes additional components that implement more advanced
functions, such as a software UART, or giving access to additional
CPU registers.
endef

MAKE_PATH=libubb

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/ubb $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libubb/libubb.so $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libubb/include/ubb/* $(1)/usr/include/ubb
endef

define Package/libubb/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libubb/libubb.so $(1)/usr/lib
endef

$(eval $(call BuildPackage,libubb))
