#!/usr/bin/env bash

LocaleIp=`ip addr show en0|grep 'inet '|awk '{print $2}'|awk -F/ '{print $1}'`

NEXUS_VERSION=3.20.1
NEXUS_REVISED_VERSION=01
NEXUS_DOWNLOAD_SHA256_HASH=fba9953e70e2d53262d2bd953e5fbab3e44cf2965467df14a665b0752de30e51

docker build nexus/ \
	--build-arg HTTPS_PROXY=http://$LocaleIp:1087 \
	--build-arg NEXUS_VERSION=${NEXUS_VERSION}-${NEXUS_REVISED_VERSION} \
	--build-arg NEXUS_DOWNLOAD_SHA256_HASH=$NEXUS_DOWNLOAD_SHA256_HASH \
	-t changmingjiang/nexus:latest

docker tag changmingjiang/nexus:latest changmingjiang/nexus:$NEXUS_VERSION

docker push changmingjiang/nexus:latest && docker push changmingjiang/nexus:$NEXUS_VERSION
