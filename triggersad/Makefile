#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=triggersad
PKG_VERSION:=0.1.3
PKG_RELEASE:=1

PKG_SOURCE:=wertarbyte-triggerhappy-release-0.1.3-0-gf7c4216.tar.gz
PKG_SOURCE_URL:=http://download.github.com/
PKG_MD5SUM:=7da137a7d2ba1ce396231e821e68de4e

PKG_BUILD_DIR:=$(BUILD_DIR)/wertarbyte-triggerhappy-f7c4216/

include $(INCLUDE_DIR)/package.mk

define Package/triggersad
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=handle input events and run configured programs
  URL:=http://github.com/wertarbyte/triggerhappy
endef

define Package/triggersad/description
	triggerhappy - handle input events and run configured programs
	The daemon thd can handle hotplugged input devices and is configured through
	simple configuration files in /etc/triggerhappy/triggers.d/.
endef

MAKE_FLAGS += \
	$(TARGET_CONFIGURE_OPTS) \
	$(1)

MAKE_VARS += TOOLCHAIN_DIR=$(TOOLCHAIN_DIR)

define Package/triggersad/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/triggerhappy
	$(INSTALL_DIR) $(1)/etc/triggerhappy/triggers.d/
	$(INSTALL_DIR) $(1)/etc/hotplug.d/input/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/thd $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/th-cmd $(1)/usr/sbin
	$(INSTALL_BIN) ./files/triggerhappy.init $(1)/etc/init.d/triggerhappy
	$(INSTALL_BIN) ./files/triggerhappy.hotplug $(1)/etc/hotplug.d/input/10-triggerhappy
	$(INSTALL_BIN) ./files/triggerhappy-example.conf $(1)/etc/triggerhappy/triggers.d/example.conf
endef

$(eval $(call BuildPackage,triggersad))
