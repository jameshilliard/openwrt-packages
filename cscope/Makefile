#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cscope
PKG_VERSION:=15.7a
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/cscope
PKG_MD5SUM:=da43987622ace8c36bbf14c15a350ec1

PKG_CAT:=bzcat
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/cscope
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=C source code browser
  URL:=http://cscope.sourceforge.net
  DEPENDS:=+libncurses
endef


define Package/cscope/description
	Cscope is a developer's tool for browsing source code.
endef


define Build/Compile
	$(call Build/Compile/Default)
endef


define Package/cscope/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/cscope $(1)/usr/bin/
endef



$(eval $(call BuildPackage,cscope))
