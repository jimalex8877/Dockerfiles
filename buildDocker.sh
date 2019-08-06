#!/usr/bin/env bash
docker build docker/ -t changmingjiang/docker:latest
docker tag changmingjiang/docker:latest changmingjiang/docker:19.03.1