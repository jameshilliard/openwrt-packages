#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=smalltalk
PKG_VERSION:=3.2.3
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gnu.org/gnu/smalltalk/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_RELEASE:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/smalltalk
    TITLE:=smalltalk
    SECTION:=lang
    CATEGORY:=Languages
    DEPENDS:=@BROKEN
    URL:=http://smalltalk.gnu.org/
endef

define Package/smalltalk/description
    GNU Smalltalk is a free implementation of the Smalltalk-80 language
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/smalltalk/install
	$(INSTALL_DIR) $(1)/usr/bin
endef

$(eval $(call BuildPackage,smalltalk))
# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/openwrt-xburst.full_system package/smalltalk/{clean,compile} -j2 V=99"
# End:
