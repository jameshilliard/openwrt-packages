#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=qball
PKG_VERSION:=1.2
PKG_RELEASE:=1
PKG_SOURCE_URL:=http://homepage.ntlworld.com/mark.harman/
PKG_SOURCE:=qball_src.zip
PKG_MD5SUM:=106736362979921cd02fa7675f38c483
UNZIP_CMD=unzip -d $(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION) $(DL_DIR)/$(PKG_SOURCE)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/QBall

$(call include_mk,qmake.mk)

define Package/qball
	SECTION:=games
	CATEGORY:=Games
	TITLE:=simple breakout style game
	DEPENDS:=+qt4 +qt4-gui +dejavu-fonts-ttf
	URL:=http://homepage.ntlworld.com/mark.harman/comp_qball.html
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	(\
cd $(PKG_BUILD_DIR); \
echo "QMAKE_UIC=$(STAGING_DIR_HOST)/bin/uic" >> QBall.pro; \
echo "QMAKE_MOC=$(STAGING_DIR_HOST)/bin/moc" >> QBall.pro; \
echo "QMAKE_RCC=$(STAGING_DIR_HOST)/bin/rcc" >> QBall.pro; \
echo "QMAKE_LINK=$(TARGET_CXX)" >> QBall.pro; \
echo "QMAKE_LIBS+=$(INTL_LDFLAGS)" >> QBall.pro; \
echo "QMAKE_LIBS+=$(ICONV_LDFLAGS)" >> QBall.pro; \
echo "QMAKE_LIBS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib" >> QBall.pro; \
echo "INCLUDEPATH += $(STAGING_DIR)/usr/include" >> QBall.pro; \
echo "INCLUDEPATH += $(STAGING_DIR)/usr/include/Qt" >> QBall.pro; \
echo "INCLUDEPATH += $(STAGING_DIR)/usr/include/QtGui" >> QBall.pro; \
echo "INCLUDEPATH += $(STAGING_DIR)/usr/include/QtCore" >> QBall.pro; \
)
endef

define Build/Configure
	$(call Build/Configure/Qmake,QBall)
endef

define Package/qball/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/QBall $(1)/usr/bin/qball
endef

$(eval $(call BuildPackage,qball))
