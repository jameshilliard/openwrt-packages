#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ne
PKG_VERSION:=2.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ne.dsi.unimi.it/
PKG_MD5SUM:=9f76652f6349721cfe0e8dc2aec9c767

include $(INCLUDE_DIR)/package.mk

define Package/ne
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=ne, the nice editor
  URL:=http://ne.dsi.unimi.it
  SUBMENU:=Editors
endef

define Package/ne/description
  ne is a free (GPL'd) text editor based on the POSIX standard.
  ne is easy to use for the beginner, but powerful and fully 
  configurable for the wizard, and most sparing in its resource usage.
endef

MAKE_FLAGS += NE_TERMCAP=1 PREFIX=/usr OPTS=-ansi NE_DEBUG=0

define Package/ne/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/share/ne \
		$(1)/usr/share/ne/syntax \
		$(1)/usr/share/ne/doc

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/src/ne \
		$(1)/usr/bin/ne

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/syntax/*.jsf \
		$(1)/usr/share/ne/syntax/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/doc/{default.*,ne.txt} \
		$(1)/usr/share/ne/doc/
endef

$(eval $(call BuildPackage,ne))
