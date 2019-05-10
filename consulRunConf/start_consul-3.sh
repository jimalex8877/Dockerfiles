#!/usr/bin/env bash

mkdir -p `pwd`/data
docker run --restart=always -d --net=host --name consul-server \
	--hostname=consul-server-3 \
	--add-host=consul-server-1:10.2.239.174 \
	--add-host=consul-server-2:10.2.239.154 \
	-v `pwd`/data:/opt/consul/data \
	\
	-e BOOTSTRAP_EXPECT=3 \
	-e CLIENT_ADDR="0.0.0.0" \
	-e ADVERTISE_ADDR="10.2.239.190" \
	-e BIND_ADDR="10.2.239.190" \
	-e ENABLE_SCRIPT_CHECKS=true \
	-e DNS_CONFIG_ENABLE_TRUNCATE=true \
	-e DNS_CONFIG_ONLY_PASSING=true \
	-e RETRY_JOIN='"consul-server-1","consul-server-2","consul-server-3"' \
	-e LEAVE_ON_TERMINATE=true \
	-e REJOIN_AFTER_LEAVE=true \
	-e ENCRYPT="FYXwhZg+qZqYe0u3tN3daA==" \
	-e SERVER=true \
	-e UI=true \
	-e PORTS_GRPC=8502 \
	\
	changmingjiang/consul:latest