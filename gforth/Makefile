# Makefile for OpenWRT for cross-compiling GForth
#
# Copyright (C) 2010 David Kühling.  License: GPLv2+

include $(TOPDIR)/rules.mk

PKG_NAME:=gforth
PKG_VERSION:=0.7.0-20100725
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://mosquito.dyndns.tv/~spock/
PKG_MD5SUM:=f030bdfe42a9be32889d5b4c8cb37856

PKG_BUILD_DEPENDS:= gforth/host libldtl/host
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

# for now: override download and use local gforth sources
# remove the prepare.stamp if updating tgz
# define Build/Prepare
# 	mkdir -p $(PKG_BUILD_DIR)
# 	(cd $(PKG_BUILD_DIR)/.. && tar -xzvf -) < ~/forth/gforth/$(PKG_SOURCE)
# endef
# define Host/Prepare
# 	mkdir -p $(HOST_BUILD_DIR)
# 	(cd $(HOST_BUILD_DIR)/.. && tar -xzvf -) < ~/forth/gforth/$(PKG_SOURCE)
# endef

define Package/gforth
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=GForth
  DEPENDS:= +libltdl
  URL:=http://www.gnu.org/software/gforth/
endef

define Package/gforth/description
  Gforth is a fast and portable implementation of the ANS Forth
  language.
endef

HOST_CONFIGURE_VARS += LTDL_LIBRARY_PATH=$(STAGING_DIR_HOST)/lib 

# found this in the libtool Makefile.  does it help us?
#export GLOBAL_LIBDIR=$(STAGING_DIR)/usr/lib

define Host/Configure
	export LD_LIBRARY_PATH=$(STAGING_DIR_HOST)/lib; $(call Host/Configure/Default)
endef

# define Host/Compile
# 	$(MAKE) -C $(HOST_BUILD_DIR) 
# endef

# define Host/Install
# 	$(MAKE) -C $(HOST_BUILD_DIR) \
# 		DESTDIR="$(STAGING_DIR_HOST)" \
# 		install
# endef

# todo: skipcode=
# todo: compiler options / tuning (openwrt sets bad defaults?)

define Build/Configure
	$(call Build/Configure/Default,)
	echo "#!/bin/sh" > $(PKG_BUILD_DIR)/preforth
	echo '$(STAGING_DIR_HOST)/bin/gforth -i $(STAGING_DIR_HOST)/lib/gforth/$(PKG_VERSION)/gforth.fi "$$$$@"' >> $(PKG_BUILD_DIR)/preforth
	chmod a+x $(PKG_BUILD_DIR)/preforth
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) kernel/version.fs gforth-ditc \
		engine/prim-fast.i engine/prim_lab-fast.i engine/prim_names-fast.i \
		engine/prim_superend-fast.i engine/profile-fast.i \
		engine/prim_num-fast.i engine/prim_grp-fast.i \
		engine/costs-fast.i engine/super2-fast.i
	$(MAKE) -C $(PKG_BUILD_DIR)/engine gforth-fast-ll-reg gforth-ll-reg \
		OPT=-ll-reg OPTDEFINES="-DFORCE_LL -DFORCE_REG" OPTOBJECTS=
	cd $(PKG_BUILD_DIR) && \
            cp engine/gforth-ll-reg ./gforth && \
	    cp engine/gforth-fast-ll-reg ./gforth-fast
endef

STARTUP	= exboot.fs startup.fs arch/mips/asm.fs arch/mips/disasm.fs

GFORTH_FI_SRC = \
	assert.fs \
	backtrac.fs \
	blocked.fb \
	blocks.fs \
	bufio.fs \
	code.fs \
	debug.fs \
	debugs.fs \
	dis-gdb.fs \
	ekey.fs \
	envos.fs \
	savesys.fs \
	environ.fs \
	errors.fs \
	exboot.fs \
	except.fs \
	extend.fs \
	float.fs \
	glocals.fs \
	hash.fs \
	history.fs \
	intcomp.fs \
	mkdir.fs \
	libcc.fs \
	locals.fs \
	look.fs \
	mkdir.fs \
	prelude.fs \
	quotes.fs \
	search.fs \
	see.fs \
	see-ext.fs \
	simp-see.fs \
	source.fs \
	startup.fs \
	struct.fs \
	struct0x.fs \
	stuff.fs \
	tasker.fs \
	termsize.fs \
	utf-8.fs \
	vt100.fs \
	vt100key.fs \
	wordinfo.fs \
	arch/mips/asm.fs arch/mips/disasm.fs arch/mips/insts.fs \
	arch/mips/testasm.fs arch/mips/testdisasm.fs 

LIBCC_SRC = cstr.fs unix/socket.fs
LIBCC_DIST_SRC = libffi.fs fflib.fs $(LIBCC_SRC)

# todo: strip down
FORTH_SRC = $(GFORTH_FI_SRC) $(LIBCC_DIST_SRC) \
	ans-report.fs ansi.fs answords.fs \
	colorize.fs comp-i.fs complex.fs \
	depth-changes.fs dosekey.fs doskey.fs ds2texi.fs \
	envos.dos envos.os2 etags.fs fft.fs filedump.fs fi2c.fs \
	fsl-util.4th glosgen.fs gray.fs httpd.fs install-tags.fs \
	make-app.fs doc/makedoc.fs locate.fs more.fs onebench.fs \
	other.fs prims2x.fs prims2x0.6.2.fs proxy.fs random.fs \
	regexp.fs sokoban.fs string.fs table.fs tags.fs \
	tt.fs \
	unbuffer.fs wordsets.fs xwords.fs \
	test/tester.fs test/ttester.fs \
	test/coretest.fs test/postpone.fs test/dbltest.fs \
	test/string.fs test/float.fs test/search.fs test/gforth.fs \
	test/other.fs test/signals.fs test/checkans.fs \
	test/primtest.fs test/coreext.fs test/deferred.fs \
	test/coremore.fs test/gforth-nofast.fs test/libcc.fs \
	test/macros.fs \
	compat/strcomp.fs \
	bubble.fs siev.fs matrix.fs fib.fs \
	oof.fs oofsampl.fs objects.fs objexamp.fs mini-oof.fs moof-exm.fs \
	moofglos.fs fixpath.fs \
	add.fs lib.fs oldlib.fs sieve.fs \
	endtry-iferror.fs recover-endtry.fs

FS_INSTALL_DIR=/usr/share/gforth/$(PKG_VERSION)

define Package/gforth/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib/gforth
	$(INSTALL_DIR) $(1)/$(FS_INSTALL_DIR)
	$(INSTALL_DIR) $(1)/usr/share/gforth/site-forth
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gforth-fast $(1)/usr/bin/gforth-fast-bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gforth $(1)/usr/bin/gforth-bin
	$(INSTALL_BIN) files/gforth $(1)/usr/bin/gforth
	$(INSTALL_BIN) files/gforth $(1)/usr/bin/gforth-fast
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/kernl32l.fi $(1)/$(FS_INSTALL_DIR)
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/siteinit.fs $(1)/usr/share/gforth/site-forth
	$(call pkg_install_files,$(FORTH_SRC),$(PKG_BUILD_DIR),$(1)/$(FS_INSTALL_DIR))
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,gforth))
