#!/usr/bin/env bash
docker kill kafka-9091
docker kill kafka-9092
docker kill kafka-9093

docker rm kafka-9091
docker rm kafka-9092
docker rm kafka-9093

