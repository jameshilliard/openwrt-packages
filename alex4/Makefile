# 
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# OpenWRT package for Alex the Allegotor v4 -- a game using liballegro
#
# License GPLv2 or later.  NO WARRANTY.

include $(TOPDIR)/rules.mk

PKG_NAME:=alex4
PKG_VERSION:=4.0
PKG_RELEASE:=1
PKG_SOURCE:=alex4src_data.zip
PKG_SOURCE_URL:=@SF/allegator/Alex4/source%20and%20data/
PKG_MD5SUM:=c81b8e3813300a0cfbe828bcdff60fda
PKG_BUILD_DIR:=$(BUILD_DIR)/alex4src


PKG_BUILD_DEPENDS := libdumb

include $(INCLUDE_DIR)/package.mk

define Package/alex4/Default
  SECTION:=games
  CATEGORY:=Games
  URL:=http://allegator.sf.net
endef

define Package/alex4/Default/description
Alex the Allegotor is a series of games.  Alex v4 is a jump&n run game.
endef

define Package/alex4
$(call Package/alex4/Default)
  TITLE += (the game)
  DEPENDS:=+liballegro +alex4-data
endef

define Package/alex4/description
$(call Package/alex4/Default/description)
This package contains the executable files
endef


define Package/alex4-data
$(call Package/alex4/Default)
  TITLE += (data)
endef

define Package/alex4-data/description
 $(call Package/alex4/Default/description)
This package contains the data files for Alex v4.
endef

#TARGET_LDFLAGS += -Wl,-rpath-link -Wl,$(STAGING_DIR)/usr/lib
#TARGET_CPPFLAGS +=

TARGET_LDFLAGS += -L$(STAGING_DIR)/usr/lib -laldmb -ldumb -lalleg



define Build/Configure
endef 

define Build/Compile
	cd $(PKG_BUILD_DIR)/src && \
		$(TARGET_CC) $(TARGET_CFLAGS) $(EXTRA_CFLAGS) $(TARGET_CPPFLAGS) *.c $(TARGET_LDFLAGS) -o alex4
endef

define Package/alex4/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/src/alex4 $(1)/usr/bin/
	$(CP) ./files/alex4.ini $(1)/etc/
endef


define Package/alex4-data/install
	$(INSTALL_DIR) $(1)/usr/share/alex4
	$(CP) $(PKG_BUILD_DIR)/data/*.dat $(1)/usr/share/alex4
endef

$(eval $(call BuildPackage,alex4))
$(eval $(call BuildPackage,alex4-data))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "cd ~/src/nanonote/alex4src && ~/bin/quilt-export target && make -C ~/h/src/qi/openwrt-xburst package/alex4/compile -j2 V=99"
# End:
