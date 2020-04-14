#!/usr/bin/env bash

LocaleIp=`ip addr show en0|grep 'inet '|awk '{print $2}'|awk -F/ '{print $1}'`

NEXUS_VERSION=3.22.0
NEXUS_REVISED_VERSION=02
NEXUS_DOWNLOAD_SHA256_HASH=9fef4ee8d7423cd73d2bf3576acc22f8d1b76c9b0ff733e2d36f00b59f1b8388

docker build nexus/ \
	--build-arg HTTPS_PROXY=http://$LocaleIp:1087 \
	--build-arg NEXUS_VERSION=${NEXUS_VERSION}-${NEXUS_REVISED_VERSION} \
	--build-arg NEXUS_DOWNLOAD_SHA256_HASH=$NEXUS_DOWNLOAD_SHA256_HASH \
	-t changmingjiang/nexus:latest

docker tag changmingjiang/nexus:latest changmingjiang/nexus:$NEXUS_VERSION

docker push changmingjiang/nexus:latest && docker push changmingjiang/nexus:$NEXUS_VERSION
