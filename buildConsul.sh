#!/usr/bin/env bash
CONSUL_VERSION=1.6.3
docker build consul/ \
	--build-arg CONSUL_VERSION=$CONSUL_VERSION \
	--build-arg HTTPS_PROXY=http://192.168.1.101:1087 \
	-t changmingjiang/consul:latest

docker tag changmingjiang/consul:latest changmingjiang/consul:$CONSUL_VERSION

docker push changmingjiang/consul:latest && docker push changmingjiang/consul:$CONSUL_VERSION
