# NOT FINISH YET
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=flatzebra
PKG_VERSION:=0.1.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://perso.b2b2c.ca/sarrazip/dev/

include $(INCLUDE_DIR)/package.mk

define Package/flatzebra
  SECTION:=games
  CATEGORY:=Games
  TITLE:=A generic game engine for 2D double-buffering animation
  URL:=http://perso.b2b2c.ca/sarrazip/dev/flatzebra.html
  DEPENDS:=+libsdl-image @BROKEN
endef

define Package/flatzebra/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/share/games
endef

$(eval $(call BuildPackage,flatzebra))
