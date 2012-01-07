#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fbterm
PKG_VERSION:=1.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).0.tar.gz
PKG_SOURCE_URL:=http://fbterm.googlecode.com/files/
PKG_MD5SUM:=c36bae75a450df0519b4527cccaf7572

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/fbterm
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=FbTerm, a fast FrameBuffer based TERMinal emulator for linux
  URL:=http://code.google.com/p/fbterm/
  SUBMENU:=Terminal
  DEPENDS:=$(ICONV_DEPENDS) +fontconfig +unifont +libstdcpp
endef

define Package/fbterm/description
  FbTerm is a fast terminal emulator for linux with frame buffer device
endef

TARGET_LDFLAGS+= \
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib -liconv

define Package/fbterm/install
	$(INSTALL_DIR) \
		$(1)/usr/bin $(1)/usr/share/fbterm

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/src/fbterm \
		$(1)/usr/bin/fbterm

	$(INSTALL_DATA) \
		$(FILES_DIR)/fbtermrc \
		$(1)/usr/share/fbterm
endef

define Package/fbterm/postinst
#! /bin/sh
mkdir -p $${IPKG_INSTROOT}/root && cp $${IPKG_INSTROOT}/usr/share/fbterm/fbtermrc $${IPKG_INSTROOT}/root/.fbtermrc
endef

$(eval $(call BuildPackage,fbterm))
