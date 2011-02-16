#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=supertux
PKG_VERSION:=0.1.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.berlios.de/$(PKG_NAME)/
PKG_MD5SUM:=f2fc288459f33d5cd8f645fbca737a63

include $(INCLUDE_DIR)/package.mk

define Package/supertux
  TITLE:=supertux
  SECTION:=games
  CATEGORY:=Games
  URL:=http://supertux.lethargik.org
  DEPENDS:=+libsdl +libsdl-image +libmikmod
endef

define Package/supertux/description
  SuperTux is a classic 2D jump'n run sidescroller game in a style similar to the original Super Mario games covered under the GPL.
endef

CONFIGURE_ARGS+=--disable-opengl \
		--disable-sdltest \
		--with-sdl-prefix=$(STAGING_DIR)/usr \
		--enable-320x240

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/Configure
	( cd $(PKG_BUILD_DIR) ; ./autogen.sh )
	$(call Build/Configure/Default)
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	(\
$(CP) $(FILES_DIR)/img-resize.sh $(PKG_BUILD_DIR); \
$(CP) $(FILES_DIR)/supertux-smallsize-data.tar.bz2 $(PKG_BUILD_DIR); \
cd $(PKG_BUILD_DIR); \
for i in background shared tilesets title worldmap; do \
	echo "Converting images in $(PKG_BUILD_DIR)/data/images/$$$$i..."; \
	cd $(PKG_BUILD_DIR)/data/images/$$$$i; \
	sh $(PKG_BUILD_DIR)/img-resize.sh; \
done; \
bzip2 -dc $(PKG_BUILD_DIR)/supertux-smallsize-data.tar.bz2 | $(TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xf -; \
)
endef

define Package/supertux/install
	$(INSTALL_DIR) \
		$(1)/usr/bin/ \
		$(1)/usr/share/supertux/{images,levels,music,sounds} \

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/src/supertux \
		$(1)/usr/bin/

	$(CP) \
		$(PKG_BUILD_DIR)/data/{images,levels,music,sounds,supertux.strf,*.txt} \
		$(1)/usr/share/supertux

	rm -rf \
		$(1)/usr/share/supertux/images/{background,shared,tilesets,title,worldmap}/org

	ln -s \
		SALCON.MOD \
		$(1)/usr/share/supertux/music/salcon.mod

	ln -s \
		SALCON-fast.MOD \
		$(1)/usr/share/supertux/music/salcon-fast.mod
endef

$(eval $(call RequireCommand,pngcrush,Please install pngcrush.))
$(eval $(call RequireCommand,convert,Please install imagemagick.))
$(eval $(call BuildPackage,supertux))
