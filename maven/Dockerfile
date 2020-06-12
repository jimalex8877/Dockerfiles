FROM changmingjiang/openjdk-8-jdk:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

# https://github.com/carlossg/docker-maven/blob/master/openjdk-8-slim/Dockerfile

ARG MAVEN_VERSION=$MAVEN_VERSION
ARG MAVEN_SHA=$MAVEN_SHA

ENV MAVEN_HOME=/opt/maven \
    MAVEN_CONFIG=/root/.m2 \
    PATH=${PATH}:/opt/maven/bin

RUN set -ex; \
	\
	BASE_URL=https://mirrors.aliyun.com/apache/maven/maven-3/${MAVEN_VERSION}/binaries/; \
	\
	mkdir -p $MAVEN_CONFIG $MAVEN_HOME/ref; \
	curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz; \
	echo "${MAVEN_SHA} /tmp/apache-maven.tar.gz" | sha512sum -c -; \
	tar -xzf /tmp/apache-maven.tar.gz -C $MAVEN_HOME --strip-components=1; \
	\
	apt-get update && apt-get install -y dos2unix; \
	\
	rm -rf /tmp/apache-maven.tar.gz /var/lib/apt/lists/*

COPY settings-docker.xml /opt/maven/conf/settings.xml

CMD ["mvn", "-h"]