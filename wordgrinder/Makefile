include $(TOPDIR)/rules.mk

PKG_NAME:=wordgrinder
PKG_VERSION:=0.3.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=1ae3bcf2fc4ee027bdd9518a73733505

include $(INCLUDE_DIR)/package.mk

define Package/wordgrinder
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=A word processor for processing words
	URL:=http://wordgrinder.sourceforge.net/
	SUBMENU:=Editors
	DEPENDS:=+libncursesw +lua +luafilesystem
endef

define Package/wordgrinder/description
	WordGrinder is a word processor for processing words. It is not WYSIWYG. It is not point and click. It is not a desktop publisher. It is not a text editor. It is not do fonts and it barely does styles. What it does do is words. It's designed for writing text. It gets out of your way and lets you type.
endef

define Build/Configure
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR);\
	STAGING_DIR="$(STAGING_DIR)"\
	TARGET_CC="$(TARGET_CC)"\
	./pm);$
endef

define Package/wordgrinder/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/wordgrinder $(1)/usr/bin/
endef

$(eval $(call BuildPackage,wordgrinder))
$(eval $(call RequireCommand,lua,Please install lua.))
