# 
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for the Plplot

include $(TOPDIR)/rules.mk

PKG_NAME:=plplot
PKG_VERSION:=5.9.7
PKG_RELEASE:=4
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)/$(PKG_VERSION)%20Source
PKG_MD5SUM:=c53c484ed93ce8446513c31707551b5b
PKG_INSTALL:=1

PKG_BUILD_PARALLEL:=1
HOST_BUILD_PARALLEL:=1

PKG_FIXUP:=libtool
PKG_REMOVE_FILES:=

PKG_BUILD_DEPENDS:= plplot/host libltdl swig/host
#@INSTALL_GFORTRAN 

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk


# # workaround for cmake.mk bug
# ifneq ($(CONFIG_CCACHE),)
#   CMAKE_C_COMPILER:=ccache
#   CMAKE_CXX_COMPILER:=ccache
# endif

# plplot does not support CMAKE_C_COMPILER_ARG1 etc. for some test-cases so
# we have to disable ccache usage for plplot :'(
ifneq ($(CONFIG_CCACHE),)
CMAKE_C_COMPILER:=$(TOOLCHAIN_DIR)/bin/$(filter-out ccache,$(TARGET_CC))
CMAKE_CXX_COMPILER:=$(TOOLCHAIN_DIR)/bin/$(filter-out ccache,$(TARGET_CC))
CMAKE_C_COMPILER_ARG1 :=
CMAKE_CXX_COMPILER_ARG1 :=
endif

CMAKE_HOST_FLAGS=\
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
	-DCMAKE_MODULE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
	-DCMAKE_SHARED_LINKER_FLAGS="$(HOST_LDFLAGS)" \
	-DDEFAULT_NO_DEVICES=ON \
	-DPKG_CONFIG_EXECUTABLE=Not-Found \
	-DDEFAULT_NO_BINDINGS=ON \

## Need host-compiled plplot build dir for cmake to work for the target
## todo: should this be moved into cmake.mk?  or a 'host-cmake.mk' ?
define Host/Configure
	mkdir -p $(HOST_BUILD_DIR)/build_dir
	cd $(HOST_BUILD_DIR)/build_dir && \
	  CFLAGS="$(HOST_CFLAGS)" \
	  CXXFLAGS="$(HOST_CFLAGS)" \
	  cmake $(CMAKE_HOST_FLAGS) \
	        $(HOST_BUILD_DIR)
endef

# plplot tries to find 'libm' via directory search, but that won't work since
# in newer linuxes (ubuntu 11.04) libm is in /lib/<cpu-arch>/lib
HOST_LDFLAGS += -lm
CMAKE_HOST_FLAGS += -DMATH_LIB:FILEPATH=m 

define Host/Compile/Octave
	$(MAKE) -C $(HOST_BUILD_DIR)/bindings/octave massage
endef

define Host/Compile
	$(if $(CONFIG_PACKAGE_plplot-octave),$(Host/Compile/Octave),)
	$(MAKE) -C $(HOST_BUILD_DIR)/build_dir VERBOSE=1
endef

define Host/Install/Octave
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/bin
	$(CP) $(HOST_BUILD_DIR)/bindings/octave/massage \
		$(STAGING_DIR_HOST)/bin/plplot-massage
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/lib/$(PKG_NAME)-$(PKG_VERSION)
	$(CP) $(HOST_BUILD_DIR)/build_dir \
		$(STAGING_DIR_HOST)/lib/$(PKG_NAME)-$(PKG_VERSION)
	$(if $(CONFIG_PACKAGE_plplot-octave),$(Host/Install/Octave),)
endef

define Package/plplot/Default
  SECTION:=libs
  CATEGORY:=Libraries

  TITLE:=PLplot plotting library
  URL:=http://plplot.sourceforge.net/
  SUBMENU:=PLplot
endef

define Package/plplot/Default/description
PLplot is a cross-platform software package for creating scientific plots.  It
comes with language bindings for many interpreter languages like Lua, Tcl,
Python.  Also it can be used as plooting backend for GNU Octave.
endef

define Package/plplot
$(call Package/plplot/Default)
  DEPENDS:=+libltdl +zlib +libfreetype 
  TITLE+=
endef

define Package/plplot/description
$(call Package/plplot/Default/description)
 This package contains the Plplot library with a few file output devices.
endef

define Package/plplot-demo
$(call Package/plplot/Default)
  DEPENDS:= +plplot 
  TITLE+= (Example Programs)
endef

define Package/plplot-demo/description
$(call Package/plplot/Default/description)
 This package contains the Plplot example programs.
endef

define Package/plplot-cxx
$(call Package/plplot/Default)
  DEPENDS:= +plplot +libstdcpp
  TITLE+= (C++ bindings)
endef

define Package/plplot-cxx/description
$(call Package/plplot/Default/description)
 This package contains the Plplot C++ bindings.
endef

define Package/plplot-qt
$(call Package/plplot/Default)
  DEPENDS:= +plplot +qt4 +qt4-gui
  TITLE+= (Qt bindings&device)
endef

define Package/plplot-qt/description
$(call Package/plplot/Default/description)
 This package contains the Plplot Qt visualization driver and Qt bindings.
endef

define Package/plplot-linuxvga
$(call Package/plplot/Default)
  DEPENDS:= +plplot +svgalib
  TITLE+= (svgalib driver)
endef

define Package/plplot-linuxvga/description
$(call Package/plplot/Default/description)
 This package contains the SVGAlib based visualization driver for PLplot.
endef

define Package/plplot-tcl
$(call Package/plplot/Default)
  DEPENDS:= +plplot +tcl
  TITLE+= (Tcl bindings)
$(eval $(call RequireCommand,tclsh,Please install tcl.))
endef

define Package/plplot-tcl/description
$(call Package/plplot/Default/description)
 This package contains the Plplot bindings for Tcl
endef

define Package/plplot-lua
$(call Package/plplot/Default)
  DEPENDS:= +plplot +liblua
  TITLE+= (Lua bindings)
endef

define Package/plplot-lua/description
$(call Package/plplot/Default/description)
 This package contains the Plplot bindings for Lua
endef

# note: plplot-python needs some numeric support library for python ('numpy'?)
# not currently present on openwrt.
define Package/plplot-python
$(call Package/plplot/Default)
  DEPENDS:= +plplot +python @BROKEN
  TITLE+= (Python bindings)
endef

define Package/plplot-python/description
$(call Package/plplot/Default/description)
 This package contains the Plplot bindings for Python.  
 Note that this needs either the Pythnon-Numpy or Python-Numeric library 
 to work.  Both haven\'t been ported yet, so plplot-python is 
 disfunctional!
endef

define Package/plplot-octave
$(call Package/plplot/Default)
  DEPENDS:= +plplot +octave
  TITLE+= (Octave bindings)
endef

define Package/plplot-octave/description
$(call Package/plplot/Default/description)
 This package contains the Plplot bindings for GNU Octave
endef

TARGET_CFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CMAKE_OPTIONS += \
	-Wdev \
	-DPL_USE_NAMESPACE=1 \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DPKG_CONFIG_EXECUTABLE=$(STAGING_DIR_HOST)/bin/pkg-config \
	-DSWIG_EXECUTABLE=$(STAGING_DIR_HOST)/bin/swig \
	-DDEFAULT_NO_DEVICES=ON \
	-DUSE_RPATH=OFF \
	-DPLD_ps=ON \
	-DPLD_svg=ON \
	-DPLD_mem=ON \
	-DPLD_null=ON \
	-DDEFAULT_NO_BINDINGS=ON \
	-DNaNAwareCCompiler=ON \
	-DCMAKE_USE_NAMESPACE=ON \
	-DCMAKE_NATIVE_BINARY_DIR=$(STAGING_DIR_HOST)/lib/$(PKG_NAME)-$(PKG_VERSION)/build_dir 

# plplot tries to find 'libm', 'libdl' and probably other libs via directory
# search, but that won't work since in openwrt trunk, it's in the toolchain
# directory.  For the ltdl stuff see plplot's FindLTDL.cmake file.
CMAKE_OPTIONS += \
	-DMATH_LIB:FILEPATH=$(TOOLCHAIN_DIR)/lib/libm.so \
	-DLTDL_LTDL_ADDLIB1:FILEPATH=$(TOOLCHAIN_DIR)/lib/libdl.so \
	-DLUA_MATH_LIBRARY:FILEPATH=$(TOOLCHAIN_DIR)/lib/libm.so

# everything done under unstall target!
ifdef CONFIG_PACKAGE_plplot-demo
endif

ifdef CONFIG_PACKAGE_plplot-cxx
	CMAKE_OPTIONS += -DENABLE_cxx=ON
endif

ifdef CONFIG_PACKAGE_plplot-qt
	CMAKE_OPTIONS += \
		-DPLD_qtwidget=ON \
		-DPLD_extqt=ON \
		-DENABLE_qt=ON \
		-DQT_QMAKE_EXECUTABLE=$(STAGING_DIR_HOST)/bin/qmake \
		-DQT_MOC_EXECUTABLE=$(STAGING_DIR_HOST)/bin/moc \
		-DQT_UIC_EXECUTABLE=$(STAGING_DIR_HOST)/bin/uic \
		-DQT_RCC_EXECUTABLE=$(STAGING_DIR_HOST)/bin/rcc
endif

ifdef CONFIG_PACKAGE_plplot-linuxvga
	CMAKE_OPTIONS += \
		-DPLD_linuxvga=ON
endif

ifdef CONFIG_PACKAGE_plplot-lua
	CMAKE_OPTIONS += -DENABLE_lua=ON
endif

ifdef CONFIG_PACKAGE_plplot-python
	CMAKE_OPTIONS += -DENABLE_python=ON
endif

ifdef CONFIG_PACKAGE_plplot-tcl
	CMAKE_OPTIONS +=	-DENABLE_tcl=ON 
endif

ifdef CONFIG_PACKAGE_plplot-octave
	CMAKE_OPTIONS +=	\
		-DENABLE_octave=ON \
		-DMKOCTFILE=$(STAGING_DIR)/usr/bin/mkoctfile \
		-DOCTAVE_OCT_DIR=/usr/lib/octave/site/oct/$(OPTIMIZE_FOR_CPU)-openwrt-linux-gnu \
		-Dmassage_LOCATION=$(STAGING_DIR_HOST)/lib/$(PKG_NAME)-$(PKG_VERSION)/build_dir/bindings/octave/massage
endif

#	$(if $(CONFIG_PACKAGE_libX11),FEATURE_XLOCK=y,FEATURE_XLOCK=n) \

define Build/Configure/Deprecated
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
#	echo "SET(CMAKE_PREFIX_PATH /usr)" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_LIBRARY_PATH  $(STAGING_DIR)/usr/lib $(STAGING_DIR)/lib $(STAGING_DIR_ROOT)/lib)" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_SKIP_BUILD_RPATH ON)" >> $(PKG_BUILD_DIR)/toolchain.cmake
#	echo "SET(CMAKE_INSTALL_RPATH /usr/lib;/lib)"  >> $(PKG_BUILD_DIR)/toolchain.cmake

	echo "SET(CMAKE_INCLUDE_PATH /usr/include)" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_SYSTEM_INCLUDE_PATH /include)" >> $(PKG_BUILD_DIR)/toolchain.cmake
        # search for programs in the build host directories
	echo "SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_PROGRAM_PATH $(STAGING_DIR_HOST)/bin $(STAGING_DIR)/usr/bin)" >> $(PKG_BUILD_DIR)/toolchain.cmake

        # for libraries and headers in the target directories
	echo "SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)" >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo "SET(PL_USE_NAMESPACE 1)" >> $(PKG_BUILD_DIR)/toolchain.cmake

	cd $(PKG_BUILD_DIR) && cmake $(CMAKE_OPTIONS)
endef

TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include
TARGET_LDFLAGS+=-L$(STAGING_DIR)/usr/lib

# Another cmake (or cmake.mk or plplot) bug workaround: CMAKE_CXX_COMPILER is
# not picked up.  Giving it CXX with the environment works better.  However,
# this breaks with ccache, so we have to disable ccache.  Uggh.
define Build/Configure
	export CXX="$(TOOLCHAIN_DIR)/bin/$(filter-out ccache,$(TARGET_CC))"; \
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default, VERBOSE=1)	
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
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
#	$(SED) 's,-I$$$${includedir},,g' $(1)/usr/lib/pkgconfig/plplotd.pc
#	$(SED) 's,-L$$$${libdir},,g' $(1)/usr/lib/pkgconfig/plplotd.pc
endef

define Package/plplot/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{plplotd,csirocsa,qsastime}.so* \
		$(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/plplot$(PKG_VERSION)/driversd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/plplot$(PKG_VERSION)/driversd/{mem,null,ps,svg}.{so,rc} \
		 $(1)/usr/lib/plplot$(PKG_VERSION)/driversd/
	$(INSTALL_DIR) $(1)/usr/share/plplot$(PKG_VERSION)
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/plplot$(PKG_VERSION)/*.{map,pal,fnt} \
		$(1)/usr/share/plplot$(PKG_VERSION)/
endef

# ugly, but necessary: compiling demo-programs on install, using the just
# installed libs.
define Package/plplot-demo/install
	$(SED) 's;/usr/lib/pkgconfig;$(STAGING_DIR)/usr/lib/pkgconfig;g' \
		$(PKG_INSTALL_DIR)/usr/share/plplot$(PKG_VERSION)/examples/c/Makefile
	$(MAKE) -C $(PKG_INSTALL_DIR)/usr/share/plplot$(PKG_VERSION)/examples/c/ \
		 C_INCLUDE_PATH=$(STAGING_DIR)/usr/include/plplot \
		 CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(EXTRA_CFLAGS) $(TARGET_LDFLAGS)"\
		RPATHCMD=

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/share/plplot$(PKG_VERSION)/examples/c/x??c \
		$(1)/usr/bin/
endef

define Package/plplot-cxx/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libplplotcxxd.so* \
		$(1)/usr/lib/
endef

define Package/plplot-qt/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libplplotqtd.so* \
		$(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/plplot$(PKG_VERSION)/driversd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/plplot$(PKG_VERSION)/driversd/qt.{so,rc} \
		 $(1)/usr/lib/plplot$(PKG_VERSION)/driversd/
endef

define Package/plplot-linuxvga/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/lib/plplot$(PKG_VERSION)/driversd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/plplot$(PKG_VERSION)/driversd/linuxvga.{so,rc} \
		 $(1)/usr/lib/plplot$(PKG_VERSION)/driversd/
endef

define Package/plplot-tcl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libplplottcltkd.so* \
		$(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtclmatrixd.so* \
		$(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/share/plplot$(PKG_VERSION)/tcl
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/plplot$(PKG_VERSION)/pkgIndex.tcl \
		$(1)/usr/share/plplot$(PKG_VERSION)/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/plplot$(PKG_VERSION)/tcl/*\
		$(1)/usr/share/plplot$(PKG_VERSION)/tcl/
endef

define Package/plplot-lua/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lua/*/plplot/plplotluac.so $(1)/usr/lib/lua/
endef

define Package/plplot-python/install
	$(INSTALL_DIR) $(1)/usr/lib/python
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/python/*/plplot/*.so* $(1)/usr/lib/python/
endef

define Package/plplot-octave/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/octave \
		$(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/share/{octave,plplot_octave} \
		$(1)/usr/share/
endef

# define Package/plplot-data/install
# 	$(INSTALL_DIR) $(1)/
# 	(cd $(PKG_INSTALL_DIR)/ && tar -cf - usr/share) \
# 	    | (cd $(1)/ && tar -xvf -)
# endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,plplot))
$(eval $(call BuildPackage,plplot-demo))
$(eval $(call BuildPackage,plplot-cxx))
$(eval $(call BuildPackage,plplot-qt))
$(eval $(call BuildPackage,plplot-linuxvga))
$(eval $(call BuildPackage,plplot-tcl))
$(eval $(call BuildPackage,plplot-lua))
$(eval $(call BuildPackage,plplot-python))
$(eval $(call BuildPackage,plplot-octave))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/plplot/compile -j2 V=99"
# End:
