#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fbsize
PKG_VERSION:=0.0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/fbsize
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=fbsize shows current terminal size
  SUBMENU:=Terminal
endef

define Package/fbsize/description
  fbsize, a small utility to show current terminal size (might be handy)
endef

define Build/Compile
	$(TARGET_CC) -o $(PKG_BUILD_DIR)/fbsize ./files/fbsize.c
endef

define Package/fbsize/install
	$(INSTALL_DIR) \
		$(1)/usr/bin

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/fbsize \
		$(1)/usr/bin/fbsize

endef

$(eval $(call BuildPackage,fbsize))
