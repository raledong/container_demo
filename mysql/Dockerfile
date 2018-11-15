FROM mysql:5.7
MAINTAINER Rale
# 位于docker-entrypoint-initdb.d目录中的文件会自动执行
COPY scripts/* /docker-entrypoint-initdb.d/
