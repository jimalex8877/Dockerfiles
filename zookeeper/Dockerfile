FROM changmingjiang/openjdk8-jre:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV ZOOKEEPER_HOME=/opt/zookeeper \
	PATH=${PATH}:/opt/zookeeper/bin \
	ZOOKEEPER_VERSION=3.4.12 \
	GPG_KEY=586EFEF859AF2DB190D84080BDB2011E173C31A2

RUN set -ex; \
	wget "https://mirrors.aliyun.com/apache/zookeeper/zookeeper-$ZOOKEEPER_VERSION/zookeeper-$ZOOKEEPER_VERSION.tar.gz" \
		-c -q -O zookeeper.tar.gz; \
	wget "https://www.apache.org/dist/zookeeper/zookeeper-$ZOOKEEPER_VERSION/zookeeper-$ZOOKEEPER_VERSION.tar.gz.asc" \
		-c -q -O zookeeper.tar.gz.asc; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --keyserver ha.pool.sks-keyservers.net --recv-key "$GPG_KEY" || \
	gpg --keyserver pgp.mit.edu --recv-keys "$GPG_KEY" || \
	gpg --keyserver keyserver.pgp.com --recv-keys "$GPG_KEY"; \
	gpg --batch --verify zookeeper.tar.gz.asc zookeeper.tar.gz; \
	tar -xzf zookeeper.tar.gz; \
	mkdir -p $ZOOKEEPER_HOME/data/ $ZOOKEEPER_HOME/logs/; \
	mv "zookeeper-$ZOOKEEPER_VERSION/"* "$ZOOKEEPER_HOME"; \
	rm -rf $GNUPGHOME zookeeper.tar.gz zookeeper.tar.gz.asc; \
	groupadd -r zookeeper && useradd -r -g zookeeper zookeeper

WORKDIR /opt/zookeeper

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["zkServer.sh", "start-foreground"]
