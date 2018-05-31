FROM changmingjiang/debian:jessie

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

RUN set -ex; \
	GPG_KEYS=2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5; \
	MONGODB_VERSION=3.6; \
	echo "deb http://mirrors.aliyun.com/mongodb/apt/debian jessie/mongodb-org/$MONGODB_VERSION main" > /etc/apt/sources.list; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --keyserver ha.pool.sks-keyservers.net --recv-keys $GPG_KEYS; \
	gpg --export $GPG_KEYS > /etc/apt/trusted.gpg.d/mongodb.gpg; \
	rm -r "$GNUPGHOME"; \
	apt-key list; \
	\
	apt-get update && apt-get install -y \
		mongodb-org \
		mongodb-org-server \
		mongodb-org-shell \
		mongodb-org-mongos \
		mongodb-org-tools \
	; \
	rm -rf /var/lib/apt/lists/* /var/lib/mongodb /etc/mongod.conf; \
	\
	mkdir -p /opt/mongodb

WORKDIR /opt/mongodb

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["mongod", "-f", "/opt/mongodb/mongodb.yaml"]
