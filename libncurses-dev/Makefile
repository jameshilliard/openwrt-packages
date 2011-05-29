# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libncurses-dev
PKG_VERSION:=5.7
PKG_RELEASE:=1

NCURSES_BUILD_DIR:=$(BUILD_DIR)/libncurses/ncurses-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libncurses-dev
  TITLE:=Files required to develop with ncurses
  SECTION:=development
  CATEGORY:=Development
  URL:=http://www.gnu.org/software/ncurses/ncurses.html
  DEPENDS:=+libncurses
endef

define Package/libncurses-dev/description
  Header files needed to compile ncurses programs along with man pages for the API
endef

# There is nothing to compile:
define Build/Compile
endef

define Package/libncurses-dev/install
	$(INSTALL_DIR) \
		$(1)/usr/include \
		$(1)/usr/share/man/man3

	$(INSTALL_DATA) \
		$(NCURSES_BUILD_DIR)/include/*.h \
		$(1)/usr/include

	$(INSTALL_DATA) \
		$(NCURSES_BUILD_DIR)/man/*.3x \
		$(1)/usr/share/man/man3

	rename "s/\\.3x/.3/" $(1)/usr/share/man/man3/*.3x
endef

$(eval $(call BuildPackage,libncurses-dev))
