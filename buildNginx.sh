#!/usr/bin/env bash

# https://github.com/nginxinc/docker-nginx/blob/master/stable/debian/Dockerfile

NGINX_VERSION=1.20.2
NJS_VERSION=0.7.3
PKG_RELEASE=1~bullseye

chmod +x nginx/docker-entrypoint.sh

docker build nginx/ \
	--build-arg NGINX_VERSION=$NGINX_VERSION \
	--build-arg NJS_VERSION=$NJS_VERSION \
	--build-arg PKG_RELEASE=$PKG_RELEASE \
	-t changmingjiang/nginx:latest

docker tag changmingjiang/nginx:latest changmingjiang/nginx:$NGINX_VERSION

#docker push changmingjiang/nginx:latest && docker push changmingjiang/nginx:$NGINX_VERSION
