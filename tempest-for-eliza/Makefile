include $(TOPDIR)/rules.mk

PKG_NAME:=tempest-for-eliza
PKG_VERSION:=1.0.5
PKG_RELEASE:=2

PKG_SOURCE:=tempest_for_eliza-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.erikyyy.de/tempest/

PKG_BUILD_DIR:=$(BUILD_DIR)/tempest_for_eliza-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/tempest-for-eliza
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Tempest_For_Eliza
	DEPENDS:=+libsdl +directfb 
	URL:=http://www.erikyyy.de/tempest/
endef

define Package/tempest-for-eliza/description
	Tempest for Eliza is a Program that uses your computer monitor to send out AM radio signals.
endef

TARGET_CFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/tempest-for-eliza/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/tempest-for-eliza/songs

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tempest_for_eliza $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/README $(1)/usr/share/tempest-for-eliza/README
	$(CP) $(PKG_BUILD_DIR)/songs/* $(1)/usr/share/tempest-for-eliza/songs
	rm -f $(1)/usr/share/tempest-for-eliza/songs/Makefile*
endef

$(eval $(call BuildPackage,tempest-for-eliza))
