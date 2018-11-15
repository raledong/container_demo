FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR_FILE=target/container_demo.jar
ARG DEPENDENCY=target/dependency
ARG LIB=target/lib/*
# 将jar包拷贝进来
COPY ${JAR_FILE} /app/app.jar
COPY ${LIB} /app/lib/
# 将manifest文件拷贝进来
COPY ${DEPENDENCY}/META-INF /app/META-INF
EXPOSE 8081
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app/app.jar", "--spring.profiles.active=test"]