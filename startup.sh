#!/usr/bin/env bash

mvn clean install dockerfile:build -Dmaven.test.skip=true

CONTAINER_NAME=demo
CONTAINER_ALREADY_EXIST="$(docker container ls -a | grep ${CONTAINER_NAME})"
if [ "${CONTAINER_ALREADY_EXIST}" ];
then
    echo "container ${CONTAINER_NAME} already exists, it will be deleted"
    docker container stop ${CONTAINER_NAME}
    docker container rm ${CONTAINER_NAME}
    docker rmi $(docker images -q -f dangling=true)
fi
docker run \
    --name ${CONTAINER_NAME} \
    -d \
    -p 8081:8081 \
    --link=demo_db:db \
    demo/container_demo