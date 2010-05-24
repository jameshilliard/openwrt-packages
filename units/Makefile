# $Id: Makefile 5624 2006-11-23 00:29:07Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=units
PKG_VERSION:=1.88
PKG_RELEASE:=1
#http://ftp.gnu.org/gnu/units/units-1.88.tar.gz

PKG_SOURCE:=units-$(PKG_VERSION).tar.gz
	PKG_SOURCE_URL:=http://ftp.gnu.org/gnu/units
	PKG_MD5SUM:=9b2ee6e7e0e9c62741944cf33fc8a656
	PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/units-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/units
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Units
	URL:=http://www.gnu.org/software/units/units.html#downloading
	DEPENDS+= +libreadline
endef

define Package/units/description
	Simple unit converter
endef

#define Build/Configure
#	$(call Build/Configure/Default, \
#		--prefix=/usr \
#	)
#endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) $(FPIC)" \
		UNAME_S="Linux" \
		./configure \
		--host=mipsel \
			--prefix=/usr \
	);
endef


define Package/units/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/units $(1)/usr/bin/
	 $(INSTALL_DIR) $(1)/usr/share/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/units.dat $(1)/usr/share/
endef

$(eval $(call BuildPackage,units))
