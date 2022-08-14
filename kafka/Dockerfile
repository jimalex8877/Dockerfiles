FROM changmingjiang/openjdk-8-jre-openj9:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV KAFKA_HOME=/opt/kafka \
	PATH=${PATH}:/opt/kafka/bin

# https://mirrors.aliyun.com/apache/kafka/

ARG KAFKA_VERSION=$KAFKA_VERSION
ARG SCALA_VERSION=$SCALA_VERSION

RUN set -ex; \
	\
	wget -q "https://mirrors.aliyun.com/apache/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz" \
		--progress=dot:giga -O kafka.tgz; \
	wget -q "https://www.apache.org/dist/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz.asc" \
		--progress=dot:giga -O kafka.tgz.asc; \
	wget "https://www.apache.org/dist/kafka/KEYS" --progress=dot:giga; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --no-tty --import KEYS; \
	gpg --batch --verify kafka.tgz.asc kafka.tgz; \
	tar -xzf kafka.tgz; \
	mkdir -p $KAFKA_HOME/logs/; \
	mv "kafka_$SCALA_VERSION-$KAFKA_VERSION/"* $KAFKA_HOME; \
	rm -rf $GNUPGHOME kafka.tgz kafka.tgz.asc KEYS; \
	groupadd -r kafka && useradd -r -g kafka kafka

WORKDIR /opt/kafka

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["kafka-server-start.sh", "config/server.properties"]
