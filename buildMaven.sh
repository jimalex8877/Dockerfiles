#!/usr/bin/env bash
docker build maven/ -t changmingjiang/maven:latest

docker tag changmingjiang/maven:latest changmingjiang/maven:3.6.1
