FROM changmingjiang/openjdk-8-jre-openj9:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV ZOOKEEPER_HOME=/opt/zookeeper \
	PATH=${PATH}:/opt/zookeeper/bin

# https://mirrors.aliyun.com/apache/zookeeper/

ARG ZOOKEEPER_VERSION=$ZOOKEEPER_VERSION

RUN set -ex; \
	\
	wget "https://mirrors.aliyun.com/apache/zookeeper/zookeeper-$ZOOKEEPER_VERSION/apache-zookeeper-$ZOOKEEPER_VERSION-bin.tar.gz" \
		--progress=dot:giga -O zookeeper-bin.tar.gz; \
	wget "https://www.apache.org/dist/zookeeper/zookeeper-$ZOOKEEPER_VERSION/apache-zookeeper-$ZOOKEEPER_VERSION-bin.tar.gz.asc" \
		--progress=dot:giga -O zookeeper-bin.tar.gz.asc; \
	wget "https://www.apache.org/dist/zookeeper/KEYS" --progress=dot:giga; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --no-tty --import KEYS; \
	gpg --batch --verify zookeeper-bin.tar.gz.asc zookeeper-bin.tar.gz; \
	tar -xzf zookeeper-bin.tar.gz; \
	mkdir -p $ZOOKEEPER_HOME/data/ $ZOOKEEPER_HOME/logs/; \
    mv "apache-zookeeper-$ZOOKEEPER_VERSION-bin/"* "$ZOOKEEPER_HOME"; \
	rm -rf $GNUPGHOME zookeeper-bin.tar.gz zookeeper-bin.tar.gz.asc KEYS; \
	groupadd -r zookeeper && useradd -r -g zookeeper zookeeper

WORKDIR /opt/zookeeper

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["zkServer.sh", "start-foreground"]
