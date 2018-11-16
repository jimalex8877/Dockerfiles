#!/usr/bin/env bash
docker build rabbitMQ/ --build-arg "HTTPS_PROXY=http://10.2.236.176:1087" -t changmingjiang/rabbitmq:latest

docker tag changmingjiang/rabbitmq:latest changmingjiang/rabbitmq:3.7.9