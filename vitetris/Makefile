# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=vitetris
PKG_VERSION:=0.57
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://victornils.net/tetris
PKG_MD5SUM:=07d02ee03e2edd66a8741729e237f21f

include $(INCLUDE_DIR)/package.mk

define Package/vitetris
    TITLE:=terminal-based Tetris clone
    SECTION:=games
    CATEGORY:=Games
    URL:=http://victornils.net/tetris
endef

define Package/vitetris/description
    vitetris is a terminal-based Tetris clone by Victor Nilsson. It can also run in graphics mode using the Allegro library
endef

CONFIGURE_ARGS= \
	--without-xlib \
	--without-joystick \
	--with-2player \
	--with-network \
	--with-curses \
	--without-allegro \
	--with-term_resizing \
	--with-menu \
	--with-blockstyles \
	--with-pctimer

CONFIGURE_VARS+=HOSTCC="$(HOSTCC)" HOST_CFLAGS="$(HOST_CFLAGS)" HOST_CPPFLAGS="$(HOST_CPPFLAGS)"

define Package/vitetris/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tetris $(1)/usr/bin/vitetris
endef

$(eval $(call BuildPackage,vitetris))
