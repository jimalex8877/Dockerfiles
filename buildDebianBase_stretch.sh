#!/usr/bin/env bash
docker pull debian:stretch-slim
docker build debianBase/ --build-arg "HTTPS_PROXY=http://192.168.1.103:1087" -t changmingjiang/debian:latest
