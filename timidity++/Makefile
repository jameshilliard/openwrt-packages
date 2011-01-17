include $(TOPDIR)/rules.mk

PKG_NAME:=TiMidity++
PKG_VERSION:=2.13.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://downloads.sourceforge.net/project/TiMidity/TiMidity++/TiMidity++-2.13.2/TiMidity++/TiMidity++-2.13.2.tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/TiMidity++
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=TiMidity++
	URL:=http://TiMidity.sourceforge.net/
	DEPENDS:=@BROKEN
endef

define Package/TiMidity++/description
	TiMidity++ is a software synthesizer. It can play MIDI files by converting them into PCM waveform data
endef

TARGET_LDFLAGS += -Wl,-rpath-link -Wl,$(STAGING_DIR)/usr/lib

define Build/Prepare
	$(call Build/Prepare/Default)
	cp ./files/nanonote_newton_table.c $(PKG_BUILD_DIR)/timidity/newton_table.c
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
	export AUTOMAKE="automake --foreign --add-missing --copy"; \
	autoreconf)
	$(call Build/Configure/Default, --enable-audio=alsa)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef
define Package/TiMidity++/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/timidity/timidity \
		$(1)/usr/bin
endef

$(eval $(call BuildPackage,TiMidity++))
