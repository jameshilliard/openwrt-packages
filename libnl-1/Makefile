# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=libnl-1
PKG_VERSION:=1.1
PKG_RELEASE:=1

PKG_SOURCE:=libnl-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.infradead.org/~tgr/libnl/files
PKG_MD5SUM:=ae970ccd9144e132b68664f98e7ceeb1
PKG_INSTALL:=1

PKG_BUILD_DIR=$(BUILD_DIR)/libnl-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libnl-1
    TITLE:=library for applications dealing with netlink sockets
    SECTION:=libs
    CATEGORY:=Libraries
    URL:=http://www.infradead.org/~tgr/libnl/
endef

define Package/libnl-1/description
libnl is a library for applications dealing with netlink sockets.
The library provides an interface for raw netlink messaging and
various netlink family specific interfaces.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include
endef

define Package/libnl-1/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib
endef

$(eval $(call BuildPackage,libnl-1))
