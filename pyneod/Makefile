#
# Copyright (C) 2010 pyneo.org
#
# This is free software, licensed under the GNU General Public License
# v3. See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=pyneod
PKG_VERSION:=1.26
PKG_RELEASE:=1

PKG_SOURCE:=pyneo-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://git.pyneo.org/browse/cgit/pyneo/snapshot/
PKG_MD5SUM:=48cc3fe7c29ac385107cee08786a4477

PKG_BUILD_DIR=$(BUILD_DIR)/pyneo-$(PKG_VERSION)/$(PKG_NAME)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/pyneod
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:=@BROKEN +python +python-pyneo
  TITLE:=Base lib for pyneo suite
  URL:=http://pyneo.org/
endef

define Package/pyneod/description
 Pyneo is a software stack for mobile devices.
endef

define PyPackage/pyneod/filespec
+|$(PYTHON_PKG_DIR)/pyneod
-|$(PYTHON_PKG_DIR)/pyneod/data/alsastates
endef

define Build/Compile
	$(if $(Build/Compile/PyMod),,@echo Python packaging code not found.; false)
	$(call Build/Compile/PyMod,., \
		install --prefix="$(PKG_INSTALL_DIR)/usr", \
	)
endef

$(eval $(call PyPackage,pyneod))
$(eval $(call BuildPackage,pyneod))
