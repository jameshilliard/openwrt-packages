#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=qstardict
PKG_VERSION:=0.13.1
PKG_RELEASE:=1
PKG_SOURCE_URL:=http://qstardict.ylsoftware.com/files/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=0828c3fa01c5237db8a67d356a9d1a8c

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
$(call include_mk,qmake.mk)

define Package/qstardict
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Qt clone of stardict
	DEPENDS:=+qt4 +qt4-gui +dejavu-fonts-ttf +qt4-network +qt4-xml +glib2
	URL:=http://qstardict.ylsoftware.com
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	(\
cd $(PKG_BUILD_DIR); \
echo "QMAKE_UIC=$(STAGING_DIR_HOST)/bin/uic" >> qstardict.pri; \
echo "QMAKE_MOC=$(STAGING_DIR_HOST)/bin/moc" >> qstardict.pri; \
echo "QMAKE_RCC=$(STAGING_DIR_HOST)/bin/rcc" >> qstardict.pri; \
echo "QMAKE_CC=$(TARGET_CC)" >> qstardict.pri; \
echo "QMAKE_CXX=$(TARGET_CXX)" >> qstardict.pri; \
echo "QMAKE_LINK=$(TARGET_CXX)" >> qstardict.pri; \
echo "QMAKE_LIBS+=$(INTL_LDFLAGS)" >> qstardict.pri; \
echo "QMAKE_LIBS+=$(ICONV_LDFLAGS)" >> qstardict.pri; \
echo "QMAKE_LIBS+=-L$(STAGING_DIR)/usr/lib" >> qstardict.pri; \
echo "QMAKE_LIBS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib" >> qstardict.pri; \
echo "INCLUDEPATH += $(STAGING_DIR)/usr/include" >> qstardict.pri; \
echo "INCLUDEPATH += $(STAGING_DIR)/usr/include/Qt" >> qstardict.pri; \
echo "INCLUDEPATH += $(STAGING_DIR)/usr/include/QtGui" >> qstardict.pri; \
echo "INCLUDEPATH += $(STAGING_DIR)/usr/include/QtCore" >> qstardict.pri; \
echo "INCLUDEPATH += $(STAGING_DIR)/usr/include/QtNetwork" >> qstardict.pri; \
echo "INCLUDEPATH += $(STAGING_DIR)/usr/include/QtXml" >> qstardict.pri; \
)
endef

define Build/Configure
	$(call Build/Configure/Qmake,qstardict)
endef

define Package/qstardict/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib/qstardict/plugins
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/qstardict/qstardict $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/plugins/stardict/libstardict.so $(1)/usr/lib/qstardict/plugins
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/plugins/web/libweb.so $(1)/usr/lib/qstardict/plugins
endef

$(eval $(call BuildPackage,qstardict))
