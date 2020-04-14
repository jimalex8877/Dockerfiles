#!/usr/bin/env bash

LocaleIp=`ip addr show en0|grep 'inet '|awk '{print $2}'|awk -F/ '{print $1}'`

REDIS_VERSION=5.0.8
REDIS_DOWNLOAD_SHA=f3c7eac42f433326a8d981b50dba0169fdfaf46abb23fcda2f933a7552ee4ed7

docker build redis/ -t changmingjiang/redis:latest \
	#--build-arg HTTPS_PROXY=http://$LocaleIp:1087 \
	--build-arg REDIS_VERSION=$REDIS_VERSION \
	--build-arg REDIS_DOWNLOAD_SHA=$REDIS_DOWNLOAD_SHA
docker build redis-sentinel/ -t changmingjiang/redis-sentinel:latest

docker tag changmingjiang/redis:latest changmingjiang/redis:$REDIS_VERSION
docker tag changmingjiang/redis-sentinel:latest changmingjiang/redis-sentinel:$REDIS_VERSION

docker push changmingjiang/redis:latest && docker push changmingjiang/redis:$REDIS_VERSION
docker push changmingjiang/redis-sentinel:latest && docker push changmingjiang/redis-sentinel:$REDIS_VERSION
