include $(TOPDIR)/rules.mk

PKG_NAME:=plucker
PKG_VERSION:=1.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_src-$(PKG_VERSION).tar.bz2
	PKG_SOURCE_URL:=http://downloads.plkr.org/1.8/
	PKG_CAT:=bzip2 -cd

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/plucker
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Plucker files reader (PDB)
	DEPENDS:=@BROKEN +zlib $(ICONV_DEPENDS) $(INTL_DEPENDS) +libgconf2 +libjpeg +pixman +fontconfig +libfreetype +pango +atk +libpng +DirectFB 
	URL=http://www.plkr.org
endef

define Package/plucker/description
    Plucker can view files made by the Plucker Distiller (Project Gutenberg books, for example).
endef

TARGET_LDFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/Configure
	$(call Build/Configure/Default, \
	--prefix=/usr \
	--disable-palmosbuild \
	--disable-docbuild \
	--disable-java-distiller\
	--enable-gtkviewer\
	--enable-unplug \
	--disable-explode \
	--disable-desktopbuild, \
	LIBS="$(ICONV_LDFLAGS) $(INTL_LDFLAGS) -L$(STAGING_DIR)/usr/lib -lgtk-directfb-2.0 -lgdk-directfb-2.0 -latk-1.0 -lgio-2.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lpangoft2-1.0 -lpango-1.0 -lcairo -lgobject-2.0 -lgmodule-2.0 -lglib-2.0 -lfreetype -lfontconfig -ljpeg -lpng -lpixman-1 -ldirectfb -ldirect -lfusion -lexpat -lz -lm"\
	)
endef


define Package/plucker/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/viewer-GTK+2-POSIX/plucker $(1)/usr/bin/
endef

$(eval $(call BuildPackage,plucker))
