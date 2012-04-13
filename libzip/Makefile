#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libzip
PKG_VERSION:=0.10.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.nih.at/libzip/
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

#TARGET_LDFLAGS+= \
#	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

#CONFIGURE_ARGS +=

#CONFIGURE_CMD = ./autogen.sh

define Package/libzip
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Libzip
  URL:=http://www.nih.at/libzip/
  DEPENDS:=
endef

define Package/libzip/description
libzip is a C library for reading, creating, and modifying zip archives.
Files can be added from data buffers, files, or compressed data copied
directly from other zip archives.
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib

	$(CP) 	$(PKG_INSTALL_DIR)/usr/include/* \
		$(PKG_INSTALL_DIR)/usr/lib/libzip/include/* \
		$(1)/usr/include/

	$(CP) 	$(PKG_INSTALL_DIR)/usr/lib/*.{a,la,so*} \
		$(1)/usr/lib/
endef

define Package/libzip/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libzip))
