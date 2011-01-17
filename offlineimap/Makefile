# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=offlineimap
PKG_VERSION:=6.2.0.2

PKG_SOURCE:=jgoerzen-$(PKG_NAME)-debian-$(PKG_VERSION)-0-g6b1cb5e.tar.gz
PKG_SOURCE_URL:=http://download.github.com/
PKG_BUILD_DIR:=$(BUILD_DIR)/jgoerzen-$(PKG_NAME)-0f1a667
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/offlineimap
  MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=offlineimap
  URL:=http://wiki.github.com/jgoerzen/offlineimap/
  DEPENDS:=python @BROKEN
endef

define Package/offlineimap/description
  Read/sync your IMAP mailboxes [Python] 
endef

define Build/Compile
endef

define Package/offlineimap/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/offlineimap/offlineimap

	echo -e "\0043\0041/bin/sh\n(cd /usr/share/offlineimap; ./offlineimap.py)" > $(1)/usr/bin/offlineimap
	chmod +x $(1)/usr/bin/offlineimap

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/bin/offlineimap \
		$(1)/usr/share/offlineimap/offlineimap.py
	$(CP) \
		$(PKG_BUILD_DIR)/offlineimap/* \
		$(1)/usr/share/offlineimap/offlineimap/
endef

$(eval $(call BuildPackage,offlineimap))
