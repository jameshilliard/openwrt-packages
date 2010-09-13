#
# Copyright (C) 2005-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=openjpeg
PKG_VERSION:=1.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_v1_3.tar.gz
PKG_SOURCE_URL:=http://openjpeg.googlecode.com/files/
PKG_MD5SUM:=f9a3ccfa91ac34b589e9bf7577ce8ff9

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1
PKG_UNPACK:=gzip -dc $(DL_DIR)/$(PKG_SOURCE) | $(TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xf -

define Package/openjpeg
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=open-source JPEG 2000 codec written in C language.
  URL:=http://www.openjpeg.org
endef

define Package/openjpeg/description
  The OpenJPEG library is an open-source JPEG 2000 codec written in C language.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/openjpeg.h \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libopenjpeg.{a,so*} \
		$(1)/usr/lib/
endef

define Package/openjpeg/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libopenjpeg.so.* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,openjpeg))
