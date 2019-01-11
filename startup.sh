#!/usr/bin/env bash

mvn clean install dockerfile:build -Dmaven.test.skip=true

#清除当前已有的容器
CONTAINER_NAME=container_demo
CONTAINER_VERSION=3.0
CONTAINER_ALREADY_EXIST="$(docker container ls -a | grep ${CONTAINER_NAME})"
if [ "${CONTAINER_ALREADY_EXIST}" ];
then
    echo "container ${CONTAINER_NAME} already exists, it will be deleted"
    docker container stop ${CONTAINER_NAME}
    docker container rm ${CONTAINER_NAME}
    docker rmi $(docker images -q -f dangling=true)
fi

NEXUS_REPO_ADDR=10.1.1.243:18082
IMAGE_EXIST="$(docker images ls | grep ${NEXUS_REPO_ADDR}/${CONTAINER_NAME})"
if [ "${IMAGE_EXIST}" ];
then
     echo "image ${NEXUS_REPO_ADDR}/${CONTAINER_NAME} already exists"
     docker rmi ${NEXUS_REPO_ADDR}/${CONTAINER_NAME}
     docker rmi $(docker images -q -f dangling=true)
fi

docker tag demo/${CONTAINER_NAME} ${NEXUS_REPO_ADDR}/${CONTAINER_NAME}:${CONTAINER_VERSION}
docker push ${NEXUS_REPO_ADDR}/${CONTAINER_NAME}:${CONTAINER_VERSION}
#docker run \
#    --name ${CONTAINER_NAME} \
#    -d \
#    -p 8081:8081 \
#    --link=demo_db:db \
#    demo/container_demo