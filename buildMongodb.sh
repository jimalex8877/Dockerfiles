#!/usr/bin/env bash

MONGO_MAJOR=4.2
MONGO_VERSION=4.2.7

docker build mongodb/ \
	--build-arg MONGO_MAJOR=$MONGO_MAJOR \
	--build-arg MONGO_VERSION=$MONGO_VERSION \
	-t changmingjiang/mongodb:latest

docker tag changmingjiang/mongodb:latest changmingjiang/mongodb:$MONGO_VERSION

docker push changmingjiang/mongodb:latest && docker push changmingjiang/mongodb:$MONGO_VERSION
