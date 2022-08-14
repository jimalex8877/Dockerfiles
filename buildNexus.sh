#!/usr/bin/env bash

# https://github.com/sonatype/docker-nexus3/blob/master/Dockerfile

NEXUS_VERSION=3.41.0
NEXUS_REVISED_VERSION=01
NEXUS_DOWNLOAD_SHA256_HASH=ce265e627a665f9e833bf9c6e15a58c739882eb753863062f9e42e83e6f0d844

docker build nexus/ \
	--build-arg NEXUS_VERSION=${NEXUS_VERSION}-${NEXUS_REVISED_VERSION} \
	--build-arg NEXUS_DOWNLOAD_SHA256_HASH=$NEXUS_DOWNLOAD_SHA256_HASH \
	-t changmingjiang/nexus:latest

docker tag changmingjiang/nexus:latest changmingjiang/nexus:$NEXUS_VERSION

#docker push changmingjiang/nexus:latest && docker push changmingjiang/nexus:$NEXUS_VERSION
