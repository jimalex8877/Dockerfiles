#!/usr/bin/env bash

mkdir -p `pwd`/5432/data
docker run --restart=always --expose 5432 -p 5432:5432 -d --name postgres-5432 \
    -v /`pwd`/5432/data:/opt/postgres/data \
    -e POSTGRES_PORT=5432 \
    -e POSTGRES_PASS='postgres' \
    \
    -e REPLICA_USER='replica' \
    -e REPLICA_USER_PASS='replica1234' \
    \
    -e MAX_WAL_SENDERS=32 \
    -e WAL_KEEP_SEGMENTS=20 \
    -e MAX_CONNECTIONS=500 \
    changmingjiang/postgres:latest

if [ -z "$(ls -A `pwd`/5433/data)" ]; then
	sleep 30
fi

mkdir -p `pwd`/5433/data
docker run --restart=always --expose 5433 -p 5433:5433 -d --name postgres-5433 \
    -v /`pwd`/5433/data:/opt/postgres/data \
    -e POSTGRES_PORT=5433 \
    -e POSTGRES_PASS='postgres' \
    \
    -e MASTER_HOST=192.168.1.104 \
    -e MASTER_PORT=5432 \
    -e MASTER_REPLICA_USER='replica' \
    -e MASTER_REPLICA_USER_PASS='replica1234' \
    \
    -e MAX_WAL_SENDERS=32 \
    -e WAL_KEEP_SEGMENTS=20 \
    -e MAX_CONNECTIONS=1000 \
    changmingjiang/postgres:latest
