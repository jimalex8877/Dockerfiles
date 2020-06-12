#!/usr/bin/env bash

NEXUS_VERSION=3.24.0
NEXUS_REVISED_VERSION=02
NEXUS_DOWNLOAD_SHA256_HASH=a2bfbc602228adeeb1a932e6e79bebea0ca2a9c1e7c86dfeeb3898aebf31f70c

docker build nexus/ \
	--build-arg NEXUS_VERSION=${NEXUS_VERSION}-${NEXUS_REVISED_VERSION} \
	--build-arg NEXUS_DOWNLOAD_SHA256_HASH=$NEXUS_DOWNLOAD_SHA256_HASH \
	-t changmingjiang/nexus:latest

docker tag changmingjiang/nexus:latest changmingjiang/nexus:$NEXUS_VERSION

docker push changmingjiang/nexus:latest && docker push changmingjiang/nexus:$NEXUS_VERSION
