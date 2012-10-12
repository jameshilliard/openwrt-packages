include $(TOPDIR)/rules.mk

PKG_NAME:=aewan
PKG_VERSION:=1.0.01
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/aewan
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Ascii Art Editor
	URL:=http://aewan.sourceforge.net/
	DEPENDS:=+libncurses +zlib
endef

define Package/aewan/description
	Ascii Art Editor
endef

CONFIGURE_ARGS+="--prefix=/usr/bin"
TARGET_CFLAGS+= -I$(STAGING_DIR)/usr/include

define Package/aewan/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/aewan \
		$(PKG_BUILD_DIR)/aecat \
		$(PKG_BUILD_DIR)/aemakeflic \
		$(1)/usr/bin
endef

$(eval $(call BuildPackage,aewan))
