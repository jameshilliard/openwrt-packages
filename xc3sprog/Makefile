include $(TOPDIR)/rules.mk

PKG_NAME:=xc3sprog
PKG_REV:=742
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://xc3sprog.svn.sourceforge.net/svnroot/xc3sprog/trunk
PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/xc3sprog
  SECTION:=
  CATEGORY:=
  TITLE:=
  URL:=
  DEPENDS:=
endef

define Package/MPlayer/description
  
endef

CONFIGURE_ARGS += 
TARGET_CFLAGS += 

define Package/MPlayer/install
	$(INSTALL_DIR) $(1)/usr/bin

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/mplayer \
		$(1)/usr/bin/xc3sprog
endef

$(eval $(call BuildPackage,xc3sprog))
