include $(TOPDIR)/rules.mk

PKG_NAME:=hp48cc
PKG_VERSION:=1.3
PKG_RELEASE:=1

PKG_SOURCE:=hp48cc-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.sigala.it/sandro/files/
PKG_MD5SUM:=23f41a6168d3c17ea50537fe6ec2124a
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/hp48cc
	SECTION:=devel
	CATEGORY:=Development
	TITLE:=hp48cc
	URL:=http://www.sigala.it/sandro/software.php
endef

define Package/hp48cc/description
	hp48cc is a C-like compiler that translates the input code into the HP48 RPN language.
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Package/hp48cc/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/hp48cc $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/
	$(INSTALL_DIR) $(1)/usr/share/hp48cc/
	$(INSTALL_DIR) $(1)/usr/share/hp48cc/examples/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/examples/* $(1)/usr/share/hp48cc/examples/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/COPYING $(1)/usr/share/hp48cc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/COPYRIGHT $(1)/usr/share/hp48cc/
endef

$(eval $(call BuildPackage,hp48cc))
