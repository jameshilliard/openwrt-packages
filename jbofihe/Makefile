#
# Copyright (C) 2010 Alan Post <alanpost@sunflowerriver.org>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=jbofihe
PKG_VERSION:=0.38
PKG_RELEASE:=1

PKG_BUILD_DEPENDS:= jbofihe/host lojban-wordlists/host

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.rpcurnow.force9.co.uk/jbofihe/
PKG_MD5SUM:=7e2cc9149da705c7a774029fb5247248

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/jbofihe
  TITLE:=Lojban Language Parser
  URL:=http://www.rc0.org.uk/jbofihe/
  MAINTAINER:=".alyn.post" <alyn.post@lodockikumazvati.org>
  CATEGORY:=Languages
  SUBMENU:=Lojban
  SECTION:=lang
  DEPENDS:=+libc
endef

define Package/jbofihe/description
  A parser for the Lojban language.
endef

define Host/Configure
	(	cd "$(HOST_BUILD_DIR)"; \
		perl config.pl \
	)
endef

define Host/Compile
	$(call Host/Compile/Default,dfasyn/dfasyn smujajgau uncom)
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/bin
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/smujajgau $(STAGING_DIR_HOST)/bin/
endef


define Build/Configure
	(	cd "$(PKG_BUILD_DIR)" && \
		perl config.pl --prefix=/usr \
	)
	ln -s "$(DL_DIR)/lujvo.txt" "$(PKG_BUILD_DIR)"
	ln -s "$(DL_DIR)/NORALUJV.txt" "$(PKG_BUILD_DIR)"
	ln -s "$(HOST_BUILD_DIR)/uncom" "$(PKG_BUILD_DIR)/uncom_host"
	ln -s "$(HOST_BUILD_DIR)/dfasyn/dfasyn" \
	      "$(PKG_BUILD_DIR)/dfasyn/dfasyn_host"
	ln -s "$(STAGING_DIR_HOST)/bin/smujajgau" \
	      "$(PKG_BUILD_DIR)/smujajgau_host"
	( $(MAKE) -C $(PKG_BUILD_DIR) stag.h && \
	cd $(PKG_BUILD_DIR) && \
	$(SED) 's/YYTOKENTYPE/STAGYYTOKENTYPE/' stag.h && \
	$(SED) 's/yytokentype/stagyytokentype/' stag.h \
	)
endef

define Build/Compile
	$(call Build/Compile/Default,all)
endef

JBOFIHE_BIN_DIR = /usr/bin
JBOFIHE_MAN_DIR = /usr/share/man/man1
JBOFIHE_LIB_DIR = /usr/lib/$(PKG_NAME)

define Package/jbofihe/install
	$(INSTALL_DIR) \
		$(1)/$(JBOFIHE_MAN_DIR) \
		$(1)/$(JBOFIHE_LIB_DIR) \
		$(1)/$(JBOFIHE_BIN_DIR)

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cmafihe    $(1)/$(JBOFIHE_BIN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/jbofihe    $(1)/$(JBOFIHE_BIN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/jvocuhadju $(1)/$(JBOFIHE_BIN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/smujajgau  $(1)/$(JBOFIHE_BIN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/vlatai     $(1)/$(JBOFIHE_BIN_DIR)

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/cmafihe.1 \
		$(PKG_BUILD_DIR)/jbofihe.1 \
		$(PKG_BUILD_DIR)/jvocuhadju.1 \
		$(PKG_BUILD_DIR)/smujajgau.1 \
		$(PKG_BUILD_DIR)/vlatai.1 \
		$(1)/$(JBOFIHE_MAN_DIR)

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/smujmaji.dat \
		$(1)/$(JBOFIHE_LIB_DIR)
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,jbofihe))
