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
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=+libusb
    TITLE:=avrdude
endef

define Package/avrdude/description
    AVRDUDE is software for programming Atmel AVR Microcontrollers.
endef

define Package/avrdude/install
	$(INSTALL_DIR) \
		$(1)/etc \
		$(1)/usr/bin

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/avrdude \
		$(1)/usr/bin/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/etc/avrdude.conf \
		$(1)/etc
endef

$(eval $(call BuildPackage,avrdude))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/openwrt-xburst.full_system package/avrdude/{clean,compile} -j2 V=99"
# End:
