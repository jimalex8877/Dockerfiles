#!/usr/bin/env bash

DOCKER_CE_VERSION=5:19.03.5~3-0~debian-buster

docker build docker/ \
	--build-arg DOCKER_CE_VERSION=$DOCKER_CE_VERSION \
	-t changmingjiang/docker:latest
docker tag changmingjiang/docker:latest changmingjiang/docker:19.03.5