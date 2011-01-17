include $(TOPDIR)/rules.mk

PKG_NAME:=tunec
PKG_REV:=2
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://tunec.googlecode.com/svn/trunk/
PKG_BUILD_DIR=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

define Package/tunec
  MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A command line guitar tuner for linux
  URL:=http://code.google.com/p/tunec/
  DEPENDS:=+fftw3
endef

TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include
TARGET_LDFLAGS+= -lfftw3

define Build/Compile
	(cd $(PKG_BUILD_DIR); \
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) tuner.c -o $(PKG_NAME); \
	)
endef

define Package/tunec/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/tunec \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,tunec))
