# 
# Author : Ernest Kugel <erik.kugel@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=myserver
PKG_VERSION:=0.9.2
PKG_RELEASE:=1

PKG_SOURCE:=myserver-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gnu.org/gnu/myserver/0.9.2
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/myserver
    SECTION:=utils
    CATEGORY:=Utilities
    TITLE:=MyServer is a powerful and easy to configure web server
    URL:=http://www.myserverproject.net/index.php/Main_Page
    DEPENDS:=@BROKEN +libgnutls-openssl
endef

define Package/myserver/description
	MyServer is a powerful and easy to configure web server.
	Its multi-threaded architecture makes it extremely scalable and
	usable in large scale sites as well as in small networks, it has
	a lot of built-in features. Share your files in minutes!
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Package/myserver/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/myserver/myserver $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,myserver))
