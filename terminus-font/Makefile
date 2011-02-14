#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=terminus-font
PKG_VERSION:=4.32
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=9b74047edcc236a7d4af8abf966c3e7c

include $(INCLUDE_DIR)/package.mk

define Package/terminus-font
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Monospaced font
  URL:=http://sourceforge.net/projects/terminus-font/
  DEPENDS:=+kbd
endef

define Package/terminus-font/description
Monospaced font designed for long (8+ hours per day) work with computers. Contains 850 characters, supports about 120 language sets, many IBM, Windows and Macintosh code pages, IBM VGA / vt100 / xterm pseudographic characters and Esperanto.
endef

define Package/terminus-font/install
	$(INSTALL_DIR) \
		$(1)/usr/share/kbd/consolefonts

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/ter-v* \
		$(1)/usr/share/kbd/consolefonts
endef

$(eval $(call BuildPackage,terminus-font))
