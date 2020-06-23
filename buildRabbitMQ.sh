#!/usr/bin/env bash

RABBITMQ_VERSION=3.8.5
RABBITMQ_REVISED_VERSION=1

docker build rabbitMQ/ \
	--build-arg RABBITMQ_VERSION=${RABBITMQ_VERSION}-${RABBITMQ_REVISED_VERSION} \
	-t changmingjiang/rabbitmq:latest

docker tag changmingjiang/rabbitmq:latest changmingjiang/rabbitmq:$RABBITMQ_VERSION

docker push changmingjiang/rabbitmq:latest && docker push changmingjiang/rabbitmq:$RABBITMQ_VERSION
