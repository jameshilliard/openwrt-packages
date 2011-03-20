# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=flite
PKG_VERSION:=1.4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-release.tar.bz2
PKG_SOURCE_URL:=http://www.speech.cs.cmu.edu/flite/packed/flite-1.4/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-release/
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/flite
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=festival-lite
  URL:=http://www.speech.cs.cmu.edu/flite/index.html
  DEPENDS:=+alsa-lib
endef

define Package/flite/description
  a small, fast run-time synthesis engine
endef

define Package/flite/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/flite $(1)/usr/bin/
endef

$(eval $(call BuildPackage,flite))

