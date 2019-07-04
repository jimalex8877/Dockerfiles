#!/usr/bin/env bash
docker build gitlab-ce/ -t changmingjiang/gitlab-ce:latest

docker tag changmingjiang/gitlab-ce:latest changmingjiang/gitlab-ce:11.11.3-ce.0
