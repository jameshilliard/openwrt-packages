#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk
PKG_NAME:=task
PKG_VERSION:=1.9.4
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.taskwarrior.org/download/
PKG_BUILD_DIR:=$(BUILD_DIR)/task-$(PKG_VERSION)

PKG_RELEASE:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/task
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	TITLE:=Taskwarrior
	SECTION:=utils
	CATEGORY:=Utilities
	URL:=http://taskwarrior.org/projects/show/taskwarrior
endef

define Package/task/description
Taskwarrior is a command-line todo list manager.
endef

define Package/task/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/task $(1)/usr/bin/
endef

$(eval $(call BuildPackage,task))
