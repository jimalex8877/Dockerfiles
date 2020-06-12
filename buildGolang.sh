#!/usr/bin/env bash

GOLANG_VERSION=1.14.4
GOLANG_SHA256=aed845e4185a0b2a3c3d5e1d0a35491702c55889192bb9c30e67a3de6849c067

docker build golang/ \
	--build-arg GOLANG_VERSION=$GOLANG_VERSION \
	--build-arg GOLANG_SHA256=$GOLANG_SHA256 \
	-t changmingjiang/golang:latest

docker tag changmingjiang/golang:latest changmingjiang/golang:$GOLANG_VERSION
