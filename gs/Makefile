#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ghostscript
PKG_VERSION:=9.02
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.ghostscript.com/public/
PKG_MD5SUM:=86cc3a0509c0d96a641d58879d54274b

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/ghostscript
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=interpreter for the PostScript language and for PDF
  URL:=http://pages.cs.wisc.edu/~ghost/
  DEPENDS:=+libtiff $(ICONV_DEPENDS) +libpng +fontconfig +libfreetype @BUILD_NLS +libidn
endef

define Package/ghostscript/description
  Ghostscript is an interpreter for the PostScript language and for PDF
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	mkdir $(PKG_BUILD_DIR)/obj
	#(cd $(PKG_BUILD_DIR); ./configure;);
	#make -C $(PKG_BUILD_DIR) obj/arch.h obj/genconf obj/echogs
	for i in genarch genconf echogs; do \
	gcc -O2 -Wall -Wstrict-prototypes -Wundef -Wmissing-declarations -Wmissing-prototypes -Wwrite-strings -Wno-strict-aliasing -Wdeclaration-after-statement -fno-builtin -fno-common -DHAVE_STDINT_H -DGX_COLOR_INDEX_TYPE="unsigned long long"   -I$(PKG_BUILD_DIR)/base -o $(PKG_BUILD_DIR)/obj/$$$$i $(PKG_BUILD_DIR)/base/$$$$i.c; \
	done
endef

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CONFIGURE_ARGS += \
	--with-system-libtiff \
	$(if $(ICONV_FULL),--with-libiconv=gnu) \
	--without-x \
	--without-jbig2dec \
	--without-jasper

MAKE_FLAGS += \
	EXTRALIBS="-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
		$(ICONV_LDFLAGS) -L$(STAGING_DIR)/usr/lib \
		-lfontconfig -lfreetype -ldl -liconv -lidn" \
	COMPILE_INITS="0"

define Package/ghostscript/install
	$(INSTALL_DIR) \
		$(1)/usr/bin $(1)/usr/share/$(PKG_NAME)/$(PKG_VERSION)

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/bin/gs \
		$(1)/usr/bin/gs

	$(CP) $(PKG_BUILD_DIR)/{Resource,lib,iccprofiles} \
		$(1)/usr/share/$(PKG_NAME)/$(PKG_VERSION)/
endef

$(eval $(call BuildPackage,ghostscript))
