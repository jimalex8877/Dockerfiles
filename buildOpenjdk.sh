#!/usr/bin/env bash

JAVA_VERSION=8u252
JAVA_REVISED_VERSION=b09
OPENJ9_VERSION=0.20.0

docker build openjdk/8/ \
	--build-arg JAVA_VERSION=$JAVA_VERSION \
	--build-arg JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION \
	--build-arg JAVA_SUPERSET=jre \
	--build-arg JAVA_BINARY_ESUM=a93be303ed62398dba9acb0376fb3caf8f488fcde80dc62d0a8e46256b3adfb1 \
	\
	-t changmingjiang/openjdk-8-jre:latest
docker build openjdk/8/ \
	--build-arg JAVA_VERSION=$JAVA_VERSION \
	--build-arg JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION \
	--build-arg JAVA_SUPERSET=jdk \
	--build-arg JAVA_BINARY_ESUM=2b59b5282ff32bce7abba8ad6b9fde34c15a98f949ad8ae43e789bbd78fc8862 \
	\
	-t changmingjiang/openjdk-8-jdk:latest

docker tag changmingjiang/openjdk-8-jre:latest changmingjiang/openjdk-8-jre:$JAVA_VERSION
docker tag changmingjiang/openjdk-8-jdk:latest changmingjiang/openjdk-8-jdk:$JAVA_VERSION

docker build openjdk/8/openj9/ \
	--build-arg JAVA_VERSION=$JAVA_VERSION \
	--build-arg JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION \
	--build-arg OPENJ9_VERSION=$OPENJ9_VERSION \
	--build-arg JAVA_SUPERSET=jre \
	--build-arg JAVA_BINARY_ESUM=5c0ab4691ff5f8e69bb14462f2afb8d73d751b01048eacf4b426ed6d6646dc63 \
	\
	-t changmingjiang/openjdk-8-jre-openj9:latest
docker build openjdk/8/openj9/ \
	--build-arg JAVA_VERSION=$JAVA_VERSION \
	--build-arg JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION \
	--build-arg OPENJ9_VERSION=$OPENJ9_VERSION \
	--build-arg JAVA_SUPERSET=jdk \
	--build-arg JAVA_BINARY_ESUM=910ae847109a6dd1b6cf69baa7615ea2cce8cff787e5a9349a5331ce7604f3a5 \
	\
	-t changmingjiang/openjdk-8-jdk-openj9:latest

docker tag changmingjiang/openjdk-8-jre-openj9:latest changmingjiang/openjdk-8-jre-openj9:$JAVA_VERSION
docker tag changmingjiang/openjdk-8-jdk-openj9:latest changmingjiang/openjdk-8-jdk-openj9:$JAVA_VERSION

docker push changmingjiang/openjdk-8-jre:latest && docker push changmingjiang/openjdk-8-jre:$JAVA_VERSION
docker push changmingjiang/openjdk-8-jdk:latest && docker push changmingjiang/openjdk-8-jdk:$JAVA_VERSION
docker push changmingjiang/openjdk-8-jre-openj9:latest && docker push changmingjiang/openjdk-8-jre-openj9:$JAVA_VERSION
docker push changmingjiang/openjdk-8-jdk-openj9:latest && docker push changmingjiang/openjdk-8-jdk-openj9:$JAVA_VERSION