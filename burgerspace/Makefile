# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=burgerspace
PKG_VERSION:=1.9.0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-current.tar.gz
PKG_SOURCE_URL:=http://perso.b2b2c.ca/sarrazip/dev/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/burgerspace
  TITLE:=burgerspace
  URL:=http://perso.b2b2c.ca/sarrazip/dev/burgerspace.html
  DEPENDS:=+libsdl +libsdl-ttf @BROKEN
endef

define Package/burgerspace/description
a hamburger-smashing video game. It is a clone of the 1982 BurgerTime video game by Data East.
endef

CONFIGURE_ARGS +=
TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/SDL
TARGET_LDFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/burgerspace/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/burgerspace $(1)/usr/bin/
endef

$(eval $(call BuildPackage,burgerspace))
