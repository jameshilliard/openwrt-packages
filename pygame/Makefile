# This is free software, licensed under the GNU General Public License
# v3. See /LICENSE for more information.
include $(TOPDIR)/rules.mk

PKG_NAME:=pygame
PKG_VERSION:=1.9.1release
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.pygame.org/ftp/

PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)

define Package/pygame
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=pygame
  URL:=http://pygame.org
  DEPENDS:=+python-mini +libsdl
endef

define Package/pygame/description
  serial port python bindings
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define Package/pygame/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,pygame))
