#
# Copyright (C) 2006-2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=clatun
PKG_VERSION:=1.0.0
PKG_RELEASE:=$(AUTORELEASE)
PKG_LICENSE:=GPLv2
PKG_MAINTAINER:=Youyuan <youyuanluo@126.com>

include $(INCLUDE_DIR)/package.mk

define Package/clatun
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Policy-Based Routing for Clash
  DEPENDS:=+ip6tables-mod-nat +kmod-tun
  PKGARCH:=all
endef

define Package/clatun/description
This service allows policy-based routing for clash tun interface.
endef

define Package/clatun/conffiles
/etc/config/clatun
endef

define Build/Compile
endef

define Package/clatun/install
	$(INSTALL_DIR) $(1)/etc/init.d $(1)/etc/config $(1)/etc/hotplug.d/net
	$(INSTALL_BIN) ./files/clatun.init $(1)/etc/init.d/clatun
	$(INSTALL_CONF) ./files/clatun.config $(1)/etc/config/clatun
	$(INSTALL_DATA) ./files/clatun.hotplug $(1)/etc/hotplug.d/net/70-clatun
endef

$(eval $(call BuildPackage,clatun))