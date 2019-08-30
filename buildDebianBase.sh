#!/usr/bin/env bash
docker pull debian:stretch-slim
docker build debianBase/ -t changmingjiang/debian:latest
