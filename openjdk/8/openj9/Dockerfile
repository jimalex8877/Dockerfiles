FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV JAVA_HOME=/opt/java/openjdk \
	PATH=${PATH}:/opt/java/openjdk/bin \
	JAVA_TOOL_OPTIONS="-XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport -XX:+IdleTuningCompactOnIdle -XX:+IdleTuningGcOnIdle"

# https://github.com/AdoptOpenJDK/openjdk-docker/blob/master/8/jre/debian/Dockerfile.hotspot.releases.full

ARG JAVA_VERSION=$JAVA_VERSION
ARG JAVA_REVISED_VERSION=$JAVA_REVISED_VERSION
ARG OPENJ9_VERSION=$OPENJ9_VERSION
ARG JAVA_SUPERSET=$JAVA_SUPERSET
ARG JAVA_BINARY_URL=https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk${JAVA_VERSION}-${JAVA_REVISED_VERSION}_openj9-${OPENJ9_VERSION}/OpenJDK8U-${JAVA_SUPERSET}_x64_linux_openj9_${JAVA_VERSION}${JAVA_REVISED_VERSION}_openj9-${OPENJ9_VERSION}.tar.gz
ARG JAVA_BINARY_ESUM=$JAVA_BINARY_ESUM

RUN	set -ex; \
	\
	wget -e "https_proxy=${HTTPS_PROXY}" -q -c -O /tmp/openjdk.tar.gz $JAVA_BINARY_URL; \
	echo "${JAVA_BINARY_ESUM} */tmp/openjdk.tar.gz" | sha256sum -c -; \
	mkdir -p $JAVA_HOME && cd $JAVA_HOME; \
	tar -xf /tmp/openjdk.tar.gz --strip-components=1; \
	rm -rf /tmp/openjdk.tar.gz; \
	\
	apt-get update && apt-get install -y --no-install-recommends \
		fontconfig bzip2 unzip xz-utils tcpdump; \
	rm -rf /var/lib/apt/lists/*; \
	\
	java -version
