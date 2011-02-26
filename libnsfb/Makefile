include $(TOPDIR)/rules.mk

PKG_NAME:=libnsfb
PKG_REV:=10618
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=svn://svn.netsurf-browser.org/trunk/libnsfb
PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libnsfb
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=LibNSFB is a framebuffer abstraction library, written in C
	DEPENDS:=+libsdl
	URL:=http://www.netsurf-browser.org/projects/libnsfb/
endef

define Package/libnsfb/description
	The overall idea of the library is to provide a generic abstraction to a linear section of memory which corresponds to a visible array of pixel elements on a display device. Different colour depths are supported and the library provides routines for tasks such as drawing onto the framebuffer and rectangle copy operations.
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	$(MAKE_VARS) $(MAKE) -C $(PKG_BUILD_DIR) \
		$(MAKE_FLAGS) \
		WARNFLAGS="" \
		COMPONENT_TYPE=lib-shared \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	mkdir -p $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/local/include/* $(1)/usr/include/
	mkdir -p $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/* $(1)/usr/lib/
	$(SED) \
		's,^\(prefix\|exec_prefix\)=.*,\1=$(STAGING_DIR)/usr,g' \
		$(1)/usr/lib/pkgconfig/libnsfb.pc
	$(SED) \
		's/xcb\|xcb-icccm\|xcb-image\|xcb-keysyms//g' \
		$(1)/usr/lib/pkgconfig/libnsfb.pc
endef

define Package/libnsfb/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/libnsfb.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libnsfb))
