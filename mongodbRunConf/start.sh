#!/usr/bin/env bash

docker run --restart=always -d --name mongodb-27017 \
	--expose 27017 -p 27017:27017 \
    -v $(pwd)/27017:/opt/mongodb \
    changmingjiang/mongodb:latest

docker run --restart=always -d --name mongodb-37017 \
	--expose 37017 -p 37017:37017 \
    -v $(pwd)/37017:/opt/mongodb \
    changmingjiang/mongodb:latest

docker run --restart=always -d --name mongodb-47017 \
	--expose 47017 -p 47017:47017 \
    -v $(pwd)/47017:/opt/mongodb \
    changmingjiang/mongodb:latest
