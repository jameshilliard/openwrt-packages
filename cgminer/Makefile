#
# Copyright (C) 2012 Xiangfu Liu <xiangfu@openmobilefree.net>
#                            bitcoin: 1BQvUsuQBYUyVuX4jjFk4dVBpWJVQEUHTZ
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cgminer
PKG_VERSION:=20120315
PKG_REV:=22ff7a406951f97af57cbca75d282c4bbf41a3e7
PKG_RELEASE:=3
PKG_INSTALL:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://github.com/kanoi/cgminer.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/cgminer
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=cgminer (FPGA Miner)
	URL:=https://github.com/ckolivas/cgminer
	DEPENDS:=+libcurl +libpthread +libncurses +jansson
endef

define Package/cgminer/description
Cgminer is a multi-threaded multi-pool GPU, FPGA and CPU miner with ATI GPU
monitoring, (over)clocking and fanspeed support for bitcoin and derivative
coins. Do not use on multiple block chains at the same time!
endef
# This package only enable the Icarus support. just connect your Icarus
# FPGA miner board to OpenWrt router(with USB HOST support)
# Run like: 
#    cgminer -S /dev/ttyUSB0 -o http://MINING.POOL.URL -O USER:PASS

CONFIGURE_ARGS += --disable-opencl --disable-adl --enable-icarus
TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/cgminer/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share/cgminer $(1)/etc/init.d

	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/cgminer $(1)/usr/bin
	$(INSTALL_BIN) $(FILES_DIR)/cgminer $(1)/etc/init.d
	$(CP) $(PKG_BUILD_DIR)/miner.php $(1)/usr/share/cgminer
endef

$(eval $(call BuildPackage,cgminer))
