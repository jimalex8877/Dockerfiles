#!/usr/bin/env bash
docker build nginx/ -t changmingjiang/nginx:latest

docker tag changmingjiang/nginx:latest changmingjiang/nginx:3.18.0-01