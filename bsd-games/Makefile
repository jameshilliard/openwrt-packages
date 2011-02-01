#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bsd-games
PKG_VERSION:=2.17
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://metalab.unc.edu/pub/Linux/games/
PKG_MD5SUM:=238a38a3a017ca9b216fc42bde405639

include $(INCLUDE_DIR)/package.mk

define Package/bsd-games
  SUBMENU:=bsd-games
  SECTION:=games
  CATEGORY:=Games
  URL:=ftp://metalab.unc.edu/pub/Linux/games/
endef

define Build/Configure
endef
CFLAGS:=
define Build/Compile
#Building tetris
	cd $(PKG_BUILD_DIR)/tetris; \
	cp pathnames.h.in pathnames.h; \
	$(TARGET_CC) -c -O2 -Wall -W -Wstrict-prototypes -Wmissing-prototypes -Wpointer-arith -Wcast-align -Wcast-qual -Wwrite-strings -I$(STAGING_DIR)/usr/include input.c screen.c shapes.c scores.c tetris.c; \
	$(TARGET_CC) -lncurses -L$(STAGING_DIR)/usr/lib -o tetris input.o screen.o shapes.o scores.o tetris.o

#Building primes
	cd $(PKG_BUILD_DIR)/primes; \
	$(TARGET_CC) -c -O2 -Wall -W -Wstrict-prototypes -Wmissing-prototypes -Wpointer-arith -Wcast-align -Wcast-qual -Wwrite-strings pattern.c pr_tbl.c primes.c; \
	$(TARGET_CC) -lm -o primes pattern.o pr_tbl.o primes.o

#Building worm
	cd $(PKG_BUILD_DIR)/worm; \
	$(TARGET_CC) -lncurses -L$(STAGING_DIR)/usr/lib -I$(STAGING_DIR)/usr/include -O2 -Wall -W -Wstrict-prototypes -Wmissing-prototypes -Wpointer-arith -Wcast-align -Wcast-qual -Wwrite-strings -o worm worm.c

#Building backgammon
	cd $(PKG_BUILD_DIR)/backgammon; \
	cd common_source; \
	$(TARGET_CC) -c -O2 -Wall -W -Wstrict-prototypes -Wmissing-prototypes -Wpointer-arith -Wcast-align -Wcast-qual -Wwrite-strings -I$(STAGING_DIR)/usr/include -DEXEC_PATH=\"/usr/bin/backgammon\" -DTEACH_PATH=\"/usr/bin/teachgammon\" allow.c board.c check.c fancy.c init.c odds.c one.c save.c subs.c table.c; \
	cd ../backgammon; \
	$(TARGET_CC) -c -O2 -Wall -W -Wstrict-prototypes -Wmissing-prototypes -Wpointer-arith -Wcast-align -Wcast-qual -Wwrite-strings -I$(STAGING_DIR)/usr/include -I$(PKG_BUILD_DIR)/backgammon/common_source extra.c main.c move.c text.c version.c; \
	$(TARGET_CC) -lncurses -L$(STAGING_DIR)/usr/lib -o backgammon $(ECHO) ../common_source/*.o ../backgammon/*.o; \
	cd ../teachgammon; \
	$(TARGET_CC) -c -O2 -Wall -W -Wstrict-prototypes -Wmissing-prototypes -Wpointer-arith -Wcast-align -Wcast-qual -Wwrite-strings -I$(STAGING_DIR)/usr/include -I$(PKG_BUILD_DIR)/backgammon/common_source data.c teach.c ttext1.c ttext2.c tutor.c; \
	$(TARGET_CC) -lncurses -L$(STAGING_DIR)/usr/lib -o teachgammon $(ECHO) ../common_source/*.o ../teachgammon/*.o
endef

define Package/tetris
$(call Package/bsd-games)
  TITLE:=the game of tetris
  DEPENDS:=+libncurses
endef

define Package/tetris/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/share/games

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/tetris/tetris \
		$(1)/usr/bin/tetris
endef

define Package/primes
$(call Package/bsd-games)
  TITLE:=generate primes
endef

define Package/primes/install
	$(INSTALL_DIR) \
		$(1)/usr/bin

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/primes/primes \
		$(1)/usr/bin/primes
endef

define Package/worm
$(call Package/bsd-games)
  TITLE:=The growing worm game
  DEPENDS:=+libncurses
endef

define Package/worm/install
	$(INSTALL_DIR) \
		$(1)/usr/bin

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/worm/worm \
		$(1)/usr/bin/worm
endef

define Package/backgammon
$(call Package/bsd-games)
  TITLE:=the game of backgammon
  DEPENDS:=+libncurses
endef

define Package/backgammon/install
	$(INSTALL_DIR) \
		$(1)/usr/bin

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/backgammon/backgammon/backgammon \
		$(1)/usr/bin/backgammon

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/backgammon/teachgammon/teachgammon \
		$(1)/usr/bin/teachgammon

	$(INSTALL_BIN) \
		$(FILES_DIR)/backgammon.sh \
		$(1)/usr/bin/backgammon.sh
endef

$(eval $(call BuildPackage,tetris))
$(eval $(call BuildPackage,primes))
$(eval $(call BuildPackage,worm))
$(eval $(call BuildPackage,backgammon))
