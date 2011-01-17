include $(TOPDIR)/rules.mk

PKG_NAME:=poke
PKG_REV:=5975
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://svn.openmoko.org/developers/werner/$(PKG_NAME)
PKG_BUILD_DIR=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/

include $(INCLUDE_DIR)/package.mk

define Package/poke
  SECTION:=utils
  CATEGORY:=Utilities
  MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
  TITLE:=Read or write any CPU register
  URL:=http://svn.openmoko.org/developers/werner/poke
endef

define Package/poke/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/poke \
		$(1)/usr/bin/
endef

$(eval $(call BuildPackage,poke))
