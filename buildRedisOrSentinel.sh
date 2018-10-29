#!/usr/bin/env bash
docker build redis/ -t changmingjiang/redis:latest
docker build redis-sentinel/ -t changmingjiang/redis-sentinel:latest

docker tag changmingjiang/redis:latest changmingjiang/redis:5.0
docker tag changmingjiang/redis-sentinel:latest changmingjiang/redis-sentinel:5.0
