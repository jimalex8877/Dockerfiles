#!/usr/bin/env bash
docker pull debian:stretch-slim
docker build debianBase/stretch/ -t changmingjiang/debian:latest
