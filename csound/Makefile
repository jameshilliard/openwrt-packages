#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=csound
PKG_VERSION:=5.14.2
PKG_SOURCE:=Csound$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/csound
PKG_BUILD_DIR:=$(BUILD_DIR)/Csound$(PKG_VERSION)
PKG_RELEASE:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/csound
	TITLE:=Csound
	SECTION:=utils
	CATEGORY:=Utilities
	URL:=http://csounds.com/
	DEPENDS:=+libsndfile @BROKEN
endef
define Package/csound/description
Csound is a sound design, audio synthesis, and signal processing system, providing facilities for music composition and performance on all major operating systems and platforms. Its use is not restricted to any style of music, having been employed for many years in the creation of classical, pop, techno, ambient, experimental, and (of course) computer music, as well as music for film and television.
endef

define Build/Prepare
	$(Build/Prepare/Default)
	$(CP) $(FILES_DIR)/* $(PKG_BUILD_DIR)
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR) && $(MAKE_VARS) scons $(MAKE_FLAGS))
endef

define Build/Install
endef

define Package/csound/install
	$(INSTALL_DIR) $(1)/usr/bin
endef

$(eval $(call BuildPackage,csound))
