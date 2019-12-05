#!/usr/bin/env bash

MAVEN_VERSION=3.6.3
MAVEN_SHA=c35a1803a6e70a126e80b2b3ae33eed961f83ed74d18fcd16909b2d44d7dada3203f1ffe726c17ef8dcca2dcaa9fca676987befeadc9b9f759967a8cb77181c0

docker build maven/ \
	--build-arg MAVEN_VERSION=$MAVEN_VERSION \
	--build-arg MAVEN_SHA=$MAVEN_SHA \
	-t changmingjiang/maven:latest

docker tag changmingjiang/maven:latest changmingjiang/maven:$MAVEN_VERSION

docker push changmingjiang/maven:latest && docker push changmingjiang/maven:$MAVEN_VERSION
