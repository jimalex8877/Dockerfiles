#!/usr/bin/env bash
docker build golang/ -t changmingjiang/golang:latest

docker tag changmingjiang/golang:latest changmingjiang/golang:1.12.9
