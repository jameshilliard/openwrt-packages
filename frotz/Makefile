include $(TOPDIR)/rules.mk

PKG_NAME:=frotz
PKG_VERSION:=2.43
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/frotz
    TITLE:=frotz
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=@BROKEN +libncurses
    URL:=http://frotz.sourceforge.net/
endef

MAKE_VARS +=CONFIG_DIR=/etc \
	INCL=-I$(STAGING_DIR)/usr/include \
	LIB=-L$(STAGING_DIR)/usr/lib \
	SOUND_DEV=/dev/dsp \
	SOUND_DEFS=-DOSS_SOUND \
	CURSES=-lncurses \
	CURSES_DEF=-DUSE_NCURSES_H

define Package/frotz/description
    A Portable Z-Machine Interpreter
endef


define Package/frotz/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/frotz $(1)/usr/bin/
endef

$(eval $(call BuildPackage,frotz))
