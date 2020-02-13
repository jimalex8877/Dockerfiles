#!/usr/bin/env bash

LocaleIp=`ip addr show en0|grep 'inet '|awk '{print $2}'|awk -F/ '{print $1}'`

RABBITMQ_VERSION=3.8.2
RABBITMQ_REVISED_VERSION=1

docker build rabbitMQ/ \
	--build-arg HTTPS_PROXY=http://$LocaleIp:1087 \
	--build-arg RABBITMQ_VERSION=${RABBITMQ_VERSION}-${RABBITMQ_REVISED_VERSION} \
	-t changmingjiang/rabbitmq:latest

docker tag changmingjiang/rabbitmq:latest changmingjiang/rabbitmq:$RABBITMQ_VERSION

docker push changmingjiang/rabbitmq:latest && docker push changmingjiang/rabbitmq:$RABBITMQ_VERSION
