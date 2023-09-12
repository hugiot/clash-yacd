#!/bin/bash

arch=""
packageManager=""

# 获取包管理器
command -v apt > /dev/null 2>&1 && packageManager=apt || packageManager=yum

# 工具安装（wget、unzip）
echo "+----------------------------------------------------"
echo "| install wget、unzip"
echo "+----------------------------------------------------"
sleep 2s
${packageManager} -y install wget unzip

# 下载压缩包
echo "+----------------------------------------------------"
echo "| download clash-yacd.zip"
echo "+----------------------------------------------------"
sleep 2s
wget -O clash-yacd.zip https://github.com/hugiot/clash-yacd/releases/download/v1.18.0/clash-yacd.zip

# 解压
echo "+----------------------------------------------------"
echo "| unzip clash-yacd.zip"
echo "+----------------------------------------------------"
sleep 2s
unzip -o clash-yacd.zip -d /opt/clash

# 移除下载包
echo "+----------------------------------------------------"
echo "| remove clash-yacd.zip"
echo "+----------------------------------------------------"
sleep 2s
rm -rf clash-yacd.zip

# 添加可执行权限
chmod +x /opt/clash/bin/*

# 获取系统架构
case $(uname -m) in
  x86_64)
    arch=amd64
    ;;
  aarch64)
    arch=arm64
    ;;
  *)
    echo "+----------------------------------------------------"
    echo "| Error: unknown system architecture"
    echo "+----------------------------------------------------"
    exit 1
    ;;
esac

# 添加服务
echo "+----------------------------------------------------"
echo "| add clash service"
echo "+----------------------------------------------------"
sleep 2s
touch /usr/lib/systemd/system/clash.service
cat > /usr/lib/systemd/system/clash.service <<EOF
[Unit]
Description=clash server
After=network.target

[Service]
Type=simple
WorkingDirectory=/opt/clash/bin/
ExecStart=/opt/clash/bin/clash-linux-${arch} -d /opt/clash/config
Restart=always
RestartSec=5s
TimeoutSec=5s

[Install]
WantedBy=multi-user.target
EOF

# 重载服务
echo "+----------------------------------------------------"
echo "| restart clash service"
echo "+----------------------------------------------------"
sleep 2s
systemctl daemon-reload
systemctl restart clash
systemctl enable clash

echo "+----------------------------------------------------"
echo "| install success"
echo "| please visit: http://127.0.0.1:9090/ui"
echo "+----------------------------------------------------"
