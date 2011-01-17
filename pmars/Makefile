# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk
PKG_NAME:=pmars
PKG_VERSION:=0.9.2
PKG_RELEASE:=3
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.sourceforge.net/project/corewar/pMARS/0.9.2/pmars-0.9.2.tar.gz?use_mirror=mesh
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk
define Package/pmars
	TITLE:=Pmars
	SECTION:=games
	CATEGORY:=Games
	DEPENDS:=+libncurses
	URL:=http://corewar.co.uk/pmars/
endef
PKG_BUILD_DIR:=$(BUILD_DIR)/pmars-$(PKG_VERSION)
define Package/pmars/description
	PMARS
endef

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

MAKE_FLAGS += -C src

define Package/pmars/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/pmars $(1)/usr/bin/
endef

$(eval $(call BuildPackage,pmars))
