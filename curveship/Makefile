#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=curveship
PKG_VERSION:=1.0
PKG_REV:=45906ca9a3aadff2873a11cd435a08c7e8e4a8d4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/nickmontfort/curveship
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/curveship
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    SECTION:=utils
    CATEGORY:=Utilities
    TITLE:=Interactive fiction + interactive narrating
    DEPENDS:=+python
    URL:=http://curveship.com/
endef

define Package/curveship/description
Interactive fiction + interactive narrating
endef

define Build/Compile
endef

define Package/curveship/install
	$(INSTALL_DIR) $(1)/usr/share/curveship
	(cd $(PKG_BUILD_DIR); \
	$(CP)	fiction LICENSE logs NEXT_STEPS README save spin walk \
		*.py \
		$(1)/usr/share/curveship)
endef

$(eval $(call BuildPackage,curveship))

# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/openwrt-xburst.full_system package/curveship/{clean,compile} -j2 V=99"
# End:
