# 
# OpenWrt
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=unifont
PKG_VERSION:=5.1.20080820
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).pcf.gz
PKG_SOURCE_URL:=http://unifoundry.com/
PKG_MD5SUM:=8c28087c5fcb3188f1244b390efffdbe

include $(INCLUDE_DIR)/package.mk
PKG_UNPACK:=$(CP) $(DL_DIR)/$(PKG_SOURCE) $(PKG_BUILD_DIR)

define Package/unifont
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=GNU Unifont
  URL:=http://unifoundry.com/unifont.html
endef

define Package/unifont/description
  GNU Unifont, with glyphs for every printable code point in the Unicode 5.1 Basic Multilingual Plane (BMP).
endef

define Build/Compile
endef

define Package/unifont/install
	$(INSTALL_DIR) \
		$(1)/usr/share/fonts

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/$(PKG_SOURCE) \
		$(1)/usr/share/fonts/unifont.pcf.gz
endef

$(eval $(call BuildPackage,unifont))
