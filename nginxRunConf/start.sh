#!/usr/bin/env bash

mkdir -p `pwd`/conf
docker run --restart=always --net=host -d --name nginx \
	-v `pwd`/conf/:/etc/nginx/conf.d/ \
	-v `pwd`/logs/:/etc/nginx/logs/ \
	changmingjiang/nginx:latest
