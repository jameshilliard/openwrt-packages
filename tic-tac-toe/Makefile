#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tic-tac-toe
PKG_VERSION:=1.0
PKG_REV:=1ef5285d7fb188cd2049936f85de98cabc911144
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://github.com/garretraziel/gomoku.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/tic-tac-toe
  MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
  SECTION:=games
  CATEGORY:=Games
  TITLE:=Easy Tic-Tac-Toe game
  DEPENDS:=+libsdl +libsdl-gfx
  URL:=http://github.com/garretraziel/gomoku
endef

define Package/tic-tac-toe/description
Easy Tic-Tac-Toe game, using SDL and own AI. 
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/ \
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
        -L$(STAGING_DIR)/usr/lib

define Package/tic-tac-toe/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gobango $(1)/usr/bin
endef

$(eval $(call BuildPackage,tic-tac-toe))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/openwrt-xburst.full_system package/tic-tac-toe/{clean,compile} -j2 V=99"
# End:
