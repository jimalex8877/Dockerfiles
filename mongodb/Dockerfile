FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

RUN set -ex; \
	GPG_KEYS=9DA31620334BD75D9DCB49F368818C72E52529D4; \
	MONGODB_VERSION=4.0; \
	echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/$MONGODB_VERSION main" > /etc/apt/sources.list; \
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
