include $(TOPDIR)/rules.mk

PKG_NAME:=ascii-paint
PKG_REV:=13
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ascii-paint.googlecode.com/svn/branches/nanonote/
PKG_BUILD_DIR=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/ascii-paint
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Ascii-Paint
	URL:=http://code.google.com/p/ascii-paint/
	DEPENDS:=+libtcod
endef

define Package/ascii-paint/description
ASCII-Paint is a simple, open source painting program which uses ASCII characters instead of pixels to draw images. It was made to help rogue-like developers, though it can be used by anyone. 
endef

TARGET_CFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
		-L$(STAGING_DIR)/usr/lib

CMAKE_OPTIONS+= -DCMAKE_C_COMPILER=$(TOOLCHAIN_DIR)/bin/$(TARGET_CC) \
	-DCMAKE_CXX_COMPILER=$(TOOLCHAIN_DIR)/bin/$(TARGET_CXX) \
	-DQT_QMAKE_EXECUTABLE=$(STAGING_DIR_HOST)/bin/qmake \
	-DQT_MOC_EXECUTABLE=$(STAGING_DIR_HOST)/bin/moc \
	-DQT_UIC_EXECUTABLE=$(STAGING_DIR_HOST)/bin/uic \
	-DQT_RCC_EXECUTABLE=$(STAGING_DIR_HOST)/bin/rcc

define Package/ascii-paint/install
	$(INSTALL_DIR) $(1)/usr/lib/ascii-paint
	$(CP) $(PKG_BUILD_DIR)/ascii-paint $(1)/usr/lib/ascii-paint
	$(CP) $(PKG_BUILD_DIR)/ascii-paint.cfg $(1)/usr/lib/ascii-paint
	$(CP) $(PKG_BUILD_DIR)/terminal.png $(1)/usr/lib/ascii-paint
endef

$(eval $(call BuildPackage,ascii-paint))
