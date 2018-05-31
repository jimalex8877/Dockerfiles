#!/usr/bin/env bash
docker build redis/ -t changmingjiang/redis:latest
docker build redis-sentinel/ -t changmingjiang/redis-sentinel:latest
