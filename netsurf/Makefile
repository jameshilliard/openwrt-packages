# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=netsurf
PKG_VERSION:=2.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=http://download.netsurf-browser.org/netsurf/releases/source/
PKG_MD5SUM:=7e5efab690bb473e7cdb6936202f5f95
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_UNPACK:=gzip -dc $(DL_DIR)/$(PKG_SOURCE) | $(TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xf -

include $(INCLUDE_DIR)/package.mk

define Package/netsurf
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SUBMENU:=Web
	SECTION:=network
	CATEGORY:=Network
	TITLE:=netsurf
	URL:=http://www.netsurf-browser.org/
	DEPENDS:=+libsdl +libcss +libhubbub +libparserutils +libnsfb +libxml2 +libcurl +libfreetype +libnsbmp +libnsgif
endef

define Package/netsurf/description
	NetSurf is a free, open source web browser. It is written in C and released under the GNU Public Licence version 2. NetSurf has its own layout and rendering engine entirely written from scratch. It is small and capable of handling many of the web standards in use today.
endef

MAKE_FLAGS += "TARGET=framebuffer" \
			  "PREFIX=/usr"
#MAKE_FLAGS += "TARGET=gtk" \
#	      "PREFIX=/usr"

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/SDL
#TARGET_CFLAGS += "-I$(STAGING_DIR)/usr/include/gtk-2.0"
TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) $(FILES_DIR)/Makefile.config $(PKG_BUILD_DIR)
endef

define Package/netsurf/install
	$(INSTALL_DIR) \
		$(1)/usr/bin $(1)/usr/share/netsurf

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/nsfb \
		$(1)/usr/bin/netsurf

	cp -rfL \
		$(PKG_BUILD_DIR)/framebuffer/res/* \
		$(1)/usr/share/netsurf/

	$(INSTALL_DATA) \
		$(FILES_DIR)/Choices \
		$(1)/usr/share/netsurf/

	#That's really dirty... For some reason overriding font paths from Makefile doesn't work
	mkdir -p $(1)/usr/share/netsurf/usr/share/fonts
	ln -s ../../../../fonts/ttf-dejavu $(1)/usr/share/netsurf/usr/share/fonts/ttf-dejavu
endef

define Package/netsurf/postinst
#!/bin/sh
mkdir -p $${IPKG_INSTROOT}/root/.netsurf && cp $${IPKG_INSTROOT}/usr/share/netsurf/Choices $${IPKG_INSTROOT}/root/.netsurf/Choices
endef

$(eval $(call BuildPackage,netsurf))
