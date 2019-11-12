#!/usr/bin/env bash

docker run --restart=always -d --name nginx \
	--expose 80 -p 80:80 \
	--expose 443 -p 443:443 \
    -v `pwd`/config:/opt/nginx \
    changmingjiang/nginx:latest
