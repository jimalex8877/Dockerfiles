#!/usr/bin/env bash

# https://github.com/adoptium/containers/blob/main/18/jre/centos/Dockerfile.releases.full
# https://github.com/adoptium/temurin18-binaries/releases
# $(dpkg --print-architecture)  if amd64 ARCH=x64  elseif arm64 ARCH=aarch64

JAVA_VERSION=18.0.2
JAVA_REVISED_VERSION=9
JAVA_SUPERSET=jre
ARCH=aarch64
DOWNLOAD_URL=https://github.com/adoptium/temurin18-binaries/releases/download/jdk-${JAVA_VERSION}+${JAVA_REVISED_VERSION}/OpenJDK18U-${JAVA_SUPERSET}_${ARCH}_linux_hotspot_${JAVA_VERSION}_${JAVA_REVISED_VERSION}.tar.gz
JAVA_BINARY_ESUM=b95934d11105c5a99a8bf087fdfc28a8a644b4265b6cf7518d70404a4dc82da2

docker build openjdk/18/ \
	--build-arg JAVA_BINARY_ESUM=$JAVA_BINARY_ESUM \
	--build-arg DOWNLOAD_URL=$DOWNLOAD_URL \
	\
	-t changmingjiang/openjdk-18-jre:latest

docker tag changmingjiang/openjdk-18-jre:latest changmingjiang/openjdk-18-jre:$JAVA_VERSION

#docker push changmingjiang/openjdk-18-jre:latest && docker push changmingjiang/openjdk-18-jre:$JAVA_VERSION