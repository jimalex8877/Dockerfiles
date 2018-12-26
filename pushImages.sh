#!/usr/bin/env bash
docker push changmingjiang/debian:latest

docker push changmingjiang/redis:latest
docker push changmingjiang/redis:5.0.3

docker push changmingjiang/redis-sentinel:latest
docker push changmingjiang/redis-sentinel:5.0.3

docker push changmingjiang/openjdk8-jre:latest
docker push changmingjiang/openjdk11-jre:latest

docker push changmingjiang/mongodb:latest
docker push changmingjiang/mongodb:4.0.4

docker push changmingjiang/postgres:latest
docker push changmingjiang/postgres:11

docker push changmingjiang/rabbitmq:latest
docker push changmingjiang/rabbitmq:3.7.9

docker push changmingjiang/nginx:latest
docker push changmingjiang/nginx:1.14.2

docker push changmingjiang/zookeeper:latest
docker push changmingjiang/zookeeper:3.4.13

docker push changmingjiang/kafka:latest
docker push changmingjiang/kafka:2.1.0
