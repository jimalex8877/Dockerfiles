#!/usr/bin/env bash

docker run --restart=always -d --name openresty \
	\
	--expose 80 -p 8080:80 \
	--expose 443 -p 443:443 \
	\
	-v /opt/openresty/logs/:/usr/local/openresty/nginx/logs/ \
	-v /opt/openresty/conf/:/usr/local/openresty/nginx/conf/ \
	-v /opt/openresty/auth_lua/:/usr/local/openresty/auth_lua \
	\
	changmingjiang/openresty:latest