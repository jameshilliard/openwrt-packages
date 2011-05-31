# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=husky
PKG_VERSION:=1.9-20110421
PKG_RELEASE:=1

PKG_SOURCE:=husky-all-1.9-source-20110421.tgz
PKG_SOURCE_URL:=@SF/husky/husky/1.9-current
PKG_MD5SUM:=bb2df9a3314f3a30d59bc2b88220ee5c

include $(INCLUDE_DIR)/package.mk

PKG_UNPACK:=gzip -dc $(DL_DIR)/$(PKG_SOURCE) | $(TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xf -

define Package/husky
    TITLE:=Bunch of software for fidonet
    SECTION:=utilities
    CATEGORY:=Utilities
    URL:=http://sourceforge.net/projects/husky/
endef

define Package/husky/description
    husky is a bunch of os-independent software for fidonet. It consitsts of tosser hpt, fileechoprocessor htick, message editor msged TE, libraries fidoconfig, smapi etc.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	(\
		cd $(PKG_BUILD_DIR);\
		$(CP) huskybse/huskymak.cfg huskymak.cfg;\
	)
endef

define Build/Compile
	@echo "Building huskylib.."
	$(MAKE_VARS) $(MAKE) -C $(PKG_BUILD_DIR)/huskylib $(MAKE_FLAGS)
	@echo "Done building huskylib."
	@echo "Building smapi.."
	$(MAKE_VARS) $(MAKE) -C $(PKG_BUILD_DIR)/smapi $(MAKE_FLAGS) OPTCFLAGS+="-c -I../huskylib -fPIC" LIBS+="-L../huskylib"
	@echo "Done building smapi."
	@echo "Building fidoconf.."
	$(MAKE_VARS) $(MAKE) -C $(PKG_BUILD_DIR)/fidoconf $(MAKE_FLAGS) OPTCFLAGS+="-c -I../huskylib -I../smapi -fPIC" LIBS+="-L../huskylib -lhusky"
	@echo "Done building fidoconf."
	@echo "Building areafix.."
	$(MAKE_VARS) $(MAKE) -C $(PKG_BUILD_DIR)/areafix $(MAKE_FLAGS) OPTCFLAGS+="-c -I../huskylib -I../fidoconf -I../smapi -fPIC" LIBS+="-L../huskylib -L../fidoconf -L../smapi"
	@echo "Done building areafix."
	@echo "Building hpt.."
	$(MAKE_VARS) $(MAKE) -C $(PKG_BUILD_DIR)/hpt $(MAKE_FLAGS) OPTCFLAGS+="-c -I../huskylib -I../fidoconf -I../smapi -I../areafix -fPIC" LIBS+="-L../huskylib -L../fidoconf -L../smapi -L../areafix -lhusky -lfidoconfig -lsmapi -lareafix"
	@echo "Done building hpt."
	@echo "Building htick.."
	$(MAKE_VARS) $(MAKE) -C $(PKG_BUILD_DIR)/htick $(MAKE_FLAGS) OPTCFLAGS+="-c -I../huskylib -I../smapi -I../fidoconf -I../areafix -fPIC" LIBS+="-L../huskylib -L../smapi -L../fidoconf -L../areafix -lhusky -lfidoconfig -lsmapi -lareafix"
	@echo "Done building htick."
endef

define Package/husky/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/huskylib/*.so* $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/smapi/*.so* $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/fidoconf/*.so* $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/areafix/*.so* $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hpt/{hptlink,hpttree,pktinfo,tpkt,txt2pkt} $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/htick/htick $(1)/usr/bin
endef

$(eval $(call BuildPackage,husky))
