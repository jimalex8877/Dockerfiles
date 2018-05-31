#!/usr/bin/env bash

docker run --restart=always -d --name mongodb-27017 \
	--expose 27017 -p 27017:27017 \
    -v $(pwd)/27017:/opt/mongodb \
    changmingjiang/mongodb:latest

docker run --restart=always -d --name mongodb-27018 \
	--expose 27018 -p 27018:27018 \
    -v $(pwd)/27018:/opt/mongodb \
    changmingjiang/mongodb:latest

docker run --restart=always -d --name mongodb-27019 \
	--expose 27019 -p 27019:27019 \
    -v $(pwd)/27019:/opt/mongodb \
    changmingjiang/mongodb:latest
