# 
# Author : Ernest Kugel <erik.kugel@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pem
PKG_VERSION:=0.7.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.gnu.org/gnu/pem/
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/pem
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Pem
	URL:=http://www.gnu.org/software/pem
	DEPENDS:=+perl +perlbase-essential +perlbase-posix +perlbase-xsloader +perlbase-autoloader +perlbase-encoding +perlbase-fcntl +perlbase-tie
endef

define Package/pem/description
	GNU  Pem is a handy tool to help you keep track of your
personal income and expenses. On GNU/Linux  and  other  Unix
like systems, Pem works by storing the details in a CSV file
placed in the ~/.pem directory under your  $HOME  directory.
On  Windows, the same file is placed in pem directory, under
the %USERPROFILE% directory. Each such file is  named  after
the  current month, and is automatically created by Pem when
you enter the first record for a month. It is not  advisable
to edit these files by hand.	
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Package/pem/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pem $(1)/usr/bin/
endef

$(eval $(call BuildPackage,pem))
