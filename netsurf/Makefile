# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=netsurf
PKG_VERSION:=r10943
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.netsurf-browser.org/downloads/development/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/netsurf
	SUBMENU:=Web
	SECTION:=network
	CATEGORY:=Network
	TITLE:=netsurf
	URL:=http://www.netsurf-browser.org/
	DEPENDS:=+libsdl +libcss +libhubbub +libparserutils
endef

define Package/netsurf/description
	NetSurf is a free, open source web browser. It is written in C and released under the GNU Public Licence version 2. NetSurf has its own layout and rendering engine entirely written from scratch. It is small and capable of handling many of the web standards in use today.
endef

MAKE_VARS +=
TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/SDL

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) $(FILES_DIR)/Makefile.config $(PKG_BUILD_DIR)
endef

define Package/netsurf/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \

	$(INSTALL_BIN) \
		./files/netsurf \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,netsurf))
