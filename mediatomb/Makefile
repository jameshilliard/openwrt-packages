include $(TOPDIR)/rules.mk

PKG_NAME:=mediatomb
PKG_VERSION:=0.11.0-r2
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_SOURCE:=$(PKG_NAME)-static-$(PKG_VERSION)-linux-uclibc-mips32el.tar.gz
PKG_SOURCE_URL:=http://downloads.sourceforge.net/mediatomb/
PKG_RELEASE:=1


include $(INCLUDE_DIR)/package.mk

define Package/mediatomb
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    TITLE:=mediatomb
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=
endef

define Package/mediatomb/description
    open source (GPL) UPnP MediaServer
endef

define Build/Compile
endef

define Package/mediatomb/install
	$(INSTALL_DIR) $(1)/usr/bin
	echo -e "\0043\0041/bin/sh\ncd /usr/share/mediatomb/ && ./mediatomb.sh" > $(1)/usr/bin/mediatomb
	chmod +x $(1)/usr/bin/mediatomb

	$(INSTALL_DIR) $(1)/usr/share/mediatomb
	$(CP)	$(PKG_BUILD_DIR)/mediatomb.sh \
		$(PKG_BUILD_DIR)/readme.txt $(PKG_BUILD_DIR)/usr \
		$(1)/usr/share/mediatomb/

endef

$(eval $(call BuildPackage,mediatomb))
