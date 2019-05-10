#!/usr/bin/env bash

mkdir -p `pwd`/data
docker run --restart=always --net=host -d --name rabbitmq \
	--hostname=rabbitmq-1 \
	--add-host=rabbitmq-2:10.2.239.154 \
	--add-host=rabbitmq-3:10.2.239.190 \
	-v `pwd`/data:/opt/rabbitmq \
	\
	-e ERLANG_COOKIE=NJVHEGOSXXNVRFHCREXL \
	\
	-e MANAGEMENT_LISTENER_SSL=false \
	-e NET_TICKTIME=120 \
	-e RABBIT_USER=rabbitmq \
	-e RABBIT_USER_PASSWORD=rabbitmq1234 \
	\
	changmingjiang/rabbitmq:latest
