#
# Copyright (C) 2012 Xiangfu Liu <xiangfu@openmobilefree.net>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xburst-tools
PKG_VERSION:=20120605
PKG_REV:=ff28d4c923a489cef1af0b761b9026e1c65a7a48
PKG_RELEASE:=1
PKG_INSTALL:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/xburst-tools.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

TARGET_LDFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/xburst-tools
  MAINTAINER:="Xiangfu Liu" <xiangfu@openmobilefree.net>
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Xburst-Tools
  URL:=http://projects.qi-hardware.com/p/xburst-tools/
  DEPENDS:=+libusb +libusb-1.0 +confuse +libreadline +libncurses
endef

define Package/xburst-tools/description
Tools for Ingenic XBurst CPU USB boot and NAND flash access
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default, \
		--disable-firmware \
		--prefix=/usr \
		--sysconfdir=/etc \
	)
endef

define Package/xburst-tools/install
	(cd $(PKG_BUILD_DIR) && \
	 wget http://projects.qi-hardware.com/media/upload/xburst-tools/files/xburst-tools-firmware-201105.tar.bz2 && \
	 tar xvf xburst-tools-firmware-201105.tar.bz2)

	$(INSTALL_DIR) $(1)/usr/share/xburst-tools/
	$(CP) $(PKG_BUILD_DIR)/xburst-tools-firmware/* $(1)/usr/share/xburst-tools/

	$(CP) $(PKG_BUILD_DIR)/ipkg-install/* $(1)/
endef

$(eval $(call BuildPackage,xburst-tools))
