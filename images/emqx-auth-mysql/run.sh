#!/usr/bin/env bash

docker run -d \
    -p 1883:1883 -p 8083:8083 -p 8883:8883 -p 8084:8084 -p 18083:18083 \
    -e MYSQL_IP="192.168.88.139" \
    -e MYSQL_PORT="3306" \
    -e MYSQL_USERNAME="root" \
    -e MYSQL_PASSWORD=123456 \
    -e MYSQL_DATABASE="mqtt" \
    -e PASSWORD_HASH="sha256" \
    -e ACCEPTORS=64 \
    -e MAX_CONNECTIONS=1000000 \
    -e USERNAME="fangle" \
    -e PASSWORD="fangle123" \
    qiujiahong/emqx-docker:v3.0-user
  
# 参数说明
###TCP 监听器的 Acceptor 池大小，最大允许连接数
# ACCEPTORS、MAX_CONNECTIONS

## 登录web页面Dashboard的用户名密码
#USERNAME、PASSWORD