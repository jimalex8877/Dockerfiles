#!/usr/bin/env bash
docker build nexus/ --build-arg "HTTPS_PROXY=http://10.1.233.34:1087" -t changmingjiang/nexus:latest

docker tag changmingjiang/nexus:latest changmingjiang/nexus:3.18.0