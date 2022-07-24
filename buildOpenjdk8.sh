#!/usr/bin/env bash

# https://github.com/adoptium/containers/blob/main/8/jre/centos/Dockerfile.releases.full
# https://github.com/adoptium/temurin8-binaries/releases

JAVA_VERSION=8u332
JAVA_REVISED_VERSION=b09

docker build openjdk/8/ \
	--build-arg JAVA_VERSION=$JAVA_VERSION \
	--build-arg JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION \
	--build-arg JAVA_SUPERSET=jre \
	--build-arg JAVA_BINARY_ESUM=34454309b43d585047baaefc36c1850d0192cccc8b52cdc4aadb192b8e3e4c81 \
	\
	--platform=linux/amd64 \
	-t changmingjiang/openjdk-8-jre:latest

docker tag changmingjiang/openjdk-8-jre:latest changmingjiang/openjdk-8-jre:$JAVA_VERSION

docker push changmingjiang/openjdk-8-jre:latest && docker push changmingjiang/openjdk-8-jre:$JAVA_VERSION