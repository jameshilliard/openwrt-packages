# 
# Copyright (C) David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.
#
# Converts and installs SKKDIC-JISYO-M for use with Emacs' japanese input
# method.

include $(TOPDIR)/rules.mk

PKG_NAME:=emacs-ja-dic-m
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_SOURCE:=SKK-JISYO.M.gz
PKG_SOURCE_URL:=http://openlab.ring.gr.jp/skk/dic/
PKG_MD5SUM:=f7aa51134b25c5481daca8cb396b3964
PKG_BUILD_DEPENDS:= emacs/host
PKG_UNPACK = gzip -dc $(DL_DIR)/$(PKG_SOURCE) > $(PKG_BUILD_DIR)/ja-dic
include $(INCLUDE_DIR)/package.mk

BATCH_RUN_EMACS := cd $(PKG_BUILD_DIR) && emacs -batch --no-site-file --multibyte

define Package/emacs-ja-dic-m
  SUBMENU:=Emacs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Medium-size dictionary file for Emacs\' japanese input method
  URL:=http://openlab.ring.gr.jp/skk/dic.html
  DEPENDS:=+emacs
#  SUBMENU:=Editors
endef

define Package/emacs-ja-dic-m/description
 Medium-size japanese Kanji dictionary for use with Emacs\' japanese input
 method.  This dictionary is about a factor of 100 smaller than the ja-dic
 dictionary that ships with Emacs.  Use it to enable japanese input on
 memory-constrained systems.
endef

define Build/Configure
endef

define Build/Compile
	$(BATCH_RUN_EMACS) -l ja-dic-cnv -f batch-skkdic-convert "ja-dic"
	$(BATCH_RUN_EMACS) -f batch-byte-compile "ja-dic.el"
endef

define Package/emacs-ja-dic-m/install
	$(INSTALL_DIR) $(1)/usr/share/emacs/site-lisp/ja-dic
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/ja-dic.elc $(1)/usr/share/emacs/site-lisp/ja-dic/
endef

$(eval $(call BuildPackage,emacs-ja-dic-m))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/emacs/compile -j2 V=99"
# End:
