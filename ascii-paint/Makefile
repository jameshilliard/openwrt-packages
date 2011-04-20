include $(TOPDIR)/rules.mk

PKG_NAME:=ascii-paint
PKG_VERSION:=0.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.zip
PKG_SOURCE_URL:=
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-src
UNPACK_CMD=unzip -d $(1)/../ $(DL_DIR)/$(PKG_SOURCE)

include $(INCLUDE_DIR)/package.mk

define Package/ascii-paint
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Ascii-Paint
	URL:=http://code.google.com/p/ascii-paint/
	DEPENDS:=@BROKEN +libtcod
endef

define Package/ascii-paint/description
ASCII-Paint is a simple, open source painting program which uses ASCII characters instead of pixels to draw images. It was made to help rogue-like developers, though it can be used by anyone. 
endef

TARGET_CFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
		-L$(STAGING_DIR)/usr/lib

MAKE_VARS+=TEMP=$(PKG_BUILD_DIR)/obj \
	INCDIR=$(PKG_BUILD_DIR)/tcod

define Package/ascii-paint/install
	$(INSTALL_DIR) $(1)/usr/lib
endef

$(eval $(call BuildPackage,ascii-paint))
