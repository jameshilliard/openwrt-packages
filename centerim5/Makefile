#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=centerim5
PKG_VERSION:=alpha
PKG_REV:=5a97f76e6fc5dc0c6c72b923b843f6f66b1f12e6
PKG_RELEASE:=1

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

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib $(INTL_LDFLAGS)
MAKE_FLAGS+="SUBDIRS = cppconsui misc src tests"

define Package/centerim5/description
	Centerim is a multi-protocol messaging client.
	Works in a character terminal.
endef

define Package/centerim5/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/.libs/centerim5 $(1)/usr/bin
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/cppconsui/.libs/*.so* $(1)/usr/lib
endef

$(eval $(call BuildPackage,centerim5))
