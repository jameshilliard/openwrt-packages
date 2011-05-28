# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=luit
PKG_VERSION:=1.1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/individual/app/
PKG_MD5SUM:=d7f8ccf45081db086e91ce9940248fc7

include $(INCLUDE_DIR)/package.mk

define Package/luit
    TITLE:=locale and ISO 2022 support for Unicode terminals
    SECTION:=utilities
    CATEGORY:=Utilities
    URL:=http://www.pps.jussieu.fr/~jch/software/luit/
    DEPENDS:=+libfontenc
endef

define Package/luit/description
    locale and ISO 2022 support for Unicode terminals
endef

define Package/luit/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share/X11/locale
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/luit $(1)/usr/bin/
	$(CP) $(FILES_DIR)/locale.alias $(1)/usr/share/X11/locale
endef

$(eval $(call BuildPackage,luit))
