# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=binkd
PKG_VERSION:=1.0a
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=:pserver:binkd@cvs.happy.kiev.ua:/cvs
PKG_SOURCE_VERSION:=-D"2008/04/01 20:58:42"
PKG_SOURCE_SUBDIR:=binkd
PKG_SOURCE_PROTO:=cvs

include $(INCLUDE_DIR)/package.mk

PKG_UNPACK:=gzip -dc $(DL_DIR)/$(PKG_SOURCE) | $(TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xf -

define Package/binkd
    TITLE:=Fidonet mailer
    SECTION:=utilities
    CATEGORY:=Utilities
    URL:=http://binkd.grumbler.org
    DEPENDS:=+zlib +bzip2
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	(cd $(PKG_BUILD_DIR) && $(CP) mkfls/unix/* .)
endef

CONFIGURE_ARGS += \
	--with-zlib="$(STAGING_DIR)/usr" \
	--with-bzip2="$(STAGING_DIR)/usr"

define Package/binkd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/binkd $(1)/usr/bin/
endef

$(eval $(call BuildPackage,binkd))
