FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

# https://github.com/docker-library/mongo/blob/master/4.0/Dockerfile

RUN set -ex; \
	\
	GPG_KEYS=E162F504A20CDF15827F718D4B7C549A058F8B6B; \
	MONGO_MAJOR=4.2; \
	MONGO_VERSION=4.2.0; \
	\
	echo "deb http://mirrors.aliyun.com/mongodb/apt/debian stretch/mongodb-org/$MONGO_MAJOR main" > /etc/apt/sources.list; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys $GPG_KEYS; \
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
