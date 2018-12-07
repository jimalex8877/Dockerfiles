#!/usr/bin/env bash

mkdir -p `pwd`/data `pwd`/config
docker run --restart=always --net=host -d --name consul \
	--hostname=consul-server-1 \
	-v `pwd`:/opt/consul \
	changmingjiang/consul:latest
