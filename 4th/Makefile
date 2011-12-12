#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk
## Nombre del paquete
PKG_NAME:=4th
## version del programa que vamos incluir en el paquete
PKG_VERSION:=3.61.3
## numero de version del paquete 
PKG_RELEASE:=4
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-nano.tar.gz
##Url donde se encuetra el el codigo fuente
PKG_SOURCE_URL:=http://4th.googlecode.com/files/
## programa con el que descomprimir el codigo fuente

include $(INCLUDE_DIR)/package.mk
#Definicion del paquet Titulo, seccion, categoria, la url del proyecto,
#esto se usa para generar el ipkg y para incluirlo en el menuconfig
define Package/4th
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	TITLE:=4th
	SECTION:=Programming
	CATEGORY:=prog
	URL:=http://thebeez.home.xs4all.nl/4tH/
endef
#El directorio donde extraeremos los fuentes y realizaremos la compilacion
#BUILD_DIR es una variable de etorno de OpenWrt es donde descomprimen/compilan los paquetes
PKG_BUILD_DIR:=$(BUILD_DIR)/4th-$(PKG_VERSION)
#Descripcion larga del programa
define Package/4th/description
4th forth compiler
endef

MAKE_VARS+=LIBRARIES="${PKG_INSTALL_DIR}/usr/lib" BINARIES="${PKG_INSTALL_DIR}/usr/bin"
MAKE_FLAGS+=-C $(PKG_BUILD_DIR)/sources -f Makefile.NAN

#Definimos donde se copiaran los binarios y las librerias cuando queramos instalarlo,
#emacs genera el binario en el directorio src
define Package/4th/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sources/4th $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sources/4tsh $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sources/pp4th $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/sources/lib4th.a $(1)/usr/lib/
endef
#Instrucion final para construir el paquete.
$(eval $(call BuildPackage,4th))
