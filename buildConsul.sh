#!/usr/bin/env bash

CONSUL_VERSION=1.8.0

docker build consul/ \
	--build-arg CONSUL_VERSION=$CONSUL_VERSION \
	-t changmingjiang/consul:latest

docker tag changmingjiang/consul:latest changmingjiang/consul:$CONSUL_VERSION

docker push changmingjiang/consul:latest && docker push changmingjiang/consul:$CONSUL_VERSION
