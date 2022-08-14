#!/usr/bin/env bash
docker pull debian:bullseye-slim
docker build debianBase/ -t changmingjiang/debian:latest
docker push changmingjiang/debian:latest