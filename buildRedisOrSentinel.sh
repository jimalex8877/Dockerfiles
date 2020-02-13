#!/usr/bin/env bash
REDIS_VERSION=5.0.7
REDIS_DOWNLOAD_SHA=61db74eabf6801f057fd24b590232f2f337d422280fd19486eca03be87d3a82b
docker build redis/ -t changmingjiang/redis:latest \
	--build-arg HTTPS_PROXY=http://192.168.1.101:1087 \
	--build-arg REDIS_VERSION=$REDIS_VERSION \
	--build-arg REDIS_DOWNLOAD_SHA=$REDIS_DOWNLOAD_SHA
docker build redis-sentinel/ -t changmingjiang/redis-sentinel:latest

docker tag changmingjiang/redis:latest changmingjiang/redis:$REDIS_VERSION
docker tag changmingjiang/redis-sentinel:latest changmingjiang/redis-sentinel:$REDIS_VERSION

docker push changmingjiang/redis:latest && docker push changmingjiang/redis:$REDIS_VERSION
docker push changmingjiang/redis-sentinel:latest && docker push changmingjiang/redis-sentinel:$REDIS_VERSION
