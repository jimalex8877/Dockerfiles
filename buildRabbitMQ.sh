#!/usr/bin/env bash
docker build rabbitMQ/ -t changmingjiang/rabbitmq:latest

docker tag changmingjiang/rabbitmq:latest changmingjiang/rabbitmq:3.7.15