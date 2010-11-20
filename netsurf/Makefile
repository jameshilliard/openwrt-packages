# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=netsurf
PKG_VERSION:=r10943
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.netsurf-browser.org/downloads/development/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/netsurf
	SUBMENU:=Web
	SECTION:=network
	CATEGORY:=Network
	TITLE:=netsurf
	URL:=http://www.netsurf-browser.org/
	DEPENDS:=+libsdl +libcss +libhubbub +libparserutils +libnsfb +libxml2 +libcurl +libfreetype
endef

define Package/netsurf/description
	NetSurf is a free, open source web browser. It is written in C and released under the GNU Public Licence version 2. NetSurf has its own layout and rendering engine entirely written from scratch. It is small and capable of handling many of the web standards in use today.
endef

MAKE_FLAGS += "TARGET=framebuffer" \
			  "PREFIX=/usr"

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/SDL
TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) $(FILES_DIR)/Makefile.config $(PKG_BUILD_DIR)
endef

define Package/netsurf/install
	$(INSTALL_DIR) \
		$(1)/usr/bin $(1)/usr/share/netsurf

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/netsurf \
		$(1)/usr/bin/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/netsurf/* \
		$(1)/usr/share/netsurf/
endef

$(eval $(call BuildPackage,netsurf))
