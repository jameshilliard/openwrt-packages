# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=avrdude
PKG_VERSION:=5.10

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.savannah.gnu.org/releases/avrdude/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_RELEASE:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/avrdude
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=AVR Downloader/UploaDEr
  URL:=http://www.bsdhome.com/avrdude/
  DEPENDS:=+libncurses +libusb +libreadline @BROKEN
endef

define Package/avrdude/description
    AVRDUDE is software for programming Atmel AVR Microcontrollers.
endef

define Package/avrdude/conffiles
/etc/avrdude.conf
endef

CONFIGURE_ARGS+= \
	--enable-shared \
	--disable-static \
	--disable-parport


ifdef CONFIG_TARGET_xburst_qi_lb60
#apply patches: qi_lb60-patches
#the qi_lb60-patches have some new .c file
define Build/Configure
	(cd $(PKG_BUILD_DIR); aclocal; automake)
	$(call Build/Configure/Default)
endef

#with out </dev/null. make stop at "config.status: creating avrdude.conf.tmp"
MAKE_FLAGS+=</dev/null

define Build/Compile
	$(call Build/Compile/Default)
# the joy of autocrap (we need this to generate avrdude.conf)
	$(call Build/Configure/Default)
endef
endif

define Package/avrdude/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/avrdude.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/avrdude $(1)/usr/bin/
endef
$(eval $(call BuildPackage,avrdude))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/openwrt-xburst.full_system package/avrdude/{clean,compile} -j2 V=99"
# End:
