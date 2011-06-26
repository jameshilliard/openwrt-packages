# 
# Copyright (C) David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for the complete GNU Emacs editor

include $(TOPDIR)/rules.mk

PKG_NAME:=emacs
PKG_VERSION:=23.2
PKG_RELEASE:=5
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.fu-berlin.de/pub/gnu/emacs/ \
	@GNU/emacs/

PKG_MD5SUM:=b6691852dae0bc142b3c12749f6b7ade
PKG_INSTALL:=1

PKG_BUILD_PARALLEL:=1
HOST_BUILD_PARALLEL:=1

PKG_FIXUP:=libtool
PKG_REMOVE_FILES:=

PKG_BUILD_DEPENDS:= emacs/host

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/emacs/Default
  SUBMENU:=Emacs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=The GNU Emacs Editor a.k.a. \"Emacs OS\"
  URL:=http://www.gnu.org/software/emacs/
#  SUBMENU:=Editors
endef

define Package/emacs/Default/description
GNU Emacs is an extensible, customizable text editor — and more. 
At its core is an interpreter for Emacs Lisp, a dialect of the 
Lisp programming language with extensions to support text editing.
endef

define Package/emacs
$(call Package/emacs/Default)
  DEPENDS:=+libncurses +emacs-data
  TITLE+= (executable)
endef

define Package/emacs/description
$(call Package/emacs/Default/description)
 This package contains the Emacs executable files
endef

define Package/emacs-data
$(call Package/emacs/Default)
  TITLE+= (compiled lisp)
endef

define Package/emacs-data/description
$(call Package/emacs/Default/description)
 This package contains the compiled Lisp files needed to run Emacs.
endef

define Package/emacs-ja-dic
$(call Package/emacs/Default)
  TITLE+= (japanese input dictionary)
  DEPENDS:=+emacs
endef

define Package/emacs-ja-dic/description
$(call Package/emacs/Default/description)
 This package contains the japanese dictionary used to input japanese Kanji 
 via Hiragana->Kanji conversion (\'set-input-method japanese\').  This
 dictionary is huge, so huge that emacs won\'t be able to load it on systems
 with 32MB or fewer RAM.
endef

define Package/emacs-el
$(call Package/emacs/Default)
  TITLE+= (lisp source)
endef

define Package/emacs-el/description
$(call Package/emacs/Default/description)
 This package contains the Lisp source files of Emacs that can queried via
 C-h f in case provided documentation of an Emacs function is insufficient.
endef

DUMP_EMACS=1

EMACS_STRIPTEASE_ARGS = \
	--without-x \
	--without-xpm \
	--without-jpeg \
	--without-gif \
	--without-png \
	--without-rsvg \
	--without-xft \
	--without-libotf \
	--without-dbus \
	--without-gconf \
	--without-gpm \
	--without-sound

HOST_CONFIGURE_ARGS += $(EMACS_STRIPTEASE_ARGS)
CONFIGURE_ARGS += $(EMACS_STRIPTEASE_ARGS)

## Don't try that: lowering PURESIZE makes Emacs' RAM usage explode!  Maybe
## something about Elisp garbage collection!?
#TARGET_CPPFLAGS += -DPURESIZE=16

# sed-script to apply to src/Makefile of emacs sources.  more commands
# appended below
EMACS_MAKEFILE_SED = ;

# sed-script to apply to src/epaths.h, commands appended below
EMACS_EPATHS_SED = ;

## when DUMP_EMACS is unset, we keep emacs build system from doing all
## kinds nasty tricks that won't work (well) with openwrt and uclibc.
## Especially keep it from attempting to manually configure crt* startup file
## linking.  We won't be able to 'dump' during cross-compile anyway.  Dumping
## inside the target system seems not possible due to lack of RAM.  Note that
## we also need to sanitize the Makefile using 'sed' below.
ifeq ($(DUMP_EMACS),)
	MAKE_FLAGS += "LD=$(TARGET_CROSS)gcc" 
	TARGET_CPPFLAGS += -DCANNOT_DUMP -DNO_REMAP -DORDINARY_LINK
	EMACS_MAKEFILE_SED += ; s;\(TEMACS_LDFLAGS\|STARTFILES\) =.*;\1 =;
	EMACS_MAKEFILE_SED += ; s; /usr/lib/crt[^ ]\+; ;g
	EMACS_EPATHS_SED += ; s;\(\#.*PATH_DUMPLOADSEARCH\).*$$$$;\1 PATH_LOADSEARCH;
        define emacs_perform_dump
	  $(CP) $(PKG_BUILD_DIR)/src/temacs $(PKG_BUILD_DIR)/src/emacs
        endef
else
	MAKE_FLAGS += LD="$(TARGET_CROSS)gcc -nostdlib"
	TARGET_CPPFLAGS +=
        # warning: on backfile it'd be $(TOOLCHAIN_DIR)/usr/lib
	EMACS_MAKEFILE_SED += ; s; /usr/lib/crt\([^ ]\+\); $(TOOLCHAIN_DIR)/lib/crt\1;g

	PKG_BUILD_DEPENDS += +qemu-host/host

        define emacs_perform_dump
	  $(SED) \
	    's/(member (nth 3 command-line-args) .("dump" "bootstrap"))/t/g' \
	     $(PKG_BUILD_DIR)/lisp/loadup.el
	  cd $(PKG_BUILD_DIR)/src && \
	  $(STAGING_DIR_HOST)/bin/qemu-$(ARCH) -E LD_LIBRARY_PATH=$(STAGING_DIR_ROOT)/usr/lib/ \
		-L $(STAGING_DIR_ROOT) -E LC_ALL=C ./temacs -batch -l loadup 
        endef
endif

define Build/Prepare
	$(call Build/Prepare/Default)
endef

define Host/Configure
	$(call Host/Configure/Default)
endef

## On the host, we only compile and install minimum Emacs components used for
## bootstrapping
define Host/Compile
	export LD_LIBRARY_PATH=$(STAGING_DIR_HOST)/lib; \
	$(call Host/Compile/Default)
endef

define Host/Install
	$(call Host/Install/Default)
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/lib-src/make-docfile $(STAGING_DIR_HOST)/bin/emacs-make-docfile
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/src/prefix-args $(STAGING_DIR_HOST)/bin/emacs-prefix-args
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default, -C lib-src -o test-distrib)
	ln -sf $(STAGING_DIR_HOST)/bin/emacs-make-docfile $(PKG_BUILD_DIR)/lib-src/make-docfile
	ln -sf $(STAGING_DIR_HOST)/bin/emacs-prefix-args $(PKG_BUILD_DIR)/src/prefix-args
	$(SED) '$(EMACS_MAKEFILE_SED)' $(PKG_BUILD_DIR)/src/Makefile
	$(SED) '$(EMACS_EPATHS_SED)' $(PKG_BUILD_DIR)/src/epaths.h
	$(call Build/Compile/Default, -C src -o lib-src -o prefix-args -o ../lib-src/make-docfile temacs ../etc/DOC)
	$(call emacs_perform_dump)
	$(call Build/Compile/Default, -C lisp EMACS=$(STAGING_DIR_HOST)/bin/emacs)
	$(call Build/Compile/Default, -C leim BUILT-EMACS=$(STAGING_DIR_HOST)/bin/emacs)
endef

define Build/Install
	sed -ie 's;./src/emacs\( --version\);$(STAGING_DIR_HOST)/bin/emacs \1;g' \
		$(PKG_BUILD_DIR)/Makefile
	$(call Build/Install/Default,install-arch-indep install-arch-dep install-leim INSTALL_STRIP="" "MFLAGS=-o test-distrib")
	$(INSTALL_DATA) ./files/site-start.el $(PKG_INSTALL_DIR)/usr/share/emacs/$(PKG_VERSION)/site-lisp
endef

define Package/emacs/install
	$(INSTALL_DIR) $(1)/usr
	cp -r $(PKG_INSTALL_DIR)/usr/{bin,lib} $(1)/usr
endef

define Package/emacs-data/install
	$(INSTALL_DIR) $(1)/
	(cd $(PKG_INSTALL_DIR)/ && \
	  tar -cf - --exclude "*.el.gz" \
		--exclude "images" \
		--exclude "refcards" \
		--exclude "schema" \
		--exclude "NEWS*" \
		--exclude "ja-dic" \
		usr/share) \
	    | (cd $(1)/ && tar -xvf -)
endef

define Package/emacs-ja-dic/install
	$(INSTALL_DIR) $(1)/usr
	(cd $(PKG_INSTALL_DIR)/usr && tar -cf - \
	    --exclude "*.el.gz" share/emacs/$(PKG_VERSION)/leim/ja-dic) \
		| (cd $(1)/usr && tar -xvf -)
endef

define Package/emacs-el/install
	$(INSTALL_DIR) $(1)/usr
	(cd $(PKG_INSTALL_DIR)/usr && find share -name "*.el.gz" \
	  | tar -cf - -T - --exclude "ja-dic" ) \
	 | (cd $(1)/usr && tar -xvf -)
endef


$(eval $(call HostBuild))
$(eval $(call BuildPackage,emacs))
$(eval $(call BuildPackage,emacs-data))
$(eval $(call BuildPackage,emacs-ja-dic))
$(eval $(call BuildPackage,emacs-el))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/emacs/compile -j2 V=99"
# End:
