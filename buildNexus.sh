#!/usr/bin/env bash
docker build nexus/ --build-arg "HTTPS_PROXY=http://10.2.239.216:1087" -t changmingjiang/nexus:latest