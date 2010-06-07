# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk
## Package name
PKG_NAME:=gnugo
## Package version we need (to match our download source)
PKG_VERSION:=3.8
## Release version (don't really needed, just for completeness)
PKG_RELEASE:=3
## Name of the file we will download, with the previous package name definitions
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
## Url with the PKG_SOURCE file
PKG_SOURCE_URL:=http://ftp.gnu.org/gnu/gnugo/
## Program to uncompress the sources
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk
# Definition of the package, for adding to menuconfig and creating the ipkg. 
define Package/gnugo
	TITLE:=Go GNU from FSF
	SECTION:=games
	CATEGORY:=Games
	DEPENDS:=@BROKEN
	URL:=http://www.gnu.org/software/gnugo
endef
# Directory where the sources will be uncompiled and built BUILD_DIR
# is an env variable from the OpenWrt toolchain, you don't need to set
# it.
PKG_BUILD_DIR:=$(BUILD_DIR)/gnugo-$(PKG_VERSION)
# Long description of the package
define Package/gnugo/description
	GNU Go is a free program that plays the game of Go. GNU Go has played thousands of games on the NNGS Go server. GNU Go is now also playing regularly on the Legend Go Server in Taiwan, on the WING server in Japan, and many volunteers run GNU Go clients on KGS. GNU Go has established itself as the leading non-commercial go program in the recent tournaments that it has taken part in. 
endef
# If ./configure does not need any options, leave it as follows
define Package/gnugo/Build/Configure
	$(call Build/Configure/Default)
endef
# Where will be copied the binaries and libraries after installation.
# Gnugo creates the binary executable in the interface directory.
define Package/gnugo/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/interface/gnugo $(1)/usr/sbin/
endef
# Final step for bulding the package
$(eval $(call BuildPackage,gnugo))
