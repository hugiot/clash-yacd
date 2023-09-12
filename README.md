# clash-yacd

clash + yacd UI for linux

## 快速开始

1. 执行安装脚本

```bash
sudo sh -c "$(wget https://raw.githubusercontent.com/hugiot/clash-yacd/main/install.sh -O -)"
```

2. 修改配置

> 提示：仅替换待替换部分，其他部分请勿修改

```bash
sudo vi /opt/clash/config/config.yaml

# 内容如下
port: 7890
socks-port: 7891
redir-port: 7892
allow-lan: true
mode: rule
log-level: silent
external-controller: 127.0.0.1:9090
secret: ''
external-ui: /opt/clash/web

# 待替换部分
proxies:
proxy-groups:
rules:
```

3. 重启服务

```bash
sudo systemctl restart clash
```

4. 访问

通过浏览器访问：http://127.0.0.1:9090/ui

## 高级

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