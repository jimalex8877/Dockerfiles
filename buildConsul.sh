#!/usr/bin/env bash
LocaleIp=`ip addr show en0|grep 'inet '|awk '{print $2}'|awk -F/ '{print $1}'`

CONSUL_VERSION=1.7.4

docker build consul/ \
	--build-arg CONSUL_VERSION=$CONSUL_VERSION \
	--build-arg HTTPS_PROXY=http://$LocaleIp:1087 \
	-t changmingjiang/consul:latest

docker tag changmingjiang/consul:latest changmingjiang/consul:$CONSUL_VERSION

docker push changmingjiang/consul:latest && docker push changmingjiang/consul:$CONSUL_VERSION
