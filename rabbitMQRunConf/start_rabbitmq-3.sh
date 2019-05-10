#!/usr/bin/env bash

mkdir -p `pwd`/data
docker run --restart=always --net=host -d --name rabbitmq \
	--hostname=rabbitmq-3 \
	--add-host=rabbitmq-1:10.2.239.174 \
	--add-host=rabbitmq-2:10.2.239.154 \
	-v `pwd`/data:/opt/rabbitmq \
	\
	-e ERLANG_COOKIE=NJVHEGOSXXNVRFHCREXL \
	\
	-e MANAGEMENT_LISTENER_SSL=false \
	-e NET_TICKTIME=120 \
	-e RABBIT_USER=rabbitmq \
	-e RABBIT_USER_PASSWORD=rabbitmq1234 \
	-e JOIN_CLUSTER_NODE_RAM=rabbit@rabbitmq-1 \
	\
	changmingjiang/rabbitmq:latest
