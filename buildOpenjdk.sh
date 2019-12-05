#!/usr/bin/env bash

JAVA_VERSION=8u232
JAVA_REVISED_VERSION=b09
OPENJ9_VERSION=0.17.0

docker build openjdk/8/ \
	--build-arg HTTPS_PROXY=http://10.1.226.187:1087 \
	\
	--build-arg JAVA_VERSION=$JAVA_VERSION \
	--build-arg JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION \
	--build-arg JAVA_SUPERSET=jre \
	--build-arg JAVA_BINARY_ESUM=bd06b84a1fc10e0a555431bc49a84e86df45de0be93c8ee4d09d13513219843b \
	\
	-t changmingjiang/openjdk-8-jre:latest
docker build openjdk/8/ \
	--build-arg HTTPS_PROXY=http://10.1.226.187:1087 \
	\
	--build-arg JAVA_VERSION=$JAVA_VERSION \
	--build-arg JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION \
	--build-arg JAVA_SUPERSET=jdk \
	--build-arg JAVA_BINARY_ESUM=7b7884f2eb2ba2d47f4c0bf3bb1a2a95b73a3a7734bd47ebf9798483a7bcc423 \
	\
	-t changmingjiang/openjdk-8-jdk:latest

docker tag changmingjiang/openjdk-8-jre:latest changmingjiang/openjdk-8-jre:$JAVA_VERSION
docker tag changmingjiang/openjdk-8-jdk:latest changmingjiang/openjdk-8-jdk:$JAVA_VERSION

docker build openjdk/8/openj9/ \
	--build-arg HTTPS_PROXY=http://10.1.226.187:1087 \
	\
	--build-arg JAVA_VERSION=$JAVA_VERSION \
	--build-arg JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION \
	--build-arg OPENJ9_VERSION=$OPENJ9_VERSION \
	--build-arg JAVA_SUPERSET=jre \
	--build-arg JAVA_BINARY_ESUM=30bdfdb38901d4807d96a72a33b83f7a4f40255e11a88853c1e8732acc4644a7 \
	\
	-t changmingjiang/openjdk-8-jre-openj9:latest
docker build openjdk/8/openj9/ \
	--build-arg HTTPS_PROXY=http://10.1.226.187:1087 \
	\
	--build-arg JAVA_VERSION=$JAVA_VERSION \
	--build-arg JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION \
	--build-arg OPENJ9_VERSION=$OPENJ9_VERSION \
	--build-arg JAVA_SUPERSET=jdk \
	--build-arg JAVA_BINARY_ESUM=abea758c7e102f3c4a3be8757ee0ce039a70e2d498c160400dfb83c6f7004dbf \
	\
	-t changmingjiang/openjdk-8-jdk-openj9:latest

docker tag changmingjiang/openjdk-8-jre-openj9:latest changmingjiang/openjdk-8-jre-openj9:$JAVA_VERSION
docker tag changmingjiang/openjdk-8-jdk-openj9:latest changmingjiang/openjdk-8-jdk-openj9:$JAVA_VERSION

docker push changmingjiang/openjdk-8-jre:latest && docker push changmingjiang/openjdk-8-jre:$JAVA_VERSION
docker push changmingjiang/openjdk-8-jdk:latest && docker push changmingjiang/openjdk-8-jdk:$JAVA_VERSION
docker push changmingjiang/openjdk-8-jre-openj9:latest && docker push changmingjiang/openjdk-8-jre-openj9:$JAVA_VERSION
docker push changmingjiang/openjdk-8-jdk-openj9:latest && docker push changmingjiang/openjdk-8-jdk-openj9:$JAVA_VERSION