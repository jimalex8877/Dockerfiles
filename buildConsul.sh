#!/usr/bin/env bash
docker build consul/ --build-arg "HTTPS_PROXY=http://10.2.236.140:1087" -t changmingjiang/consul:latest

docker tag changmingjiang/consul:latest changmingjiang/consul:1.4.3