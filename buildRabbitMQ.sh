#!/usr/bin/env bash
RABBITMQ_VERSION=3.8.2
RABBITMQ_REVISED_VERSION=1
docker build rabbitMQ/ \
	--build-arg HTTPS_PROXY=http://10.1.226.187:1087 \
	--build-arg RABBITMQ_VERSION=${RABBITMQ_VERSION}-${RABBITMQ_REVISED_VERSION} \
	-t changmingjiang/rabbitmq:latest

docker tag changmingjiang/rabbitmq:latest changmingjiang/rabbitmq:$RABBITMQ_VERSION

docker push changmingjiang/rabbitmq:latest && docker push changmingjiang/rabbitmq:$RABBITMQ_VERSION
