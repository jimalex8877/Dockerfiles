#!/usr/bin/env bash

mkdir -p `pwd`/data
docker run --restart=always --net=host -d --name rabbitmq \
	--add-host=rabbitmq-1:192.168.1.105 \
	--add-host=rabbitmq-3:192.168.1.107 \
	-v `pwd`/data:/opt/rabbitmq \
	\
	-e ERLANG_COOKIE=NJVHEGOSXXNVRFHCREXL \
	\
	-e RABBITMQ_NODE_PORT=5672 \
	-e MANAGEMENT_LISTENER_SSL=false \
	-e RABBIT_USER=rabbitmq \
	-e RABBIT_USER_PASSWORD=rabbitmq1234 \
	-e JOIN_CLUSTER_NODE=rabbit@rabbitmq-1 \
	\
	changmingjiang/rabbitmq:latest
