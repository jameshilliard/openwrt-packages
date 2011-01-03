# 
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for the Plplot

include $(TOPDIR)/rules.mk

PKG_NAME:=plplot
PKG_VERSION:=5.9.7
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)/$(PKG_VERSION)%20Source
PKG_MD5SUM:=c53c484ed93ce8446513c31707551b5b
PKG_INSTALL:=1
PKG_FIXUP:=libtool

PKG_BUILD_DEPENDS:= plplot/host libtool/host qt4 qt4-gui
#@INSTALL_GFORTRAN 

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

## Need host-compiled plplot build dir for cmake to work for the target
define Host/Configure
	mkdir $(HOST_BUILD_DIR)/build_dir
	cd $(HOST_BUILD_DIR)/build_dir && \
	  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	     	-DDEFAULT_NO_DEVICES=ON \
		-DPKG_CONFIG_EXECUTABLE=Not-Found -DDEFAULT_NO_BINDINGS=ON \
	        $(HOST_BUILD_DIR)
endef

define Host/Compile
	make -C $(HOST_BUILD_DIR)/build_dir
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/lib/cmake
	$(CP) $(HOST_BUILD_DIR)/build_dir $(STAGING_DIR_HOST)/lib/cmake/
endef

define Package/plplot/Default
  SECTION:=utils
  CATEGORY:=Utilities

  TITLE:=PLplot plotting library
  URL:=http://plplot.sourceforge.net/
#  SUBMENU:=Plplot
endef

define Package/plplot/Default/description
PLplot is a cross-platform software package for creating scientific plots.  It
comes with language bindings for many interpreter languages like Lua, Tcl,
Python.  Also it can be used as plooting backend for GNU Octave.
endef

define Package/plplot
$(call Package/plplot/Default)
  DEPENDS:=+qt4 +qt4-gui
  TITLE+=
endef

define Package/plplot/description
$(call Package/plplot/Default/description)
 This package contains the Plplot executable files
endef

# define Package/plplot-data
# $(call Package/plplot/Default)
#   TITLE=+ (function files)
# endef

# define Package/plplot-data/description
# $(call Package/plplot/Default/description)
#  This package contains the platform-independant .m-files.
# endef

CONFIGURE_ARGS += 
#MAKE_FLAGS += "LD=$(TARGET_CROSS)gcc -nostdlib" 

define Build/Configure
	echo "SET(CMAKE_SYSTEM_NAME Linux)" > $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_SYSTEM_VERSION 1)" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_BUILD_TYPE None)" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_C_COMPILER   $(TARGET_CC:ccache=))" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_CXX_COMPILER $(TARGET_CC:ccache=))" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_C_FLAGS   \"$(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS) $(TARGET_CFLAGS) $(EXTRA_CFLAGS)\" CACHE STRING \"\" FORCE)" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_CXX_FLAGS \"$(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS) $(TARGET_CFLAGS) $(EXTRA_CFLAGS)\" CACHE STRING \"\" FORCE)" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_VERBOSE_MAKEFILE ON)" >> $(PKG_BUILD_DIR)/toolchain.cmake

        # where is the target environment 
	echo "SET(CMAKE_FIND_ROOT_PATH  $(STAGING_DIR))" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_LIBRARY_PATH  $(STAGING_DIR)/usr/lib $(STAGING_DIR)/lib $(STAGING_DIR_ROOT)/lib)" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_INCLUDE_PATH  $(STAGING_DIR)/usr/include)" >> $(PKG_BUILD_DIR)/toolchain.cmake

        # search for programs in the build host directories
	echo "SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)" >> $(PKG_BUILD_DIR)/toolchain.cmake

        # for libraries and headers in the target directories
	echo "SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(PL_USE_NAMESPACE 1)" >> $(PKG_BUILD_DIR)/toolchain.cmake

	cd $(PKG_BUILD_DIR) && \
	  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	     	-DCMAKE_TOOLCHAIN_FILE=$(PKG_BUILD_DIR)/toolchain.cmake \
		-DPKG_CONFIG_EXECUTABLE=$(STAGING_DIR_HOST)/bin/pkg-config \
	     	-DDEFAULT_NO_DEVICES=ON -DPLD_ps=ON -DPLD_svg=ON \
		-DPLD_extqt=ON \
		-DDEFAULT_NO_BINDINGS=ON \
		-DENABLE_cxx=ON -DNaNAwareCCompiler=ON \
		-DQT_QMAKE_EXECUTABLE=$(STAGING_DIR_HOST)/bin/qmake \
		-DQT_MOC_EXECUTABLE=$(STAGING_DIR_HOST)/bin/moc \
		-DQT_UIC_EXECUTABLE=$(STAGING_DIR_HOST)/bin/uic \
		-DQT_RCC_EXECUTABLE=$(STAGING_DIR_HOST)/bin/rcc \
		-DENABLE_qt=ON \
		-DCMAKE_USE_NAMESPACE=ON \
		-DCMAKE_NATIVE_BINARY_DIR=$(STAGING_DIR_HOST)/lib/cmake/build_dir
#		-DQt4_INCLUDE_DIR=$(STAGING_DIR_ROOT)/usr/include \
#		-DQt4_LIRARY=$(STAGING_DIR_ROOT)/usr/lib/libQtGui.so \

endef

define Build/Compile
	$(call Build/Compile/Default, VERBOSE=1 -j2)
endef

define Build/Install
	$(call Build/Install/Default)
#	$(INSTALL_DATA) ./files/... $(PKG_INSTALL_DIR)/usr/share/plplot/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/plplot
	$(CP) $(PKG_INSTALL_DIR)/usr/include/plplot/*.h \
		$(1)/usr/include/plplot/

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* \
		$(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/plplotd.pc \
		$(1)/usr/lib/pkgconfig/plplotd.pc
	$(SED) 's,-I$$$${includedir},,g' $(1)/usr/lib/pkgconfig/plplotd.pc
	$(SED) 's,-L$$$${libdir},,g' $(1)/usr/lib/pkgconfig/plplotd.pc
endef

define Package/plplot/install
	$(INSTALL_DIR) $(1)/usr
	$(INSTALL_DIR) $(1)/usr/share/plplot$(PKG_VERSION)
	$(CP) $(PKG_INSTALL_DIR)/usr/{bin,lib} \
		$(1)/usr
	$(CP) $(PKG_INSTALL_DIR)/usr/share/plplot$(PKG_VERSION)/*.{map,pal,fnt} \
		$(1)/usr/share/plplot$(PKG_VERSION)/
endef

# define Package/plplot-data/install
# 	$(INSTALL_DIR) $(1)/
# 	(cd $(PKG_INSTALL_DIR)/ && tar -cf - usr/share) \
# 	    | (cd $(1)/ && tar -xvf -)
# endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,plplot))
#$(eval $(call BuildPackage,plplot-data))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/plplot/compile -j2 V=99"
# End:
