#
# This is free software, licensed under the GNU General Public License v2.
# If this works, I'll be a better hacker!
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gtypist
PKG_VERSION:=2.8.5
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.gnu.org/gnu/gtypist/
PKG_BUILD_DIR:=$(BUILD_DIR)/gtypist-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

# Definition of the package, for adding to menuconfig and creating the ipkg.
define Package/gtypist
	TITLE:=GNU typist from FSF
	SECTION:=games
	CATEGORY:=Games
	URL:=http://www.gnu.org/software/gtypist/
	DEPENDS:=+libncurses
endef

# Long description of the package
define Package/gtypist/description
GNU Typist (also called gtypist) is a universal typing tutor. You can learn correct typing and improve your skills by practicing its exercises on a regular basis.
endef

define Package/gtypist/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/gtypist
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/gtypist $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/lessons/*.typ $(1)/usr/share/gtypist/
endef

$(eval $(call BuildPackage,gtypist))
