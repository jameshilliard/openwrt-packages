#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=zimlib
PKG_VERSION:=0.92.20091227-3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.openzim.org/download

PKG_INSTALL:=1

#PKG_FIXUP:=libtool-uclibxx
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

# we have to to stick to libstdc++ for, as zimlib is using locales hardcoded and the uclibc++ does not have locales-support
#CONFIGURE_VARS += \
#    CXX="g++-uc"
#
#MAKE_FLAGS += \
#    CXX="g++-uc"

define Package/zimlib
    TITLE:=zimlib
    SECTION:=libs
    CATEGORY:=Libraries
    DEPENDS:=+zlib +bzip2 +cxxtools +libstdcpp +xz
    URL:=http://openzim.org
endef

define Build/Configure
	$(call Build/Configure/Default, \
        --with-cluster-cache-size=5 \
		--disable-unittest \
		--enable-benchmark \
    )
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.{a,la,so*} $(1)/usr/lib/
endef

define Package/zimlib/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,zimlib))
