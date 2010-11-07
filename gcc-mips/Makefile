# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
PKG_NAME:=gcc
#PKG_VERSION:=$(strip $(subst ",, $(CONFIG_GCC_VERSION)))#"))
PKG_VERSION:=4.3.3
PKG_RELEASE:=1
PATCH_DIR=$(TOPDIR)/toolchain/gcc/patches/$(PKG_VERSION)
PKG_SOURCE_URL:=ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-$(PKG_VERSION) \
    http://mirrors.rcn.net/pub/sourceware/gcc/releases/gcc-$(PKG_VERSION) \
	    ftp://ftp.gnu.org/gnu/gcc/releases/gcc-$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=354853e0b2da90c527e35aabb8d6f1e6
PKG_INSTALL:=1
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

SEP:=,
TARGET_LANGUAGES:="c$(if $(CONFIG_INSTALL_LIBSTDCPP),$(SEP)c++)$(if $(CONFIG_INSTALL_LIBGCJ),$(SEP)java)"
EXTRA_TARGET=$(if $(CONFIG_EXTRA_TARGET_ARCH),--enable-biarch --enable-targets=$(call qstrip,$(CONFIG_EXTRA_TARGET_ARCH_NAME))-linux-uclibc)

STRIP:=$(STAGING_DIR_HOST)/bin/sstrip
RSTRIP:= \
	NM="$(TARGET_CROSS)nm" \
	STRIP="$(STRIP)" \
	STRIP_KMOD="$(TARGET_CROSS)strip --strip-debug" \
	$(SCRIPT_DIR)/rstrip.sh

define Package/gcc-mips
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=gcc-mips
  DEPENDS:=+mpfr +binutils
endef

define Package/gcc-mips/description
	build a native toolchain for compiling on target
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	($(CP) ./patches $(PKG_BUILD_DIR); cd $(PKG_BUILD_DIR); patch -Np1 < ./patches/001-cache-amnesia.patch;);
	$(SED) 's,\(version_string.. = "[0-9\.]*\).*\(";\),\1 (OpenWrt-2.0)\2,' $(PKG_BUILD_DIR)/gcc/version.c
	$(SED) 's,\(bug_report_url.. = "\).*\(";\),\1<URL:https://dev.openwrt.org/>\2,' $(PKG_BUILD_DIR)/gcc/version.c
	(cd $(PKG_BUILD_DIR)/libstdc++-v3; autoconf;);
	$(SED) 's,gcc_no_link=yes,gcc_no_link=no,' $(PKG_BUILD_DIR)/libstdc++-v3/configure
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		SHELL="$(BASH)" \
		$(TARGET_CONFIGURE_OPTS) \
		$(PKG_BUILD_DIR)/configure \
			$(TARGET_CONFIGURE_ARGS) \
			--build=$(GNU_HOST_NAME) \
			--host=$(REAL_GNU_TARGET_NAME) \
			--target=$(REAL_GNU_TARGET_NAME) \
			--enable-languages=$(TARGET_LANGUAGES) \
			--enable-shared \
			--disable-__cxa_atexit \
			--enable-target-optspace \
			--with-gnu-ld \
			--disable-nls \
			--disable-libmudflap \
			--disable-multilib \
			--with-gmp=$(STAGING_DIR)/usr \
			--with-mpfr=$(STAGING_DIR)/usr \
			--prefix=/usr \
			$(EXTRA_TARGET) \
			$(SOFT_FLOAT_CONFIG_OPTION) \
			$(call qstrip,$(CONFIG_EXTRA_GCC_CONFIG_OPTIONS)) \
	);
endef

define Build/Compile
	export SHELL="$(BASH)"; $(MAKE_VARS) $(MAKE) -C $(PKG_BUILD_DIR) \
			DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE_ARGS) all install
endef

define Package/gcc-mips/install
	$(INSTALL_DIR) $(1)/usr
	cp -r $(PKG_INSTALL_DIR)/usr/{bin,include,lib,libexec} $(1)/usr
	cp -rf $(TOOLCHAIN_DIR)/usr/include/* $(1)/usr/lib/$(PKG_NAME)/$(REAL_GNU_TARGET_NAME)/$(PKG_VERSION)/include
	cp -rf $(TOOLCHAIN_DIR)/usr/lib/*.{a,la,o} $(1)/usr/lib/$(PKG_NAME)/$(REAL_GNU_TARGET_NAME)/$(PKG_VERSION)
	cp -rf $(TOOLCHAIN_DIR)/lib/* $(1)/usr/lib/$(PKG_NAME)/$(REAL_GNU_TARGET_NAME)/$(PKG_VERSION)
endef

$(eval $(call BuildPackage,gcc-mips))
