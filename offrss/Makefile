include $(TOPDIR)/rules.mk

PKG_NAME:=offrss
PKG_VERSION:=1.0
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://vicerveza.homeunix.net/~viric/soft/offrss/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/offrss
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=network
	CATEGORY:=Network
	TITLE:=Offrss
	URL:=http://vicerveza.homeunix.net/~viric/cgi-bin/offrss/doc/trunk/doc/home.wiki
	DEPENDS:=+libcurl +libnxml +libmrss
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include
TARGET_LDFLAGS += -Wl,-rpath-link -Wl,$(STAGING_DIR)/usr/lib -liconv

define Package/offrss/description
	offrss - Offline RSS reader
endef

define Package/offrss/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/offrss $(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/share/offrss
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/share/offrss/
	$(CP) ./files/feedurls.txt $(1)/usr/share/offrss/
endef

$(eval $(call BuildPackage,offrss))
