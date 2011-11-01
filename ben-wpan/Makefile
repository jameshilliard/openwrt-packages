# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=ben-wpan
PKG_VERSION:=git
PKG_REV:=ac76df901d347c1cdb414644ad33120fd262729f
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://projects.qi-hardware.com/ben-wpan.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DEPENDS:=lowpan-tools

include $(INCLUDE_DIR)/package.mk

define Package/ben-wpan/Default
    SECTION:=network
    CATEGORY:=Network
    SUBMENU:=ben-wpan
    URL:=http://en.qi-hardware.com/wiki/Ben_WPAN
endef

define Build/Compile
    $(MAKE) -C $(PKG_BUILD_DIR)/tools TARGET=ben_openwrt; \
    $(MAKE) -C $(PKG_BUILD_DIR)/tools/dirtpan TARGET=ben_openwrt CFLAGS+="-I$(STAGING_DIR)/usr/include -I../include"
endef

define Package/ben-wpan-doc
    $(call Package/ben-wpan/Default)
    TITLE:=Documents about ben-wpan
endef

define Package/ben-wpan-doc/install
	$(INSTALL_DIR) $(1)/usr/share/ben-wpan
	$(CP) $(PKG_BUILD_DIR)/install/INSTALL* $(1)/usr/share/ben-wpan
	$(CP) $(PKG_BUILD_DIR)/install/USAGE     $(1)/usr/share/ben-wpan
endef

define Package/atrf-gpio
    $(call Package/ben-wpan/Default)
    TITLE:=GPIO test utility
endef

define Package/atrf-gpio/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/atrf-gpio/atrf-gpio $(1)/usr/sbin/
endef

define Package/atrf-id
    $(call Package/ben-wpan/Default)
    TITLE:=ATRF identification utility
endef

define Package/atrf-id/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/atrf-id/atrf-id $(1)/usr/sbin/
endef

define Package/atrf-path
    $(call Package/ben-wpan/Default)
    TITLE:=Measure path characteristics
endef

define Package/atrf-path/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/atrf-path/atrf-path $(1)/usr/sbin/
endef

define Package/atrf-proxy
    $(call Package/ben-wpan/Default)
    TITLE:=ATRF network proxy
endef

define Package/atrf-proxy/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/atrf-proxy/atrf-proxy $(1)/usr/sbin/
endef

define Package/atrf-reset
    $(call Package/ben-wpan/Default)
    TITLE:=Reset the transceiver or the whole board
endef

define Package/atrf-reset/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/atrf-reset/atrf-reset $(1)/usr/sbin/
endef

define Package/atrf-rssi
    $(call Package/ben-wpan/Default)
    TITLE:=Spectrum scan utility
endef

define Package/atrf-rssi/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/atrf-rssi/atrf-rssi $(1)/usr/sbin/
endef

define Package/atrf-trim
    $(call Package/ben-wpan/Default)
    TITLE:=Oscillator trim utility
endef

define Package/atrf-trim/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/atrf-trim/atrf-trim $(1)/usr/sbin/
endef

define Package/atrf-txrx
    $(call Package/ben-wpan/Default)
    TITLE:=TX/RX test utility
endef

define Package/atrf-txrx/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/atrf-txrx/atrf-txrx $(1)/usr/sbin/
endef

define Package/atrf-xmit
    $(call Package/ben-wpan/Default)
    TITLE:=Fast transmission test
endef

define Package/atrf-xmit/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/atrf-xmit/atrf-xmit $(1)/usr/sbin/
endef

define Package/atrf-xtal
    $(call Package/ben-wpan/Default)
    TITLE:=Crystal diagnostic utility
endef

define Package/atrf-xtal/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/atrf-xtal/atrf-xtal $(1)/usr/sbin/
endef

define Package/dirtpan
    $(call Package/ben-wpan/Default)
    TITLE:=Quick and dirty IPv4 over 802.15.4 tunnel
endef

define Package/dirtpan/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/dirtpan/dirtpan $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,dirtpan))
$(eval $(call BuildPackage,atrf-gpio))
$(eval $(call BuildPackage,atrf-id))
$(eval $(call BuildPackage,atrf-path))
$(eval $(call BuildPackage,atrf-proxy))
$(eval $(call BuildPackage,atrf-reset))
$(eval $(call BuildPackage,atrf-rssi))
$(eval $(call BuildPackage,atrf-trim))
$(eval $(call BuildPackage,atrf-txrx))
$(eval $(call BuildPackage,atrf-xmit))
$(eval $(call BuildPackage,atrf-xtal))
$(eval $(call BuildPackage,ben-wpan-doc))
