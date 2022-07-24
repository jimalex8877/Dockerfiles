#!/usr/bin/env bash

# https://github.com/adoptium/containers/blob/main/18/jre/centos/Dockerfile.releases.full
# https://github.com/adoptium/temurin18-binaries/releases

JAVA_VERSION=18.0.2
JAVA_REVISED_VERSION=9

docker build openjdk/18/ \
	--build-arg JAVA_VERSION=$JAVA_VERSION \
	--build-arg JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION \
	--build-arg JAVA_SUPERSET=jre \
	--build-arg JAVA_BINARY_ESUM=efcfe9206ce467a0a197463283e74621f4ba037994d29606c572766945a01a91 \
	\
	--platform=linux/amd64 \
	-t changmingjiang/openjdk-18-jre:latest

docker tag changmingjiang/openjdk-18-jre:latest changmingjiang/openjdk-18-jre:$JAVA_VERSION

docker push changmingjiang/openjdk-18-jre:latest && docker push changmingjiang/openjdk-18-jre:$JAVA_VERSION