# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sparsehash
PKG_VERSION:=1.6
PKG_RELEASE:=1

PKG_SOURCE:=sparsehash-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://google-sparsehash.googlecode.com/files/
PKG_MD5SUM:=054fc9626730cd866ea15fe26b9462c6
PKG_BUILD_DIR:=$(BUILD_DIR)/sparsehash-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/sparsehash
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Sparsehash
  URL:=http://code.google.com/p/google-sparsehash/
  DEPENDS:=
endef

define Package/sparsehash/description
	An extremely memory-efficient hash_map implementation. 2 bits/entry overhead! The SparseHash library contains several hash-map implementations, including implementations that optimize for space or speed.
	These hashtable implementations are similar in API to SGI's hash_map class and the tr1 unordered_map class, but with different performance characteristics. It's easy to replace hash_map or unordered_map by sparse_hash_map or dense_hash_map in C++ code.
endef
# 
# TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/SDL
# 
# CONFIGURE_ARGS += \
# 	--with-sdl-exec-prefix=$(STAGING_DIR)
# 
# CONFIGURE_VARS += \
# 	LIBS="-lSDL -ldirect -ldirectfb -lfusion"

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/google $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/google/* \
		$(1)/usr/include/google/
# 	$(CP) \
# 		$(PKG_INSTALL_DIR)/usr/lib/libSDL_image*.{a,so*} \
# 		$(1)/usr/lib/
endef

define Package/sparsehash/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/google/ $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/doc/sparsehash-$(PKG_VERSION)/ $(1)/usr/doc/
endef

$(eval $(call BuildPackage,sparsehash))
