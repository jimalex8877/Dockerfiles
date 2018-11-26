#!/usr/bin/env bash
docker build consul/ -t changmingjiang/consul:latest

docker tag changmingjiang/consul:latest changmingjiang/consul:1.4.0