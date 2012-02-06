# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=newsbeuter
PKG_VERSION:=2.5

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://newsbeuter.org/downloads/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/newsbeuter
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=network
	CATEGORY:=Network
	TITLE:=newsbeuter
	URL:=http://newsbeuter.org/index.html
	DEPENDS:= @BROKEN
endef

define Package/newsbeuter/description
Newsbeuter is an open-source RSS/Atom feed reader for text terminals.
It runs on Linux, FreeBSD, Mac OS X and other Unix-like operating systems.
Newsbeuter's great configurability and vast number of features make it a
perfect choice for people that need a slick and fast feed reader that can
be completely controlled via keyboard.
endef

CONFIGURE_ARGS +=
TARGET_CFLAGS +=
TARGET_LDFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/newsbeuter/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/newsbeuter $(1)/usr/bin/
endef

$(eval $(call BuildPackage,newsbeuter))
