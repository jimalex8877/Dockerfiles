#!/usr/bin/env bash

GOLANG_VERSION=1.13.8
GOLANG_SHA256=0567734d558aef19112f2b2873caa0c600f1b4a5827930eb5a7f35235219e9d8

docker build golang/ \
	--build-arg GOLANG_VERSION=$GOLANG_VERSION \
	--build-arg GOLANG_SHA256=$GOLANG_SHA256 \
	-t changmingjiang/golang:latest

docker tag changmingjiang/golang:latest changmingjiang/golang:$GOLANG_VERSION
