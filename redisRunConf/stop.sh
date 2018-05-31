#!/usr/bin/env bash
docker kill redis-6379
docker kill redis-6380

docker rm redis-6379
docker rm redis-6380

docker kill redis-sentinel-26379
docker kill redis-sentinel-26380

docker rm redis-sentinel-26379
docker rm redis-sentinel-26380