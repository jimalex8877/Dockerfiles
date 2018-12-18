FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

# https://github.com/docker-library/redis/blob/master/5.0/Dockerfile

RUN set -ex; \
	\
	REDIS_VERSION=5.0.3; \
	REDIS_DOWNLOAD_SHA=e290b4ddf817b26254a74d5d564095b11f9cd20d8f165459efa53eb63cd93e02; \
	\
	buildDeps=' \
		gcc \
		libc6-dev \
		make \
	'; \
	apt-get update; \
	apt-get install -y $buildDeps --no-install-recommends; \
	rm -rf /var/lib/apt/lists/*; \
	\
	wget -e "https_proxy=${HTTPS_PROXY}" -O redis.tar.gz "http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz"; \
	echo "$REDIS_DOWNLOAD_SHA *redis.tar.gz" | sha256sum -c -; \
	mkdir -p /usr/src/redis; \
	tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1; \
	rm redis.tar.gz; \
	\
	grep -q '^#define CONFIG_DEFAULT_PROTECTED_MODE 1$' /usr/src/redis/src/server.h; \
	sed -ri 's!^(#define CONFIG_DEFAULT_PROTECTED_MODE) 1$!\1 0!' /usr/src/redis/src/server.h; \
	grep -q '^#define CONFIG_DEFAULT_PROTECTED_MODE 0$' /usr/src/redis/src/server.h; \
	\
	make -C /usr/src/redis -j "$(nproc)"; \
	make -C /usr/src/redis install; \
	\
	rm -r /usr/src/redis; \
	\
	apt-get purge -y --auto-remove $buildDeps; \
	\
	mkdir -p /opt/redis; \
	groupadd -r redis && useradd -r -g redis redis

WORKDIR /opt/redis

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["redis-server", "/opt/redis/redis.conf"]