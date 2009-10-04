#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=zimlib
PKG_REV:=239
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1
PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://svn.openzim.org/svnroot/trunk/zimlib
PKG_BUILD_DIR=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/

PKG_INSTALL:=1

PKG_FIXUP:=libtool-uclibxx

include $(INCLUDE_DIR)/package.mk

#CONFIGURE_VARS += \
#    CXX="g++-uc"
#
#MAKE_FLAGS += \
#    CXX="g++-uc"

define Package/zimlib
    TITLE:=zimlib
    SECTION:=network
    CATEGORY:=Network
    #DEPENDS:=+zlib +bzip2 +cxxtools +uclibcxx
    DEPENDS:=+zlib +bzip2 +cxxtools +libstdcpp
    URL:=http://openzim.org
endef

define Package/zimlib/description
    foobar
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/zimlib/install
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,zimlib))
