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

PKG_NAME:=makfa
PKG_VERSION:=20091212
PKG_REV:=e6c80dc33aa94358e767d34cbb5c1e003485db62
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://github.com/lojban/makfa-cli
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/makfa
  TITLE:=Lojban Dictionary
  URL:=http://gittub.com/lojban/makfa-cli
  MAINTAINER:=".alyn.post" <alyn.post@lodockikumazvati.org>
  CATEGORY:=Languages
  SUBMENU:=Lojban
  SECTION:=lang
  DEPENDS:=+python
endef

define Package/jbofihe/description
  A Lojban dictionary.
endef

define Build/Configure
endef

# Since the Ben NanoNote does not have internet access, build the dictionary
# on the host machine and copy it into the package.
#

#	python $(PKG_BUILD_DIR)/makfa update en $(PKG_BUILD_DIR)/makfa.dump
#	if there is update. please use this command update files/makfa.dump
#	sometimes this needs hours in buildhost.
define Build/Compile
endef

define Package/makfa/install
	$(INSTALL_DIR) \
		$(1)/usr/share/$(PKG_NAME) \
		$(1)/usr/bin

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/makfa \
		$(1)/usr/bin/

	$(INSTALL_DATA) \
		$(FILES_DIR)/makfa.dump \
		$(1)/usr/share/$(PKG_NAME)/
endef

$(eval $(call RequireCommand,python, \
	Please install Python 2.x \
))

$(eval $(call BuildPackage,makfa))
