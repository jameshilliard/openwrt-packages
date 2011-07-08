#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gjay
PKG_VERSION:=0.3.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/gjay
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CONFIGURE_ARGS += \
	--disable-audclient \
	--disable-mpdclient \
	--disable-latin1

CONFIGURE_CMD = ./autogen.sh

define Package/gjay
  SECTION:=sound
  CATEGORY:=Sound
  TITLE:=GJay
  URL:=http://gjay.sourceforge.net/
  DEPENDS:=+gtk2 +libgsl
endef

define Package/gjay/description
GJay (Gtk+ DJ) generates playlists across a collection of music
(ogg, mp3, wav) such that each song sounds good following
the previous song. It is ideal for home users who want a non-random
way to wander large collections or for DJs planning a set list.
You can generate playlists from within the application, or run GJay
as a standalone command-line utility.

Playlist matches are based on:

* Song characteristics that don't change:
    - Frequency fingerprint
    - Beats per minute
    - Location in file system
* Song attributes that you set:
    - Rating
    - Color (whatever that means to you)
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); chmod +x ./autogen.sh; );
	$(call Build/Configure/Default)
endef

define Package/gjay/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share/gjay/icons
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/gjay \
		$(1)/usr/bin/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/gjay/icons/* \
		$(1)/usr/share/gjay/icons/
endef

$(eval $(call BuildPackage,gjay))
