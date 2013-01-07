# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=ubbctl
PKG_VERSION:=20130107
PKG_REV:=127e18d7edd3747435ba8ad74ffe8b5d3a4e54b5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/ben-blinkenlights.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/ubbctl
    TITLE:=Control UBB signals
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=+libubb
    URL:=http://projects.qi-hardware.com/index.php/p/ben-blinkenlights/source/tree/master/ubbctl/README
endef

define Package/ubbctl/description
ubbctl queries the state of UBB signals and allows the user to change
them. It can run in parallel with any other UBB users.
endef

MAKE_PATH=ubbctl

define Package/ubbctl/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/ubbctl/ubbctl $(1)/usr/bin
endef

$(eval $(call BuildPackage,ubbctl))
