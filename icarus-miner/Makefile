#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

# those files can found under: so far those python build for ar71xx (tl-wr1043nd)
#   pyserial_2.4-1_ar71xx.ipk
#   python_2.6.4-3_ar71xx.ipk
#   python-mini_2.6.4-3_ar71xx.ipk
#   https://github.com/ngzhang/Icarus/tree/master/miner_software

# more info please check:
#   http://en.qi-hardware.com/wiki/Icarus#Using_TP-link.2Ftl-wr1043nd_as_host

include $(TOPDIR)/rules.mk

PKG_NAME:=icarus-miner
PKG_VERSION:=20120209

include $(INCLUDE_DIR)/package.mk

define Package/icarus-miner
    PKGARCH:=all
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    TITLE:=icarus miner software
    SECTION:=utils
    CATEGORY:=Utilities
    URL:=http://en.qi-hardware.com/wiki/Icarus
    DEPENDS:=+librt +libpthread +libffi +zlib +kmod-usb-serial-pl2303
endef

define Build/Compile
endef

define Package/icarus-miner/install
	$(CP) ./data/* $(1)/
endef

define Package/icarus-miner/postinst
#!/bin/sh
crontab /root/crontab.icarus
/etc/init.d/cron enable
/etc/init.d/cron restart
endef

$(eval $(call BuildPackage,icarus-miner))
