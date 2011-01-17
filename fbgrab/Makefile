#
# Author: Xiangfu Liu <xiangfu@sharism.cc>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fbgrab
PKG_VERSION:=1.0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://hem.bredband.net/gmogmo/fbgrab/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/fbgrab
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    TITLE:=framebuffer screenshot program
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=+zlib +libpng
    URL:=http://hem.bredband.net/gmogmo/fbgrab/
endef

define Package/fbgrab/description
    FBGrab is a framebuffer screenshot program
endef

TARGET_LDFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/fbgrab/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/fbgrab $(1)/usr/bin/
endef

$(eval $(call BuildPackage,fbgrab))
