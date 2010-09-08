include $(TOPDIR)/rules.mk

PKG_NAME:=gpgme
PKG_VERSION:=1.3.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.gnupg.org/gcrypt/gpgme/
PKG_MD5SUM:=f148c73f6f540f91e02141df72844f62
PKG_FIXUP:=libtool
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/gpgme
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=GnuPG Made Easy
	URL:=http://www.gnupg.org
	DEPENDS:=+libgpg-error +libassuan
endef

define Package/gpgme/description
	GPGME (GnuPG Made Easy) is a C language library that allows to add
	support for cryptography to a program. It is designed to make
	access to public key crypto engines like GnuPG or GpgSM easier 
	for applications. GPGME provides a high-level crypto API for
	encryption, decryption, signing, signature verification and key management.
endef

define Build/Configure
        $(call Build/Configure/Default, \
		--with-pth=no --with-gpg="/usr/bin/gpg" --with-gpgsm="" \
		--with-gpgconf="" --with-g13="" \
		--enable-shared --enable-static \
        )
endef

define Build/InstallDev
	$(INSTALL_DIR) $(2)/bin $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/gpgme-config \
		$(2)/bin/
	$(SED) \
		's,^\(prefix\|exec_prefix\)=.*,\1=$(STAGING_DIR)/usr,g' \
		$(2)/bin/gpgme-config
	ln -sf $(STAGING_DIR)/host/bin/gpgme-config $(1)/usr/bin/gpgme-config

	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/gpgme.h \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgpgme.{la,a,so*} \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/share/aclocal
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/aclocal/gpgme.m4 \
		$(1)/usr/share/aclocal/
endef

define Package/gpgme/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgpgme.so.* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,gpgme))
