FROM changmingjiang/openjdk8-jdk:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV MAVEN_HOME=/opt/maven \
    MAVEN_CONFIG=/root/.m2 \
    PATH=${PATH}:/opt/maven/bin

RUN set -ex; \
	\
	MAVEN_VERSION=3.6.0; \
	SHA=fae9c12b570c3ba18116a4e26ea524b29f7279c17cbaadc3326ca72927368924d9131d11b9e851b8dc9162228b6fdea955446be41207a5cfc61283dd8a561d2f; \
	BASE_URL=https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/${MAVEN_VERSION}/binaries/; \
	\
	mkdir -p $MAVEN_CONFIG $MAVEN_HOME/ref; \
	curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz; \
	echo "${SHA} /tmp/apache-maven.tar.gz" | sha512sum -c -; \
	tar -xzf /tmp/apache-maven.tar.gz -C $MAVEN_HOME --strip-components=1; \
	\
	apt-get update && apt-get install -y dos2unix; \
	\
	rm -rf /tmp/apache-maven.tar.gz /var/lib/apt/lists/*

COPY docker-entrypoint.sh /

COPY settings-docker.xml /opt/maven/conf/settings.xml

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["mvn"]