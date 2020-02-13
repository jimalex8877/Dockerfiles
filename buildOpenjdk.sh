#!/usr/bin/env bash

LocaleIp=`ip addr show en0|grep 'inet '|awk '{print $2}'|awk -F/ '{print $1}'`

JAVA_VERSION=8u242
JAVA_REVISED_VERSION=b08
OPENJ9_VERSION=0.18.1

docker build openjdk/8/ \
	--build-arg HTTPS_PROXY=http://$LocaleIp:1087 \
	\
	--build-arg JAVA_VERSION=$JAVA_VERSION \
	--build-arg JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION \
	--build-arg JAVA_SUPERSET=jre \
	--build-arg JAVA_BINARY_ESUM=5edfaefdbb0469d8b24d61c8aef80c076611053b1738029c0232b9a632fe2708 \
	\
	-t changmingjiang/openjdk-8-jre:latest
docker build openjdk/8/ \
	--build-arg HTTPS_PROXY=http://$LocaleIp:1087 \
	\
	--build-arg JAVA_VERSION=$JAVA_VERSION \
	--build-arg JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION \
	--build-arg JAVA_SUPERSET=jdk \
	--build-arg JAVA_BINARY_ESUM=f39b523c724d0e0047d238eb2bb17a9565a60574cf651206c867ee5fc000ab43 \
	\
	-t changmingjiang/openjdk-8-jdk:latest

docker tag changmingjiang/openjdk-8-jre:latest changmingjiang/openjdk-8-jre:$JAVA_VERSION
docker tag changmingjiang/openjdk-8-jdk:latest changmingjiang/openjdk-8-jdk:$JAVA_VERSION

docker build openjdk/8/openj9/ \
	--build-arg HTTPS_PROXY=http://$LocaleIp:1087 \
	\
	--build-arg JAVA_VERSION=$JAVA_VERSION \
	--build-arg JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION \
	--build-arg OPENJ9_VERSION=$OPENJ9_VERSION \
	--build-arg JAVA_SUPERSET=jre \
	--build-arg JAVA_BINARY_ESUM=985d3134b64c6196d4c9ddbc87af0c62b0e643cef71b29f3d25a8c7811811745 \
	\
	-t changmingjiang/openjdk-8-jre-openj9:latest
docker build openjdk/8/openj9/ \
	--build-arg HTTPS_PROXY=http://$LocaleIp:1087 \
	\
	--build-arg JAVA_VERSION=$JAVA_VERSION \
	--build-arg JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION \
	--build-arg OPENJ9_VERSION=$OPENJ9_VERSION \
	--build-arg JAVA_SUPERSET=jdk \
	--build-arg JAVA_BINARY_ESUM=ca785af638b24f9d4df896f5a9f557cc9f1e5fa5e2b1174d6b906e3fd5474c2e \
	\
	-t changmingjiang/openjdk-8-jdk-openj9:latest

docker tag changmingjiang/openjdk-8-jre-openj9:latest changmingjiang/openjdk-8-jre-openj9:$JAVA_VERSION
docker tag changmingjiang/openjdk-8-jdk-openj9:latest changmingjiang/openjdk-8-jdk-openj9:$JAVA_VERSION

docker push changmingjiang/openjdk-8-jre:latest && docker push changmingjiang/openjdk-8-jre:$JAVA_VERSION
docker push changmingjiang/openjdk-8-jdk:latest && docker push changmingjiang/openjdk-8-jdk:$JAVA_VERSION
docker push changmingjiang/openjdk-8-jre-openj9:latest && docker push changmingjiang/openjdk-8-jre-openj9:$JAVA_VERSION
docker push changmingjiang/openjdk-8-jdk-openj9:latest && docker push changmingjiang/openjdk-8-jdk-openj9:$JAVA_VERSION