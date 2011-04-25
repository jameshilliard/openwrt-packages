#
# Copyright (C) 2011 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@sharism.cc>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fmit
PKG_VERSION:=0.99.2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-Source.tar.bz2
PKG_SOURCE_URL:=http://download.gna.org/fmit/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-Source
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/fmit/Default
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=fmit
    TITLE:=Free Music Instrument Tuner
endef

define Package/fmit/description
    Free Music Instrument Tuner
endef

define Package/fmit
    $(call Package/fmit/Default)
    DEPENDS:=@BROKEN
#depends on GLUT, and GLUT depends on X
endef

CMAKE_OPTIONS+= -DCMAKE_C_COMPILER=$(TOOLCHAIN_DIR)/usr/bin/$(TARGET_CC) \
	-DCMAKE_CXX_COMPILER=$(TOOLCHAIN_DIR)/usr/bin/$(TARGET_CXX) \
	-DQT_QMAKE_EXECUTABLE=$(STAGING_DIR_HOST)/bin/qmake \
	-DQT_MOC_EXECUTABLE=$(STAGING_DIR_HOST)/bin/moc \
	-DQT_UIC_EXECUTABLE=$(STAGING_DIR_HOST)/bin/uic \
	-DQT_RCC_EXECUTABLE=$(STAGING_DIR_HOST)/bin/rcc

define Package/fmit/install
endef

$(eval $(call BuildPackage,fmit))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/openwrt-xburst.full_system package/fmit/{clean,compile} -j2 V=99"
# End: