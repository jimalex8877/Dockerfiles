#!/usr/bin/env bash
docker build mongodb/ -t changmingjiang/mongodb:latest

docker tag changmingjiang/mongodb:latest changmingjiang/mongodb:4.0.10
