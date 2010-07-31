#
# Copyright (C) 2005-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libassuan
PKG_VERSION:=2.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.gnupg.org/gcrypt/libassuan/
PKG_MD5SUM:=59bc0ae7194c412d7a522029005684b2
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/libassuan
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=IPC library used by some GnuPG related software
  URL:=http://www.gnupg.org
endef

define Package/libassuan/description
	Libassuan is the IPC library used by some GnuPG related software.
endef

TARGET_CFLAGS += $(FPIC)

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(2)/bin $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/libassuan-config \
		$(2)/bin/
	$(SED) \
		's,^\(prefix\|exec_prefix\)=.*,\1=$(STAGING_DIR)/usr,g' \
		$(2)/bin/libassuan-config
	ln -sf $(STAGING_DIR)/host/bin/libassuan-config $(1)/usr/bin/libassuan-config

	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/assuan.h \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libassuan.{la,a,so*} \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/share/aclocal
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/aclocal/libassuan.m4 \
		$(1)/usr/share/aclocal/
endef

define Package/libassuan/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libassuan.so.* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libassuan))
