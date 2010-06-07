# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk
##Nombre del paquete
PKG_NAME:=4th
## version del programa que vamos incluir en el paquete
PKG_VERSION:=3.60.1-unix
## numero de version del paquete 
PKG_RELEASE:=3
##Nombre del archivo con el codigo fuente usamos las variables que acabamos de definir http://www.xs4all.nl/~thebeez/4tH/4th-3.60.1-unix.tar.gz
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
##Url donde se encuetra el el codigo fuente
PKG_SOURCE_URL:=http://www.xs4all.nl/~thebeez/4tH/
## programa con el que descomprimir el codigo fuente
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk
#Definicion del paquet Titulo, seccion, categoria, la url del proyecto,
#esto se usa para generar el ipkg y para incluirlo en el menuconfig
define Package/4th
	TITLE:=4th
	SECTION:=Programming
	CATEGORY:=prog
	DEPENDS:=@BROKEN
	URL:=http://www.xs4all.nl/~thebeez/4tH/
endef
#El directorio donde extraeremos los fuentes y realizaremos la compilacion
#BUILD_DIR es una variable de etorno de OpenWrt es donde descomprimen/compilan los paquetes
PKG_BUILD_DIR:=$(BUILD_DIR)/4th-$(PKG_VERSION)
#Descripcion larga del programa
define Package/4th/description
4th forth compiler
endef
#Si no hay que darles instrucciones especiales al ./configure esto se queda tal como esta.

define Build/Prepare
	#PKG_BUILD_DIR=$(PKG_BUILD_DIR)/src
	$(call Build/Prepare/Default)
	$(CP) $(PKG_BUILD_DIR)/sources/* $(PKG_BUILD_DIR)/
endef

define Build/Configure
	$(call Build/Configure/Default)
endef
#Definimos donde se copiaran los binarios y las librerias cuando queramos instalarlo,
#emacs genera el binario en el directorio src
define Package/4th/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/4th $(1)/usr/sbin/
endef
#Instrucion final para construir el paquete.
$(eval $(call BuildPackage,4th))
