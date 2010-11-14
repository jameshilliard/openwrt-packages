# 
# OpenWrt
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ben-cyrillic
PKG_VERSION:=0.0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/ben-cyrillic
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=implements cyrillic input/output for Ben
  SUBMENU:=Terminal
  DEPENDS:=+setfont2 +kbd
endef

define Build/Compile
endef

define Package/ben-cyrillic/description
  Collection of files and scripts to support cyrillic
  input and output for Ben.
  Use the "Ben" key to switch between input languages.
endef

define Package/ben-cyrillic/install
	$(INSTALL_DIR) \
		$(1)/usr/share/ben-cyrillic \
		$(1)/usr/sbin \
		$(1)/etc/init.d \
		$(1)/usr/share/gmenu2x/sections/applications \
		$(1)/usr/bin

	$(INSTALL_BIN) \
		$(FILES_DIR)/russian.sh \
		$(1)/usr/sbin/russian.sh

	$(INSTALL_BIN) \
		$(FILES_DIR)/$(PKG_NAME).init \
		$(1)/etc/init.d/$(PKG_NAME)

	$(INSTALL_BIN) \
		$(FILES_DIR)/ben-ash-rus \
		$(1)/usr/bin/

	$(INSTALL_DATA) \
		$(FILES_DIR)/{ben_ru_uni.map,ben_ru_uni.trans,un-fuzzy-6x10-font_rus.pnm} \
		$(1)/usr/share/ben-cyrillic/

	$(INSTALL_DATA) \
		$(FILES_DIR)/ash-rus \
		$(1)/usr/share/gmenu2x/sections/applications/
endef

$(eval $(call BuildPackage,ben-cyrillic))
