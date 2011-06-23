# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=lingot
PKG_VERSION:=0.9.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.savannah.gnu.org/releases/lingot/
PKG_MD5SUM:=363612bd55d3dc204d23cd26e25ef1f5

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/lingot
    TITLE:=LINGOT Is Not a Guitar-Only Tuner
    SECTION:=utilities
    CATEGORY:=Utilities
    URL:=http://www.nongnu.org/lingot/
    DEPENDS:=+alsa-lib +gtk2 +libglade
endef

define Package/lingot/description
    LINGOT is a musical instrument tuner. It's accurate, easy to use, and highly configurable. Originally conceived to tune electric guitars, it can now be used to tune other instruments.
endef

CONFIGURE_ARGS += \
	--enable-alsa \
	--disable-jack

TARGET_CFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib $(ICONV_CFLAGS) $(INTL_CFLAGS)

define Package/lingot/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share/lingot/glade
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/lingot $(1)/usr/bin/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/glade/*.glade $(1)/usr/share/lingot/glade/
	$(CP) $(FILES_DIR)/lingot.conf $(1)/usr/share/lingot/
endef

define Package/lingot/postinst
#!/bin/sh
mkdir -p $${IPKG_INSTROOT}/root/.lingot && cp $${IPKG_INSTROOT}/usr/share/lingot/lingot.conf $${IPKG_INSTROOT}/root/.lingot/lingot.conf
endef

$(eval $(call BuildPackage,lingot))
