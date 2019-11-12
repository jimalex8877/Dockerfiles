FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ARG REDIS_VERSION=${REDIS_VERSION}
ARG REDIS_DOWNLOAD_SHA=${REDIS_DOWNLOAD_SHA}

# https://github.com/docker-library/redis/blob/master/5.0/Dockerfile

RUN set -ex; \
	\
	wget -e "https_proxy=${HTTPS_PROXY}" -c -q -O redis.tar.gz "http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz"; \
	echo "$REDIS_DOWNLOAD_SHA *redis.tar.gz" | sha256sum -c -; \
	mkdir -p /usr/src/redis; \
	tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1; \
	\
	buildDeps=' \
		gcc \
		libc6-dev \
		make \
	'; \
	apt-get update; \
	apt-get install -y $buildDeps --no-install-recommends; \
	\
	grep -q '^#define CONFIG_DEFAULT_PROTECTED_MODE 1$' /usr/src/redis/src/server.h; \
	sed -ri 's!^(#define CONFIG_DEFAULT_PROTECTED_MODE) 1$!\1 0!' /usr/src/redis/src/server.h; \
	grep -q '^#define CONFIG_DEFAULT_PROTECTED_MODE 0$' /usr/src/redis/src/server.h; \
	\
	make -C /usr/src/redis -j "$(nproc)"; \
	make -C /usr/src/redis install; \
	\
	apt-get purge -y --auto-remove $buildDeps; \
	\
	rm -rf /var/lib/apt/lists/* redis.tar.gz /usr/src/redis; \
	\
	mkdir -p /opt/redis; \
	groupadd -r redis && useradd -r -g redis redis

WORKDIR /opt/redis

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["redis-server", "/opt/redis/redis.conf"]