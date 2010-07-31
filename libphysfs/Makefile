                                                                     
                                                                     
                                                                     
                                             
include $(TOPDIR)/rules.mk

PKG_NAME:=libphysfs
PKG_VERSION:=2.0.0
PKG_RELEASE:=1

#PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE:=physfs-2.0.0.tar.gz
PKG_SOURCE_URL:=http://icculus.org/physfs/downloads/
PKG_MD5SUM:=cfc53e0c193914c9c5ab522e58737373
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/physfs-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libphysfs
	SECTION:=games
	CATEGORY:=Games
	TITLE:=PhysicsFS
	URL:=http://icculus.org/physfs/
endef

define Package/libphysfs/description
	PhysicsFS is a library to provide abstract access to various archives.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR);\
	 IN_OPENWRT=1 \
	 AR="$(TARGET_CROSS)ar" \
	 AS="$(TARGET_CC) -c $(TARGET_CFLAGS)" \
	 LD="$(TARGET_CROSS)ld" \
	 NM="$(TARGET_CROSS)nm" \
	 CC="$(TARGET_CC)" \
	 GCC="$(TARGET_CC)" \
	 CXX="$(TARGET_CROSS)g++" \
	 RANLIB="$(TARGET_CROSS)ranlib" \
	 STRIP="$(TARGET_CROSS)strip" \
	 OBJCOPY="$(TARGET_CROSS)objcopy" \
	 OBJDUMP="$(TARGET_CROSS)objdump" \
	 TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
	 TARGET_CFLAGS="$(TARGET_CFLAGS)" \
	 TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
	cmake .);$
	$(call Build/Compile/Default)$
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/local/include/physfs.h $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/libphysfs.so* $(1)/usr/lib/
endef

define Package/libphysfs/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libphysfs.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libphysfs))
