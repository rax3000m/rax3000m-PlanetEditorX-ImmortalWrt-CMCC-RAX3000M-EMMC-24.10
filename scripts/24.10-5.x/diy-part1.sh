#!/bin/bash
#
# 版权所有 (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 这是一个自由软件，遵循 MIT 许可证。
# 更多信息请见 /LICENSE 文件。
#
# https://github.com/P3TERX/Actions-OpenWrt
# 文件名: diy-part1.sh
# 描述: OpenWrt DIY 脚本第一部分 (更新 feeds 之前)


# 创建自定义 distfeeds.conf 文件
CUSTOM_DISTFEEDS_CONF="files/etc/opkg/distfeeds.conf"

# 确保 files/etc/opkg/ 目录存在
mkdir -p files/etc/opkg/

# 写入自定义 distfeeds.conf 内容
cat << EOF > "${CUSTOM_DISTFEEDS_CONF}"
src/gz immortalwrt_base https://mirrors.vsean.net/openwrt/releases/24.10-SNAPSHOT/packages/aarch64_cortex-a53/base
src/gz immortalwrt_luci https://mirrors.vsean.net/openwrt/releases/24.10-SNAPSHOT/packages/aarch64_cortex-a53/luci
src/gz immortalwrt_packages https://mirrors.vsean.net/openwrt/releases/24.10-SNAPSHOT/packages/aarch64_cortex-a53/packages
src/gz immortalwrt_routing https://mirrors.vsean.net/openwrt/releases/24.10-SNAPSHOT/packages/aarch64_cortex-a53/routing
src/gz immortalwrt_telephony https://mirrors.vsean.net/openwrt/releases/24.10-SNAPSHOT/packages/aarch64_cortex-a53/telephony
EOF

# 检查是否成功创建 distfeeds.conf
if [ -f "${CUSTOM_DISTFEEDS_CONF}" ]; then
  echo "自定义 distfeeds.conf 已成功创建在 ${CUSTOM_DISTFEEDS_CONF}"
else
  echo "错误：无法创建 distfeeds.conf"
  exit 1
fi
