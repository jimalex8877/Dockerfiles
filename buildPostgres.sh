#!/usr/bin/env bash

# https://github.com/docker-library/postgres/blob/master/12/bullseye/Dockerfile

PG_MAJOR=14
PG_VERSION=14.5
PG_REVISED_VERSION=1.pgdg110+1

docker build postgresql/ \
	--build-arg PG_MAJOR=$PG_MAJOR \
	--build-arg PG_VERSION=${PG_VERSION}-${PG_REVISED_VERSION} \
	-t changmingjiang/postgres:latest

docker tag changmingjiang/postgres:latest changmingjiang/postgres:$PG_VERSION

#docker push changmingjiang/postgres:latest && docker push changmingjiang/postgres:$PG_VERSION
