#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default language
sed -i "s/ +@LUCI_LANG_zh-cn//g" package/lean/default-settings/Makefile
sed -i "/zh-cn/d" package/lean/default-settings/Makefile
sed -i "s/'zh-cn'/'en'/g" feeds/luci/luci.mk

# Modify default theme
sed -i 's/Bootstrap/Argon/g' package/feeds/luci/luci/Makefile
sed -i 's/bootstrap/argon/g' package/feeds/luci/luci/Makefile

# Install argon theme
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
