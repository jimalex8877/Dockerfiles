FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

RUN set -ex; \
	\
	GPG_KEYS=9DA31620334BD75D9DCB49F368818C72E52529D4; \
	MONGO_MAJOR=4.0; \
	MONGO_VERSION=4.0.2; \
	\
	echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/$MONGO_MAJOR main" > /etc/apt/sources.list; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --keyserver ha.pool.sks-keyservers.net --recv-keys $GPG_KEYS; \
	gpg --export $GPG_KEYS > /etc/apt/trusted.gpg.d/mongodb.gpg; \
	rm -r "$GNUPGHOME"; \
	\
	apt-get update && apt-get install -y \
		mongodb-org=$MONGO_VERSION \
		mongodb-org-server=$MONGO_VERSION \
		mongodb-org-shell=$MONGO_VERSION \
		mongodb-org-mongos=$MONGO_VERSION \
		mongodb-org-tools=$MONGO_VERSION \
	; \
	rm -rf /var/lib/apt/lists/* /var/lib/mongodb /etc/mongod.conf; \
	\
	mkdir -p /opt/mongodb

WORKDIR /opt/mongodb

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["mongod", "-f", "/opt/mongodb/mongodb.yaml"]
