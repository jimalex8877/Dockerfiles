#!/usr/bin/env bash
docker build postgresql/ -t changmingjiang/postgres:latest

docker tag changmingjiang/postgres:latest changmingjiang/postgres:11