#!/usr/bin/env bash
docker kill zookeeper-2181
docker kill zookeeper-2182
docker kill zookeeper-2183

docker rm zookeeper-2181
docker rm zookeeper-2182
docker rm zookeeper-2183
