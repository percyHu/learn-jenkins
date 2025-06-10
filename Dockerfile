# 基础镜像 - 使用轻量级的 OpenJDK 镜像（Java 17，如果你的项目用的 Java 是其他版本，请更换）
FROM docker.io/library/openjdk:17-jdk-slim

# 设置工作目录
WORKDIR /app

# 将应用代码 JAR 文件复制到容器内
# 假设你构建后的 JAR 文件位于 Gradle 输出的 build/libs 目录下，替换 'your-app.jar' 为实际的构建文件名
COPY build/libs/*-SNAPSHOT.jar /app/app.jar

# 暴露容器内服务的端口（这里假设应用监听在 8989 端口）
EXPOSE 8989

# 配置启动命令，运行 Spring Boot 应用（或标准的 Java 应用）
ENTRYPOINT ["java", "-jar", "/app/app.jar"]