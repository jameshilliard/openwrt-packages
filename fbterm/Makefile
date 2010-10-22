#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fbterm
PKG_VERSION:=1.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://fbterm.googlecode.com/files/
PKG_MD5SUM:=531ea0984836b58fd123e6a97a4228c6

include $(INCLUDE_DIR)/package.mk

define Package/fbterm
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=FbTerm, a fast FrameBuffer based TERMinal emulator for linux
  URL:=http://code.google.com/p/fbterm/
  SUBMENU:=Terminal
  DEPENDS:=+libiconv +fontconfig +unifont
endef

define Package/fbterm/description
  FbTerm is a fast terminal emulator for linux with frame buffer device
endef

TARGET_CFLAGS+= \
        -I$(STAGING_DIR)/usr/lib/libiconv/include

TARGET_LDFLAGS+= \
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
        -L$(STAGING_DIR)/usr/lib/libiconv/lib -liconv

define Package/fbterm/install
	$(INSTALL_DIR) \
		$(1)/usr/bin

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/src/fbterm \
		$(1)/usr/bin/fbterm

endef

$(eval $(call BuildPackage,fbterm))
