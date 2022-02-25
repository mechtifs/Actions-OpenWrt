#!/bin/sh
mkdir -p feeds/packages/lang/python/python-pytelegramapi

cat << EOF0 > feeds/packages/lang/python/python-pytelegramapi/Makefile
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include \$(TOPDIR)/rules.mk

PKG_NAME:=python-pytelegramapi
PKG_VERSION:=4.4.0
PKG_RELEASE:=1

PYPI_NAME:=pyTelegramBotAPI
PKG_HASH:=e6f22356abebffe0a893dcf72fe09a0c8bdedad6f498c55a30c3dd32ce488e6a

PKG_MAINTAINER:=eternnoir <eternnoir@gmail.com>
PKG_LICENSE:=GPL2
PKG_LICENSE_FILES:=LICENSE

include ../pypi.mk
include \$(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-pytelegramapi
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Python Telegram bot api
  URL:=https://github.com/eternnoir/pyTelegramBotAPI
  DEPENDS:= \\
	+python3-pillow
endef

define Package/python3-pytelegramapi/description
  A simple, but extensible Python implementation for the Telegram Bot API.
  Supports both sync and async ways.
endef

\$(eval \$(call Py3Package,python3-pytelegramapi))
\$(eval \$(call BuildPackage,python3-pytelegramapi))
EOF0

cat << EOF1 >> feeds/packages.index
Source-Makefile: feeds/packages/lang/python/python-pytelegramapi/Makefile

Package: python3-pytelegramapi
Submenu: Python
Version: 4.4.0-1
Depends: +libc +USE_GLIBC:librt +USE_GLIBC:libpthread +python3-pillow
Conflicts: 
Menu-Depends: 
Provides: 
Section: lang
Category: Languages
Repository: base
Title: Python Telegram bot api
Maintainer: eternnoir <eternnoir@gmail.com>
Source: pyTelegramBotAPI-4.4.0.tar.gz 
License: GPL2
LicenseFiles: LICENSE
Type: ipkg
Description:   A simple, but extensible Python implementation for the Telegram Bot API.
  Supports both sync and async ways.
https://github.com/Anorov/PySocks
eternnoir <eternnoir@gmail.com>
@@
EOF1
