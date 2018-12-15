#!/usr/bin/env bash

# 清除已有的同名容器
if [ "$(sudo docker container list -a | grep demo_db)" ]; then
    sudo docker container rm -f demo_db
fi

# 构建镜像，如果有变更并重复利用该脚本构建的话，必须使用no-cache参数关闭缓存
sudo docker build \
    -t  demo/mysql_db . \
    --no-cache

# 清除虚悬镜像
if [ "$(sudo docker images -q -f dangling=true)" ]; then
    sudo docker rmi $(docker images -q -f dangling=true)
fi

# 构建容器
sudo docker run \
    --name demo_db \
    -P \
    -d \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -v logs:/logs \
    -v data:/var/lib/mysql \
    demo/mysql_db