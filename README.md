# clash-yacd

clash + yacd UI

## 快速开始

1. 下载最新压缩包

```bash
sudo wget https://github.com/hugiot/clash-yacd/releases/download/v1.18.0/clash-yacd.zip
```


2. 解压

```bash
sudo unzip clash-yacd.zip -d /opt/clash
```

3. 修改配置

> 注意：UI 相关配置
> * external-controller: 127.0.0.1:9090
> * secret: admin
> * external-ui: /opt/clash/web

```bash
sudo vi /opt/clash/config/config.yaml

# 添加您的配置（需进行订阅地址转换）
```

4. 添加可执行权限

```bash
sudo chmod +x /opt/clash/bin/*
```

5. 添加服务

> 提示：根据系统架构选择合适的可执行文件，例如：/opt/clash/bin/clash-linux-amd64

```
sudo vi /usr/lib/systemd/system/clash.service

# 内容如下：
[Unit]
Description=clash server
After=network.target

[Service]
Type=simple
WorkingDirectory=/opt/clash/bin/
ExecStart=/opt/clash/bin/clash-linux-amd64 -d /opt/clash/config
Restart=always
RestartSec=5s
TimeoutSec=5s

[Install]
WantedBy=multi-user.target
```

6. 启动

```bash
sudo systemctl daemon-reload
sudo systemctl start clash
sudo systemctl enable clash
```

7. 访问

通过浏览器访问：http://127.0.0.1:9090/ui

## 问答

* yacd 首次访问如何添加 URL

```
API Base URL: http://127.0.0.1:9090
Secret(optional): admin
```

* 如何自定义延迟测速 URL

```
yacd -> 配置 -> 延迟测速 URL -> 例如：http://www.google.com/generate_204
```

## 历史版本

* [clash-yacd:v1.18.0]()
    * [clash:v1.18.0](https://github.com/Dreamacro/clash/releases/tag/v1.18.0)
    * [yacd:v0.3.8](https://github.com/haishanh/yacd/releases/tag/v0.3.8)
    * [Country.mmdb:202309070542](https://github.com/Loyalsoldier/geoip/releases/tag/202309070542)

## 感谢

* [clash](https://github.com/Dreamacro/clash)
* [yacd](https://github.com/haishanh/yacd)
* [geoip](https://github.com/Loyalsoldier/geoip)