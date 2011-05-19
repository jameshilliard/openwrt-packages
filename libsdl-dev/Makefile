# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
#
# TODO: Should libsdl-image-dev be seperate from libsdl-dev?  If not then this
#       should probably include libsdl-mixer, etc. files
# TODO: Find man pages for SDL_Image and include them
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsdl-dev
PKG_VERSION:=1.2.14
PKG_RELEASE:=1

SDL_BUILD_DIR:=$(BUILD_DIR)/SDL-$(PKG_VERSION)
SDL_IMAGE_BUILD_DIR:=$(BUILD_DIR)/SDL_image-1.2.10

include $(INCLUDE_DIR)/package.mk

define Package/libsdl-dev
  TITLE:=SDL API development files and man pages
  SECTION:=development
  CATEGORY:=Development
  URL:=http://www.libsdl.org/
  DEPENDS:=+libsdl +libsdl-image +mandoc
endef

define Package/libsdl-dev/description
  Header files needed to compile SDL programs along with man pages for the API
endef

# There is nothing to compile:
define Build/Compile
endef

define Package/libsdl-dev/install
	$(INSTALL_DIR) \
		$(1)/usr/include/SDL \
		$(1)/usr/lib \
		$(1)/usr/share/man/man3

	$(INSTALL_DATA) \
		$(SDL_BUILD_DIR)/include/* \
		$(SDL_IMAGE_BUILD_DIR)/SDL_image.h \
		$(1)/usr/include/SDL

	$(INSTALL_DATA) \
		$(SDL_BUILD_DIR)/docs/man3/* \
		$(1)/usr/share/man/man3

	ln -s libSDL-1.2.so.0  $(1)/usr/lib/libSDL.so
endef

$(eval $(call BuildPackage,libsdl-dev))
