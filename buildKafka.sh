#!/usr/bin/env bash
docker build kafka/ -t changmingjiang/kafka:latest

docker tag changmingjiang/kafka:latest changmingjiang/kafka:2.3.0