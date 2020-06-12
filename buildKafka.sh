#!/usr/bin/env bash

KAFKA_VERSION=2.5.0
SCALA_VERSION=2.13

docker build kafka/ \
	--build-arg KAFKA_VERSION=$KAFKA_VERSION \
	--build-arg SCALA_VERSION=$SCALA_VERSION \
	-t changmingjiang/kafka:latest

docker tag changmingjiang/kafka:latest changmingjiang/kafka:$KAFKA_VERSION

docker push changmingjiang/kafka:latest && docker push changmingjiang/kafka:latest
