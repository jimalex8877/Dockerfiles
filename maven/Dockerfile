FROM changmingjiang/openjdk11-jdk:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV MAVEN_HOME=/opt/maven \
    MAVEN_CONFIG=/root/.m2 \
    PATH=${PATH}:/opt/maven/bin

RUN set -ex; \
	\
	MAVEN_VERSION=3.6.1; \
	SHA=b4880fb7a3d81edd190a029440cdf17f308621af68475a4fe976296e71ff4a4b546dd6d8a58aaafba334d309cc11e638c52808a4b0e818fc0fd544226d952544; \
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

COPY settings-docker.xml /opt/maven/conf/settings.xml

CMD ["mvn", "-h"]