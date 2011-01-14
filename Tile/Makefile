#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=Tile
PKG_VERSION:=20110114
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk
PKG_UNPACK:=$(CP) ./src/{tile.*,main.cpp,Tile.pro} $(PKG_BUILD_DIR)

$(call include_mk,qmake.mk)

define Package/Tile
	SECTION:=games
	CATEGORY:=Games
	TITLE:=15 Puzzle game, written in Qt
	DEPENDS:=+qt4 +qt4-gui +dejavu-fonts-ttf
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	(\
cd $(PKG_BUILD_DIR); \
echo "QMAKE_LIBS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib" >> Tile.pro; \
echo "INCLUDEPATH += $(STAGING_DIR)/usr/include/QtGui" >> Tile.pro; \
echo "INCLUDEPATH += $(STAGING_DIR)/usr/include/QtCore" >> Tile.pro; \
)
endef

define Build/Configure
	$(call Build/Configure/Qmake,Tile)
endef

define Package/Tile/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/Tile $(1)/usr/bin/
endef

$(eval $(call BuildPackage,Tile))
