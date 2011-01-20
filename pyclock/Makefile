include $(TOPDIR)/rules.mk

PKG_NAME:=pyclock
PKG_VERSION:=0.0
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME).tar.bz2
PKG_SOURCE_URL:=http://slashhome.se/files/
UNPACK_CMD=tar jxvf $(DL_DIR)/$(PKG_SOURCE)  -C $(1)

include $(INCLUDE_DIR)/package.mk

define Package/pyclock
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    TITLE:=pyclock
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=+python +pygame
endef

define Package/pyclock/description
    python digital clock
endef

define Build/Compile
endef

define Package/pyclock/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/share/pyclock

	echo -e "\0043\0041/bin/sh\ncd /usr/share/pyclock/ && ./pyclock.py" > $(1)/usr/bin/pyclock
	chmod +x $(1)/usr/bin/pyclock

	$(CP) 	$(PKG_BUILD_DIR)/COPY \
		$(PKG_BUILD_DIR)/data \
		$(PKG_BUILD_DIR)/pyclock.py \
		$(1)/usr/share/pyclock
endef

$(eval $(call BuildPackage,pyclock))
