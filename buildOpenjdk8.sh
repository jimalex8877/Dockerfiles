#!/usr/bin/env bash

# https://github.com/adoptium/containers/blob/main/8/jre/centos/Dockerfile.releases.full
# https://github.com/adoptium/temurin8-binaries/releases
# $(dpkg --print-architecture)  if amd64 ARCH=x64  elseif arm64 ARCH=aarch64

JAVA_VERSION=8u345
JAVA_REVISED_VERSION=b01
JAVA_SUPERSET=jre
ARCH=aarch64
DOWNLOAD_URL=https://github.com/adoptium/temurin8-binaries/releases/download/jdk${JAVA_VERSION}-${JAVA_REVISED_VERSION}/OpenJDK8U-${JAVA_SUPERSET}_${ARCH}_linux_hotspot_${JAVA_VERSION}${JAVA_REVISED_VERSION}.tar.gz
JAVA_BINARY_ESUM=65b8bd74382d6514d2458ff4375468651791a55a186a5bffe0803204801e9c94

docker build openjdk/8/ \
  --build-arg JAVA_BINARY_ESUM=$JAVA_BINARY_ESUM \
  --build-arg DOWNLOAD_URL=$DOWNLOAD_URL \
	-t changmingjiang/openjdk-8-jre:latest

docker tag changmingjiang/openjdk-8-jre:latest changmingjiang/openjdk-8-jre:$JAVA_VERSION

#docker push changmingjiang/openjdk-8-jre:latest && docker push changmingjiang/openjdk-8-jre:$JAVA_VERSION