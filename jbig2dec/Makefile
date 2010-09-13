#
# Copyright (C) 2005-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=jbig2dec
PKG_VERSION:=0.11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ghostscript.com/~giles/jbig2/jbig2dec/
PKG_MD5SUM:=1f61e144852c86563fee6e5ddced63f1

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/jbig2dec
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=decoder implementation of the JBIG2 image compression format
  URL:=http://jbig2dec.sourceforge.net/
endef

define Package/jbig2dec/description
  jbig2dec is a decoder implementation of the JBIG2 image compression format.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/jbig2.h \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libjbig2dec.{la,a,so*} \
		$(1)/usr/lib/
endef

define Package/jbig2dec/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libjbig2dec.so.* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,jbig2dec))
