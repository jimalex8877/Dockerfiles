FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ARG RABBITMQ_VERSION=${RABBITMQ_VERSION}

ENV RABBITMQ_HOME=/opt/rabbitmq \
	RABBITMQ_BASE=/opt/rabbitmq \
	RABBITMQ_CONFIG_FILE=/opt/rabbitmq/rabbitmq \
	RABBITMQ_MNESIA_BASE=/opt/rabbitmq/mnesia \
	RABBITMQ_ENABLED_PLUGINS_FILE=/opt/rabbitmq/enabled_plugins \
	RABBITMQ_LOG_BASE=/opt/rabbitmq

# http://dl.bintray.com/rabbitmq/debian/dists/buster/main/binary-amd64/Packages

RUN	set -ex; \
	\
	echo "deb http://dl.bintray.com/rabbitmq/debian buster main" >> /etc/apt/sources.list; \
	echo "deb http://mirrors.tuna.tsinghua.edu.cn/erlang-solutions/debian buster contrib" >> /etc/apt/sources.list; \
	\
	wget -q -O - https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc | apt-key add -; \
	wget -q -O - https://packages.erlang-solutions.com/debian/erlang_solutions.asc | apt-key add -; \
	\
	mkdir -p $RABBITMQ_MNESIA_BASE $RABBITMQ_ENABLED_PLUGINS_FILE /etc/rabbitmq/; \
	\
	wget https://gitee.com/mirrors/rabbitmq/raw/master/docs/rabbitmq.conf.example -q -c -O /etc/rabbitmq/rabbitmq.conf; \
	\
	apt-get update; \
	apt-get install -y --no-install-recommends \
		erlang-base-hipe \
		erlang-asn1 \
		erlang-crypto \
		erlang-eldap \
		erlang-inets \
		erlang-mnesia \
		erlang-nox \
		erlang-os-mon \
		erlang-public-key \
		erlang-ssl \
		erlang-xmerl \
	; \
	apt-get install -y rabbitmq-server=$RABBITMQ_VERSION; \
	rm -rf /var/lib/apt/lists/*

WORKDIR /opt/rabbitmq

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["rabbitmq-server"]