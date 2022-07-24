#!/usr/bin/env bash

# https://github.com/sonatype/docker-nexus3/blob/master/Dockerfile

NEXUS_VERSION=3.40.1
NEXUS_REVISED_VERSION=01
NEXUS_DOWNLOAD_SHA256_HASH=97f4e847e5c2ba714b09456f9fb5f449c7e89b2f0a2b8c175f36cc31f345774e

docker build nexus/ \
	--build-arg NEXUS_VERSION=${NEXUS_VERSION}-${NEXUS_REVISED_VERSION} \
	--build-arg NEXUS_DOWNLOAD_SHA256_HASH=$NEXUS_DOWNLOAD_SHA256_HASH \
	--platform=linux/amd64 \
	-t changmingjiang/nexus:latest

docker tag changmingjiang/nexus:latest changmingjiang/nexus:$NEXUS_VERSION

docker push changmingjiang/nexus:latest && docker push changmingjiang/nexus:$NEXUS_VERSION
