#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=qstardict
PKG_VERSION:=0.13.1
PKG_RELEASE:=1
PKG_SOURCE_URL:=http://qstardict.ylsoftware.com/files/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=0828c3fa01c5237db8a67d356a9d1a8c

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
$(call include_mk,qmake.mk)

define Package/qstardict
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Qt clone of stardict
	DEPENDS:=+qt4 +qt4-gui +dejavu-fonts-ttf +qt4-network +qt4-xml +glib2
	URL:=http://qstardict.ylsoftware.com
endef

define Build/Configure
	$(call Build/Configure/Qmake,qstardict)
endef

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/qstardict/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib/qstardict/plugins
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/qstardict/qstardict $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/plugins/stardict/libstardict.so $(1)/usr/lib/qstardict/plugins
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/plugins/web/libweb.so $(1)/usr/lib/qstardict/plugins
endef

$(eval $(call BuildPackage,qstardict))
