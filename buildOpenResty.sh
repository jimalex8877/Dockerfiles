#!/usr/bin/env bash
docker build openResty/ -t changmingjiang/openresty:latest

docker tag changmingjiang/openresty:latest changmingjiang/openresty:1.15.8.1
