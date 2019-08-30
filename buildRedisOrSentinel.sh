#!/usr/bin/env bash
docker build redis/ --build-arg "HTTPS_PROXY=http://10.2.239.216:1087" -t changmingjiang/redis:latest
docker build redis-sentinel/ -t changmingjiang/redis-sentinel:latest

docker tag changmingjiang/redis:latest changmingjiang/redis:5.0.5
docker tag changmingjiang/redis-sentinel:latest changmingjiang/redis-sentinel:5.0.5
