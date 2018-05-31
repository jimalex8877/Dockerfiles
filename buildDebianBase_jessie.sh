#!/usr/bin/env bash
docker pull debian:jessie-slim
docker build debianBase/jessie/ --build-arg "HTTPS_PROXY=http://192.168.1.103:1087" -t changmingjiang/debian:jessie
