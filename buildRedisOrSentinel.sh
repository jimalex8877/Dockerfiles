#!/usr/bin/env bash
docker build redis/ -t changmingjiang/redis:latest \
	--build-arg HTTPS_PROXY=http://10.1.226.187:1087 \
	--build-arg REDIS_VERSION=5.0.6 \
	--build-arg REDIS_DOWNLOAD_SHA=6624841267e142c5d5d5be292d705f8fb6070677687c5aad1645421a936d22b3
docker build redis-sentinel/ -t changmingjiang/redis-sentinel:latest

docker tag changmingjiang/redis:latest changmingjiang/redis:5.0.6
docker tag changmingjiang/redis-sentinel:latest changmingjiang/redis-sentinel:5.0.6
