#!/usr/bin/env bash
docker build nexus/ --build-arg "HTTPS_PROXY=http://10.2.239.216:1087" -t changmingjiang/nexus:latest

docker tag changmingjiang/nexus:latest changmingjiang/nexus:1.16.0