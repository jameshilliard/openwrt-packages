#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@sharism.cc>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=stardict
PKG_VERSION:=3.0.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://downloads.sourceforge.net/stardict/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/stardict/Default
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=stardict
    TITLE:=International Dictionary Software
endef

define Package/stardict/description
    StarDict is a Cross-Platform and international dictionary Software.
endef

define Package/stardict
    $(call Package/stardict/Default)
    DEPENDS:=$(ICONV_DEPENDS) $(INTL_DEPENDS) +libgconf2 +gtk2 +libstdcpp +libsigcxx
endef

define Package/stardict-dic-en-en
    $(call Package/stardict/Default)
    TITLE+=(dictionary: English <-> English)
endef

define Package/stardict-dic-en-cn
    $(call Package/stardict/Default)
    TITLE+=(dictionary: oxfordjm English <-> Chinese)
endef

define Package/stardict-dic-en-sp
    $(call Package/stardict/Default)
    TITLE+=(dictionary: I2E English <-> Spanish)
endef

TARGET_LDFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CONFIGURE_CMD =./autogen.sh
CONFIGURE_ARGS += \
	--disable-dependency-tracking \
	--disable-libtool-lock \
	--disable-spell \
	--disable-gucharmap \
	--disable-festival \
	--disable-espeak \
	--disable-dictdotcn \
	--disable-advertisement \
	--disable-qqwry \
	--disable-updateinfo \
	--disable-htmlparse \
	--disable-xdxfparse \
	--disable-wordnet \
	--disable-powerwordparse \
	--disable-wikiparse \
	--disable-schemas-install \
	--disable-deprecations \
	--disable-gnome-support \
	--enable-nanonote-support

define Package/stardict/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/share \
		$(1)/usr/share/pixmaps \
		$(1)/usr/lib/stardict/plugins

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/stardict \
		$(1)/usr/bin/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pixmaps/stardict.png \
		$(1)/usr/share/pixmaps/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/stardict \
		$(1)/usr/share/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/stardict/plugins/* \
		$(1)/usr/lib/stardict/plugins/
endef

define Package/stardict-dic-en-en/install
	$(INSTALL_DIR) \
		$(1)/usr/share/stardict/dic

	$(TAR) \
		-C $(1)/usr/share/stardict/dic/ \
		-jxf \
		./files/stardict-english-2.4.2.tar.bz2

	$(CP)	./files/longman.idx.oft \
		$(1)/usr/share/stardict/dic/stardict-english-2.4.2/
endef

define Package/stardict-dic-en-cn/install
	$(INSTALL_DIR) \
		$(1)/usr/share/stardict/dic

	$(TAR) \
		-C $(1)/usr/share/stardict/dic/ \
		-jxf \
		./files/stardict-oxfordjm-ec-2.4.2.tar.bz2

	$(CP)	./files/oxfordjm-ec.idx.oft \
		$(1)/usr/share/stardict/dic/stardict-oxfordjm-ec-2.4.2/
endef

define Package/stardict-dic-en-sp/install
	$(INSTALL_DIR) \
		$(1)/usr/share/stardict/dic

	$(TAR) \
		-C $(1)/usr/share/stardict/dic/ \
		-jxf \
		./files/stardict-i2e-2.4.2.tar.bz2

	$(CP)	./files/i2e.idx.oft \
		$(1)/usr/share/stardict/dic/stardict-i2e-2.4.2/
endef

$(eval $(call BuildPackage,stardict))
$(eval $(call BuildPackage,stardict-dic-en-en))
$(eval $(call BuildPackage,stardict-dic-en-cn))
$(eval $(call BuildPackage,stardict-dic-en-sp))
