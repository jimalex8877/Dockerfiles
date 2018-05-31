FROM changmingjiang/openjdk8-jre:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV KAFKA_HOME=/opt/kafka \
	PATH=${PATH}:/opt/kafka/bin \
	KAFKA_VERSION=1.1.0 \
	SCALA_VERSION=2.12

RUN set -ex; \
	wget -q "https://mirrors.aliyun.com/apache/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz" \
		-c -q -O kafka.tgz; \
	wget -q "https://www.apache.org/dist/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz.asc" \
		-c -q -O kafka.tgz.asc; \
	wget "https://www.apache.org/dist/kafka/KEYS" -c -q; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --import KEYS; \
	gpg --batch --verify kafka.tgz.asc kafka.tgz; \
	tar -xzf kafka.tgz; \
	mkdir -p $KAFKA_HOME/logs/; \
	mv "kafka_$SCALA_VERSION-$KAFKA_VERSION/"* $KAFKA_HOME; \
	rm -rf $GNUPGHOME kafka.tgz kafka.tgz.asc KEYS; \
	groupadd -r kafka && useradd -r -g kafka kafka

WORKDIR /opt/kafka

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["kafka-server-start.sh", "/opt/kafka/config/server.properties"]
