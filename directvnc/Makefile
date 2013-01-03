# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=directvnc
PKG_VERSION:=0.7.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/downloads/drinkmilk/directvnc
PKG_MD5SUM:=e30f1a0e45b440443c044148fb62ad6e
PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_BUILD_DEPENDS:=libX11

include $(INCLUDE_DIR)/package.mk

define Package/directvnc
    TITLE:=client implementing the remote framebuffer protocol (rfb) which is used by VNC servers
    SECTION:=utilities
    CATEGORY:=Utilities
    URL:=http://freecode.com/projects/directvnc
    DEPENDS:=+directfb +libjpeg
endef

define Package/directvnc/description
    DirectVNC is a client implementing the remote framebuffer protocol (rfb) which is used by VNC servers. What makes DirectVNC different from other Unix VNC clients is that it uses the Linux framebuffer device through the hardware accelerated DirectFB library, which enables it to run on anything that has a framebuffer without the need for an X server.
endef

define Package/directvnc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/{directvnc,directvnc-xmapconv} $(1)/usr/bin
endef

$(eval $(call BuildPackage,directvnc))
