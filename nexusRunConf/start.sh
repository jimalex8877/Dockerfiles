#!/usr/bin/env bash

mkdir -p `pwd`/data
docker run --restart=always -d --name nexus \
	--expose 8081 -p 8081:8081 \
    -v `pwd`/data:/opt/sonatype/sonatype-work/nexus3 \
    --platform=linux/amd64 \
    changmingjiang/nexus:latest
