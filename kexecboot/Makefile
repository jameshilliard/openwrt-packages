#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=kexecboot
PKG_VERSION:=git
PKG_REV:=ed2ccf8a61d3fa5c9e2dbb6142f1c995b824f9bb
PKG_RELEASE:=20110228

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.gz
PKG_SOURCE_URL:=git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/kexecboot
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=a nice Linux-As-a-Bootloader implementation based on kexec
	DEPENDS:=+kexec-tools
	URL:=http://projects.linuxtogo.org/projects/kexecboot/
endef

define Build/Configure
	cd $(PKG_BUILD_DIR) && ./autogen.sh && \
	$(call Build/Configure/Default, \
	--enable-uimage \
	--enable-bpp=32bpp \
	)

endef

define Package/kexecboot/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/kexecboot $(1)/usr/bin
endef

$(eval $(call BuildPackage,kexecboot))
