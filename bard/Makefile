#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bard
PKG_VERSION:=0.6

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-current.tar.bz2
PKG_SOURCE_URL:=http://festvox.org/bard/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-current/
PKG_RELEASE:=1
PKG_FIXUP:=autoreconf


include $(INCLUDE_DIR)/package.mk

define Package/bard
  MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=bard
  URL:=http://festvox.org/bard/
  DEPENDS:=+flite +libsdl +libsdl-ttf +dejavu-fonts-ttf-DejaVuSans
endef

define Package/bard/description
Bard Storyteller is a text reader.  Bard not only allows a user to read books,
but can also read books to a user using text-to-speech.
endef

CONFIGURE_ARGS += FLITEDIR=$(STAGING_DIR)/usr \
	DEFAULTFONT=/usr/share/fonts/ttf-dejavu/DejaVuSans.ttf

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include/SDL
TARGET_LDFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/bard/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/bard $(1)/usr/bin/
endef

$(eval $(call BuildPackage,bard))
