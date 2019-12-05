#!/usr/bin/env bash

NEXUS_VERSION=3.19.1
NEXUS_REVISED_VERSION=01
NEXUS_DOWNLOAD_SHA256_HASH=7a2e62848abeb047c99e114b3613d29b4afbd635b03a19842efdcd6b6cb95f4e

docker build nexus/ \
	--build-arg HTTPS_PROXY=http://10.1.226.187:1087 \
	--build-arg NEXUS_VERSION=${NEXUS_VERSION}-${NEXUS_REVISED_VERSION} \
	--build-arg NEXUS_DOWNLOAD_SHA256_HASH=$NEXUS_DOWNLOAD_SHA256_HASH \
	-t changmingjiang/nexus:latest

docker tag changmingjiang/nexus:latest changmingjiang/nexus:$NEXUS_VERSION

docker push changmingjiang/nexus:latest && docker push changmingjiang/nexus:$NEXUS_VERSION
