#!/usr/bin/env bash
docker pull debian:buster-slim
docker build debianBase/ -t changmingjiang/debian:latest
docker push changmingjiang/debian:latest