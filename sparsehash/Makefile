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

PKG_INSTALL:=1

define Package/sparsehash
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Sparsehash
  BUILDONLY:=1
  URL:=http://code.google.com/p/google-sparsehash/
endef

define Package/sparsehash/description
	An extremely memory-efficient hash_map implementation. 2 bits/entry overhead! The SparseHash library contains several hash-map implementations, including implementations that optimize for space or speed.
	These hashtable implementations are similar in API to SGI's hash_map class and the tr1 unordered_map class, but with different performance characteristics. It's easy to replace hash_map or unordered_map by sparse_hash_map or dense_hash_map in C++ code.
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include/google

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/google/* \
		$(1)/usr/include/google/
endef

$(eval $(call BuildPackage,sparsehash))
