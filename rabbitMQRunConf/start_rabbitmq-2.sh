#!/usr/bin/env bash

mkdir -p `pwd`/data
docker run --restart=always -d --name rabbitmq \
	--hostname=rabbitmq-2 \
	--add-host=rabbitmq-1:10.2.236.234 \
	--add-host=rabbitmq-3:10.2.236.234 \
	-p 4369:4369 -p 5672:5672 -p 15672:15672 -p 25672:25672 \
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
