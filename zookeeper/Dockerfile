FROM changmingjiang/openjdk8-jre:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV ZOOKEEPER_HOME=/opt/zookeeper \
	PATH=${PATH}:/opt/zookeeper/bin

# https://mirrors.aliyun.com/apache/zookeeper/

RUN set -ex; \
	\
	ZOOKEEPER_VERSION=3.5.5; \
	\
	wget "https://mirrors.aliyun.com/apache/zookeeper/zookeeper-$ZOOKEEPER_VERSION/zookeeper-$ZOOKEEPER_VERSION.tar.gz" \
		-c -q -O zookeeper.tar.gz; \
	wget "https://www.apache.org/dist/zookeeper/zookeeper-$ZOOKEEPER_VERSION/zookeeper-$ZOOKEEPER_VERSION.tar.gz.asc" \
		-c -q -O zookeeper.tar.gz.asc; \
	wget "https://www.apache.org/dist/zookeeper/KEYS" -c -q; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --no-tty --import KEYS; \
	gpg --batch --verify zookeeper.tar.gz.asc zookeeper.tar.gz; \
	tar -xzf zookeeper.tar.gz; \
	mkdir -p $ZOOKEEPER_HOME/data/ $ZOOKEEPER_HOME/logs/; \
    mv "zookeeper-$ZOOKEEPER_VERSION/"* "$ZOOKEEPER_HOME"; \
	rm -rf $GNUPGHOME zookeeper.tar.gz zookeeper.tar.gz.asc KEYS; \
	groupadd -r zookeeper && useradd -r -g zookeeper zookeeper

WORKDIR /opt/zookeeper

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["zkServer.sh", "start-foreground"]
