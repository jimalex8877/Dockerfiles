FROM changmingjiang/openjdk8-jre:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

# https://github.com/sonatype/docker-nexus3/blob/master/Dockerfile

ENV SONATYPE_DIR=/opt/sonatype \
	NEXUS_HOME=/opt/sonatype/nexus \
	NEXUS_DATA=/opt/sonatype/sonatype-work/nexus3

RUN set -ex; \
	\
	NEXUS_VERSION=3.16.1-02; \
	NEXUS_DOWNLOAD_URL=https://sonatype-download.global.ssl.fastly.net/repository/repositoryManager/3/nexus-${NEXUS_VERSION}-unix.tar.gz; \
	NEXUS_DOWNLOAD_SHA256_HASH=961e29d7242626fdeebf3a1c429ae0bc6468544a2c80df328fd3fb7596becc59; \
	\
	mkdir -p "${SONATYPE_DIR}" "${NEXUS_DATA}"; \
	wget -c -q -O nexus.tar.gz $NEXUS_DOWNLOAD_URL; \
	echo "$NEXUS_DOWNLOAD_SHA256_HASH *nexus.tar.gz" | sha256sum -c -; \
	tar -xzf nexus.tar.gz -C "${SONATYPE_DIR}" && rm -rf nexus.tar.gz; \
	mv "${SONATYPE_DIR}/nexus-${NEXUS_VERSION}" "${NEXUS_HOME}"; \
	\
	groupadd -r nexus && useradd -r -m -g nexus nexus; \
	chown -R nexus:nexus "${NEXUS_HOME}"

WORKDIR ${NEXUS_HOME}

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/opt/sonatype/nexus/bin/nexus", "run"]