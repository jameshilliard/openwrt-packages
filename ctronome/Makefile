#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ctronome
PKG_VERSION:=0.5.3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ctronome.kign.org/source/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/ctronome
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    TITLE:=console metronome software
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=
    URL:=http://ctronome.kign.org/
endef

define Package/ctronome/description
    a very simple yet powerful ;) programmable console metronome software
endef

define Build/Install
#overwirte the openwrt automatic install 
#there is not install in ctronome Makefile
endef

define Package/ctronome/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/share/ctronome
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ctronome $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/metronome*.wav $(1)/usr/share/ctronome/
endef

$(eval $(call BuildPackage,ctronome))
