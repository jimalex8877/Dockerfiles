#!/usr/bin/env bash

NGINX_VERSION=1.18.0
NJS_VERSION=0.4.0
PKG_RELEASE=1~buster

docker build nginx/ \
	--build-arg NGINX_VERSION=$NGINX_VERSION \
	--build-arg NJS_VERSION=$NJS_VERSION \
	--build-arg PKG_RELEASE=$PKG_RELEASE \
	-t changmingjiang/nginx:latest

docker tag changmingjiang/nginx:latest changmingjiang/nginx:$NGINX_VERSION

docker push changmingjiang/nginx:latest && docker push changmingjiang/nginx:$NGINX_VERSION
