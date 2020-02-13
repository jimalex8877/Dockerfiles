#!/usr/bin/env bash

ZOOKEEPER_VERSION=3.5.6

docker build zookeeper/ \
	--build-arg ZOOKEEPER_VERSION=$ZOOKEEPER_VERSION \
	-t changmingjiang/zookeeper:latest

docker tag changmingjiang/zookeeper:latest changmingjiang/zookeeper:$ZOOKEEPER_VERSION