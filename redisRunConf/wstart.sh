#!/usr/bin/env bash

mkdir -p `pwd`/6379
docker run --restart=always --privileged -d --name redis-6379 \
	--expose 6379 -p 6379:6379 \
	-v /`pwd`/6379:/opt/redis \
	\
	-e REDIS_PORT=6379 \
	-e REDIS_REQUIRE_PASS=alex \
	-e REDIS_MASTER_AUTH_PASS=alex \
	-e REDIS_BIND=0.0.0.0 \
	\
	changmingjiang/redis:latest
docker run --restart=always --privileged -d --name redis-sentinel-26379 \
	--expose 26379 -p 26379:26379 \
	-v /`pwd`/6379:/opt/redis \
	\
	-e SENTINEL_PORT=26379 \
	-e SENTINEL_MONITOR_IP=192.168.1.104 \
	-e SENTINEL_MONITOR_PORT=6379 \
	-e SENTINEL_AUTH_PASS=alex \
	-e SENTINEL_BIND=0.0.0.0 \
	\
	changmingjiang/redis-sentinel:latest

mkdir -p `pwd`/6380
docker run --restart=always --privileged -d --name redis-6380 \
	--expose 6380 -p 6380:6380 \
	-v /`pwd`/6380:/opt/redis \
	\
	-e REDIS_PORT=6380 \
	-e REDIS_REQUIRE_PASS=alex \
	-e REDIS_MASTER_AUTH_PASS=alex \
	-e REDIS_MASTER_IP=192.168.1.104 \
	-e REDIS_MASTER_PORT=6379 \
	-e REDIS_BIND=0.0.0.0 \
	\
	changmingjiang/redis:latest
docker run --restart=always --privileged -d --name redis-sentinel-26380 \
	--expose 26380 -p 26380:26380 \
	-v /`pwd`/6380:/opt/redis \
	\
	-e SENTINEL_PORT=26380 \
	-e SENTINEL_MONITOR_IP=192.168.1.104 \
	-e SENTINEL_MONITOR_PORT=6380 \
	-e SENTINEL_AUTH_PASS=alex \
	-e SENTINEL_BIND=0.0.0.0 \
	\
	changmingjiang/redis-sentinel:latest
