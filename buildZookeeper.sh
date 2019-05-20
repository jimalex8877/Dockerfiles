#!/usr/bin/env bash
docker build zookeeper/ -t changmingjiang/zookeeper:latest

docker tag changmingjiang/zookeeper:latest changmingjiang/zookeeper:3.4.14