#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=kexecboot
PKG_VERSION:=git
PKG_REV:=3079df11996826b42691496afb44cc6b4a7fdb24
PKG_RELEASE:=20120804

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.gz
PKG_SOURCE_URL:=https://github.com/kexecboot/kexecboot.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/kexecboot
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=a nice Linux-As-a-Bootloader implementation based on kexec
	DEPENDS:=+kexec-tools
	URL:=http://kexecboot.org
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
