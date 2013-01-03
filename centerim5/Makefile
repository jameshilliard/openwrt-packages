#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=centerim5
PKG_VERSION:=git
PKG_REV:=95bb9eb08d73e171e40a9bcfaafe4bc39e650034
PKG_RELEASE:=1
PKG_INSTALL:=1
PKG_FIXUP:=gettext-version

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://repo.or.cz/centerim5.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/centerim5
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Instant Messaging
	DEPENDS:=+libpurple +libsigcxx $(INTL_DEPENDS)
	TITLE:=Universal IM client
	URL:=http://www.centerim.org
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	(cd $(PKG_BUILD_DIR) && ./bootstrap)
endef

CONFIGURE_ARGS+=--with-libintl-prefix=$(INTL_PREFIX)
TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib -lintl -liconv
TARGET_CFLAGS+=-std=c99
DISABLE_NLS:=--enable-nls
#MAKE_FLAGS+="SUBDIRS = cppconsui misc src tests"

define Package/centerim5/description
	Centerim is a multi-protocol messaging client.
	Works in a character terminal.
endef

define Package/centerim5/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib $(1)/usr/share/locale
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/centerim5 $(1)/usr/bin
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib
	cp -r $(PKG_INSTALL_DIR)/usr/share/locale/* $(1)/usr/share/locale
endef

$(eval $(call BuildPackage,centerim5))
