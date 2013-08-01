#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=unrealircd
PKG_VERSION:=3.2.10.1
PKG_RELEASE:=1

PKG_SOURCE:=Unreal$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.unrealircd.com/downloads/
PKG_MD5SUM:=97b4bd68a804e517355efa756f401a90

PKG_BUILD_DIR:=$(BUILD_DIR)/Unreal$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/unrealircd
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Instant Messaging
  DEPENDS:=+zlib +libopenssl +libcurl +libcares +tre
  TITLE:=Open Source IRC Server
  URL:=http://unrealircd.com
endef

define Package/unrealircd/conffiles
/etc/unrealircd.conf
endef

CONFIGURE_ARGS+= --with-showlistmodes \
      --enable-prefixaq --with-listen=5 \
      --with-dpath=/etc/unrealircd \
      --with-spath=/usr/bin \
      --with-nick-history=2000 --with-sendq=3000000 \
      --with-bufferpool=18 \
      --with-permissions=0600 --with-fd-setsize=1024 \
      --enable-dynamic-linking \
      --enable-ziplinks=$(STAGING_DIR)/usr \
      --enable-ssl=$(STAGING_DIR)/usr \
      --disable-inet6 \
      --enable-libcurl=$(STAGING_DIR)/usr \
      --with-system-cares \
      --with-system-tre

CONFIGURE_VARS+=ac_cv_nonblocking=O_NONBLOCK ac_cv_force_core=yes ac_cv_sigtype=POSIX

define Package/unrealircd/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/etc/unrealircd $(1)/usr/lib/unrealircd/modules
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/ircd $(1)/usr/bin/unrealircd
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/doc/example.conf $(1)/etc/unrealircd/unrealircd.conf
	$(CP) $(PKG_BUILD_DIR)/*.conf $(1)/etc/unrealircd
	$(CP) $(PKG_BUILD_DIR)/src/modules/*.so $(1)/usr/lib/unrealircd/modules
	ln -s /usr/lib/unrealircd/modules $(1)/etc/unrealircd/modules
	$(INSTALL_DIR) $(1)/etc/init.d
	$(CP) $(FILES_DIR)/unrealircd.init $(1)/etc/init.d/unrealircd
endef

$(eval $(call BuildPackage,unrealircd))
