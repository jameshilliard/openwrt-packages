# 
# Copyright (C) David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=emacs
PKG_VERSION:=23.2
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.fu-berlin.de/pub/gnu/emacs/ \
	@GNU/emacs/

PKG_MD5SUM:=b6691852dae0bc142b3c12749f6b7ade
PKG_INSTALL:=1
PKG_FIXUP:=libtool

PKG_BUILD_DEPENDS:= emacs/host libtool/host

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/emacs/Default
  SUBMENU:=Emacs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=The GNU Emacs Self-Documenting, Extensible Editor
  URL:=http://www.gnu.org/software/emacs/
#  SUBMENU:=Editors
endef

define Package/emacs/Default/description
GNU Emacs is an extensible, customizable text editor — and more. 
At its core is an interpreter for Emacs Lisp, a dialect of the 
Lisp programming language with extensions to support text editing.
endef

define Package/emacs-bin
$(call Package/emacs/Default)
  DEPENDS:=+libncurses +emacs-data
  TITLE+= (executable)
endef

define Package/emacs-bin/description
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
endef

define Package/emacs-ja-dic/description
$(call Package/emacs/Default/description)
 This package contains the japanese dictionary used to input japanese Kanji 
 via Hiragana->Kanji conversion (\'set-input-method japanese\').  This
 dictionary is huge, so huga that emacs won\'t be able to load it on systems
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

HOST_CONFIGURE_ARGS += --without-x
CONFIGURE_ARGS += --without-x 
MAKE_FLAGS += "LD=$(TARGET_CROSS)gcc -nostdlib"

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
	$(call Host/Compile/Default, lib-src)
	$(call Host/Compile/Default, -C src temacs emacs)
endef

define Host/Install
	export LD_LIBRARY_PATH=$(STAGING_DIR_HOST)/lib; \
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/bin
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/lib
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/src/temacs $(STAGING_DIR_HOST)/bin/
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/src/emacs $(STAGING_DIR_HOST)/bin/
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/lib-src/make-docfile $(STAGING_DIR_HOST)/bin/emacs-make-docfile
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/src/prefix-args $(STAGING_DIR_HOST)/bin/emacs-prefix-args
#	$(INSTALL_DATA) $(HOST_BUILD_DIR)/bla $(STAGING_DIR_HOST)/lib/
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default, -C lib-src -o test-distrib)
#	ln -sf $(STAGING_DIR_HOST)/bin/temacs $(PKG_BUILD_DIR)/src/
	ln -sf $(STAGING_DIR_HOST)/bin/emacs-make-docfile $(PKG_BUILD_DIR)/lib-src/make-docfile
	ln -sf $(STAGING_DIR_HOST)/bin/emacs-prefix-args $(PKG_BUILD_DIR)/src/prefix-args
	sed -ie 's; /usr/lib/crt; $(TOOLCHAIN_DIR)/usr/lib/crt;g' $(PKG_BUILD_DIR)/src/Makefile
	sed -ie 's;\(#.*PATH_DUMPLOADSEARCH\).*$$$$;\1 PATH_LOADSEARCH;' $(PKG_BUILD_DIR)/src/epaths.h
	$(call Build/Compile/Default, -C src -o lib-src -o prefix-args -o ../lib-src/make-docfile temacs ../etc/DOC)
	cp -v $(PKG_BUILD_DIR)/src/temacs $(PKG_BUILD_DIR)/src/emacs
	$(call Build/Compile/Default, -C lisp EMACS=$(STAGING_DIR_HOST)/bin/emacs)
	$(call Build/Compile/Default, -C leim BUILT-EMACS=$(STAGING_DIR_HOST)/bin/emacs)
endef

define Build/Install
	$(call Build/Install/Default,install-arch-indep install-arch-dep install-leim "MFLAGS=-o test-distrib")
	$(INSTALL_DATA) ./files/site-start.el $(PKG_INSTALL_DIR)/usr/share/emacs/$(PKG_VERSION)/site-lisp
endef

define Package/emacs-bin/install
	$(INSTALL_DIR) $(1)/usr
	cp -r $(PKG_INSTALL_DIR)/usr/{bin,lib} $(1)/usr
endef

define Package/emacs-data/install
	$(INSTALL_DIR) $(1)/usr
	(cd $(PKG_INSTALL_DIR)/usr && \
	  tar -cf - --exclude "*.el.gz" \
		--exclude "images" \
		--exclude "refcards" \
		--exclude "schema" \
		--exclude "NEWS*" \
		--exclude "ja-dic" \
		share) \
	    | (cd $(1)/usr && tar -xvf -)
endef

define Package/emacs-ja-dic/install
	$(INSTALL_DIR) $(1)/usr
	(cd $(PKG_INSTALL_DIR)/usr && tar -cf - \
	    --exclude "*.el.gz" share/emacs/$(PKG_VERSION)/leim/ja-dic) \
		| (cd $(1)/usr && tar -xvf -)
endef

define Package/emacs-el/install
	$(INSTALL_DIR) $(1)/usr
	(cd $(PKG_INSTALL_DIR)/usr && find share -name "*.el.gz" | tar -cf - -T -) \
		| (cd $(1)/usr && tar -xvf -)
endef


$(eval $(call HostBuild))
$(eval $(call BuildPackage,emacs-bin))
$(eval $(call BuildPackage,emacs-data))
$(eval $(call BuildPackage,emacs-ja-dic))
$(eval $(call BuildPackage,emacs-el))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/emacs/compile -j2 V=99"
# End:
