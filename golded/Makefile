# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=golded
PKG_VERSION:=115-20110223
PKG_RELEASE:=1
	
PKG_SOURCE:=gps$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/golded-plus/Golded%2B%201.1.5%20snapshots
PKG_MD5SUM:=6a1d63e7a39ced6e9907e2c8b8e1e666

include $(INCLUDE_DIR)/package.mk

PKG_UNPACK:=bzip2 -c -d $(DL_DIR)/$(PKG_SOURCE) | $(TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xf -

define Package/golded
    TITLE:=Fidonet Mail Reader/Editor
    SECTION:=utilities
    CATEGORY:=Utilities
    URL:=http://sourceforge.net/projects/golded-plus
    DEPENDS:=+libncursesw
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) $(PKG_BUILD_DIR)/golded3/mygolded.__h $(PKG_BUILD_DIR)/golded3/mygolded.h
endef

define Package/golded/description
    This is a successor of the well-known GoldED Fidonet Mail Reader/Editor.
endef

MAKE_FLAGS+=WIDE_NCURSES=1 PLATFORM=lnx
MAKE_VARS+=LNKFLAGS="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/usr/lib"
TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include/ncursesw

define Package/golded/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/{gedlnx,gnlnx,golded,rddtlnx} $(1)/usr/bin/
endef

$(eval $(call BuildPackage,golded))
