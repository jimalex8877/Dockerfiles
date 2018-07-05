#!/usr/bin/env bash

mkdir -p `pwd`/8081/data
docker run --restart=always -d --name jenkins-1 \
	--expose 8080 -p 8081:8080 \
	-v `pwd`/8081/data:/var/lib/jenkins \
	changmingjiang/jenkins:latest

#mkdir -p `pwd`/8082/data
#docker run --restart=always -d --name jenkins-2 \
#	--expose 8080 -p 8082:8080 \
#	-v `pwd`/8082/data:/var/lib/jenkins \
#	changmingjiang/jenkins:latest
