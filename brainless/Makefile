# 
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for Brainless chess playing program

include $(TOPDIR)/rules.mk

PKG_NAME:=brainless
PKG_VERSION:=0.1.2
PKG_RELEASE:=2
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/forth-brainless
PKG_MD5SUM:=ed4a4cbbe23628b17edc5aa01f32f7fb
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/brainless/Default
  SECTION:=games
  CATEGORY:=Games
  TITLE:=Brainless (a chess playing program)
  URL:=https://sourceforge.net/projects/forth-brainless/
  DEPENDS:=+gforth
endef

define Package/brainless/Default/description
Brainless is a chess-playing program written in ANS Forth. It uses the
Forth terminal for interacting with the user, making use of ANSI color 
terminals and Utf-8 chess-piece glyphs for quasi-graphical display.
endef

define Package/brainless
$(call Package/brainless/Default)
endef

define Package/brainless/description
$(call Package/brainless/Default/description)
endef


# searches for fusion* headers that are not present.  different version?
CONFIGURE_ARGS += \
	--with-gforth=/usr/bin/gforth-fast

define Build/Configure
	$(call Build/Configure/Default)
endef 

define Build/Compile
endef

define Package/brainless/install
	$(INSTALL_DIR) $(1)/usr
	$(CP) $(PKG_INSTALL_DIR)/usr/* $(1)/usr/
	$(INSTALL_BIN) ./files/brainless-jfbterm $(1)/usr/bin/
endef

$(eval $(call BuildPackage,brainless))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/brainless/compile -j2 V=99"
# End:
