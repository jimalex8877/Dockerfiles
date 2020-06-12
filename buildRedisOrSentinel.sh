#!/usr/bin/env bash

REDIS_VERSION=5.0.9
REDIS_DOWNLOAD_SHA=53d0ae164cd33536c3d4b720ae9a128ea6166ebf04ff1add3b85f1242090cb85

docker build redis/ -t changmingjiang/redis:latest \
	--build-arg REDIS_VERSION=$REDIS_VERSION \
	--build-arg REDIS_DOWNLOAD_SHA=$REDIS_DOWNLOAD_SHA
docker build redis-sentinel/ -t changmingjiang/redis-sentinel:latest

docker tag changmingjiang/redis:latest changmingjiang/redis:$REDIS_VERSION
docker tag changmingjiang/redis-sentinel:latest changmingjiang/redis-sentinel:$REDIS_VERSION

docker push changmingjiang/redis:latest && docker push changmingjiang/redis:$REDIS_VERSION
docker push changmingjiang/redis-sentinel:latest && docker push changmingjiang/redis-sentinel:$REDIS_VERSION
