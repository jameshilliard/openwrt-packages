#
# Copyright (C) 2005-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mupdf
PKG_VERSION:=0.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://mupdf.com/download/
PKG_MD5SUM:=83adc4d14eb17835df791a9a0d1e8fa9

include $(INCLUDE_DIR)/package.mk

define Package/mupdf/Default
  URL:=http://mupdf.com
  DEPENDS:=+jbig2dec +openjpeg +zlib +libfreetype +libjpeg
endef

define Package/mupdf
  $(call Package/mupdf/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=lightweight PDF viewer and toolkit written in portable C
endef

define Package/mupdf-tools
  $(call Package/mupdf/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Command-line PDF tools
endef

define Package/mupdf/description
  MuPDF is a lightweight PDF viewer and toolkit written in portable C.
endef

define Package/mupdf-tools/description
  This package installs command-line tools: pdfclean, pdfinfo, pdfdraw, pdfextract, pdfshow
endef

TARGET_CFLAGS+= \
        -I$(STAGING_DIR)/usr/include/freetype2 \
	-I$(PKG_BUILD_DIR)/mupdf \
	-I$(PKG_BUILD_DIR)/fitz

TARGET_LDFLAGS+= \
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

MAKE_FLAGS+=build=release prefix=/usr verbose=true pregen=build/generated

define Build/Configure
	$(INSTALL_DIR) $(PKG_BUILD_DIR)/build
	$(CP) $(FILES_DIR)/generated $(PKG_BUILD_DIR)/build
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/mupdf/mupdf.h \
		$(PKG_BUILD_DIR)/fitz/fitz.h \
		$(PKG_BUILD_DIR)/apps/pdfapp.h \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/build/release/libmupdf.a \
		$(1)/usr/lib/
endef

define Package/mupdf-tools/install
	$(INSTALL_DIR) \
		$(1)/usr/bin

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/build/release/{pdfclean,pdfinfo,pdfdraw,pdfextract,pdfshow} \
		$(1)/usr/bin

endef

$(eval $(call BuildPackage,mupdf))
$(eval $(call BuildPackage,mupdf-tools))
