#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@sharism.cc>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nethack
PKG_VERSION:=343

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tgz
PKG_SOURCE_URL:=http://downloads.sourceforge.net/project/nethack/nethack/3.4.3/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-3.4.3

include $(INCLUDE_DIR)/package.mk

define Package/nethack
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    SECTION:=games
    CATEGORY:=Games
    DEPENDS:=nethack
    TITLE:=single player dungeon exploration game
    DEPENDS:=+libncurses
endef

define Package/nethack/description
    NetHack is a single player dungeon exploration game
endef

TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include
TARGET_LDFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/Prepare
	$(call Build/Prepare/Default)
	# (mkdir -p $(PKG_BUILD_DIR)/jemarch-bin; \
	# cd $(PKG_BUILD_DIR)/; \
	# wget http://www.jemarch.net/downloads/nanonote/nethack-3.4.3-nanonote-bin.tar.gz; \
	# tar xf nethack-3.4.3-nanonote-bin.tar.gz -C jemarch-bin/; \
	# )
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR)/sys/unix; \
	sh setup.sh; \
	cd ../../; \
	export CFLAGS="${TARGET_CFLAGS}";\
	export LDFLAGS="${TARGET_LDFLAGS}";\
	export PREFIX="${PKG_INSTALL_DIR}";\
	make;\
	)
endef

define Package/nethack/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/games/lib/nethackdir

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/src/nethack \
		$(1)/usr/bin/

	# $(CP) \
	# 	$(PKG_BUILD_DIR)/jemarch-bin/nethack-3.4.3-nanonote-bin/lib/nethackdir/* \
	# 	$(1)/usr/games/lib/nethackdir
endef

$(eval $(call BuildPackage,nethack))
