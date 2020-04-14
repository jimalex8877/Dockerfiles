#!/usr/bin/env bash

PG_MAJOR=12
PG_VERSION=12.2
PG_REVISED_VERSION=2.pgdg100+1

docker build postgresql/ \
	--build-arg PG_MAJOR=$PG_MAJOR \
	--build-arg PG_VERSION=${PG_VERSION}-${PG_REVISED_VERSION} \
	-t changmingjiang/postgres:latest

docker tag changmingjiang/postgres:latest changmingjiang/postgres:$PG_VERSION

docker push changmingjiang/postgres:latest && docker push changmingjiang/postgres:$PG_VERSION
