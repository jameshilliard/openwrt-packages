# NOT FINISH YET
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=burgerspace
PKG_VERSION:=1.9.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://perso.b2b2c.ca/sarrazip/dev/

include $(INCLUDE_DIR)/package.mk

define Package/burgerspace
  SECTION:=games
  CATEGORY:=Games
  TITLE:=a hamburger-smashing video game
  URL:=http://perso.b2b2c.ca/sarrazip/dev/burgerspace.html
  DEPENDS:=+libncurses +flatzebra @BROKEN
endef

define Package/burgerspace/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/share/games
endef

$(eval $(call BuildPackage,burgerspace))
