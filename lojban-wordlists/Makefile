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

PKG_NAME:=lojban-wordlists
PKG_VERSION:=20050628
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://www.lojban.org/publications

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/lojban-wordlists
  TITLE:=Lojban word lists
  URL:=http://www.lojban.org/
  MAINTAINER:=".alyn.post" <alyn.post@lodockikumazvati.org>
  CATEGORY:=Languages
  SUBMENU:=Lojban
  SECTION:=lang
endef

define Package/jbofihe/description
  cmavo, gismu, lujvo, and rafsi, wordlists for Lojban.
endef

CMAVO:=cmavo.txt
GISMU:=gismu.txt
LUJVO:=lujvo.txt
NORALUJV:=NORALUJV.txt
RAFSI:=rafsi.txt

define Download/cmavo
  FILE:=$(CMAVO)
  URL:=$(PKG_SOURCE_URL)/wordlists
  MD5SUM:=d5b434ac9f3f75879ecb0d1fbcf86d47
endef

define Download/gismu
  FILE:=$(GISMU)
  URL:=$(PKG_SOURCE_URL)/wordlists
  MD5SUM:=4edb4480ad5c26cfd1bfd492f6f95de1
endef

define Download/lujvo
  FILE:=$(LUJVO)
  URL:=$(PKG_SOURCE_URL)/wordlists
  MD5SUM:=dbd82f42f4156a2a1801e2a5ec1e551e
endef

define Download/noralujv
  FILE:=$(NORALUJV)
  URL:=$(PKG_SOURCE_URL)/draft-dictionary
  MD5SUM:=d750de398740a2ba701422a466ddbeab
endef

define Download/rafsi
  FILE:=$(RAFSI)
  URL:=$(PKG_SOURCE_URL)/wordlists
  MD5SUM:=e4ec80a41f3016a561a904dfa1fbbd8d
endef

define Download/default
  $(eval $(call Download,cmavo))
  $(eval $(call Download,gismu))
  $(eval $(call Download,lujvo))
  $(eval $(call Download,noralujv))
  $(eval $(call Download,rafsi))
endef

define Host/Configure
endef

define Host/Compile
endef

define Host/Install
	$(INSTALL_DIR) \
		$(STAGING_DIR_HOST)/usr/share/lojban

	$(INSTALL_DATA) \
		$(DL_DIR)/NORALUJV.txt \
		$(DL_DIR)/cmavo.txt \
		$(DL_DIR)/gismu.txt \
		$(DL_DIR)/lujvo.txt \
		$(DL_DIR)/rafsi.txt \
		$(STAGING_DIR_HOST)/usr/share/lojban
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/lojban-wordlists/install
	$(INSTALL_DIR) \
		$(1)/usr/share/lojban

	$(INSTALL_DATA) \
		$(DL_DIR)/NORALUJV.txt \
		$(DL_DIR)/cmavo.txt \
		$(DL_DIR)/gismu.txt \
		$(DL_DIR)/lujvo.txt \
		$(DL_DIR)/rafsi.txt \
		$(1)/usr/share/lojban
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,lojban-wordlists))
