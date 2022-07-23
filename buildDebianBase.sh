#!/usr/bin/env bash
docker pull --platform=linux/amd64 debian:bullseye-slim
docker build debianBase/ --platform=linux/amd64 -t changmingjiang/debian:latest
docker push changmingjiang/debian:latest