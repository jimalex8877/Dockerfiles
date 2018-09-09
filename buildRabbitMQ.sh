#!/usr/bin/env bash
docker build rabbitMQ/ --build-arg "HTTPS_PROXY=http://192.168.1.103:1087" -t changmingjiang/rabbitmq:latest