#!/usr/bin/env bash

mkdir -p `pwd`/conf
docker run --restart=always -d --name nginx \
	--expose 80 -p 80:80 \
	--expose 443 -p 443:443 \
	-v `pwd`/conf/:/etc/nginx/conf.d/ \
	changmingjiang/nginx:latest
