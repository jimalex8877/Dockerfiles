#!/usr/bin/env bash
docker build consul/ \
	--build-arg CONSUL_VERSION=1.6.1 \
	--build-arg HTTPS_PROXY=http://10.1.226.187:1087 \
	-t changmingjiang/consul:latest

docker tag changmingjiang/consul:latest changmingjiang/consul:1.6.1