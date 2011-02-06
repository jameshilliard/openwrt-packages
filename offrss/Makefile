include $(TOPDIR)/rules.mk

PKG_NAME:=offrss
PKG_VERSION:=trunk
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).zip
PKG_SOURCE_URL:=http://downloads.qi-hardware.com/software/mirror-openwrt-sources/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
UNPACK_CMD=unzip $(DL_DIR)/$(PKG_SOURCE) -d $(1)/../

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

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/offrss/install
	# $(INSTALL_DIR) $(1)/usr/bin
	# echo -e "\0043\0041/bin/sh\n(cd /usr/share/offrss; ./offrss $$*)" > $(1)/usr/bin/offrss
	# chmod +x $(1)/usr/bin/offrss

	$(INSTALL_DIR) $(1)/usr/share/offrss
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/share/offrss/
	$(CP) ./files/feedurls.txt $(1)/usr/share/offrss/
endef

$(eval $(call BuildPackage,offrss))
