FROM changmingjiang/openjdk-8-jre-openj9:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

# https://github.com/sonatype/docker-nexus3/blob/master/Dockerfile

ARG NEXUS_VERSION=$NEXUS_VERSION
ARG NEXUS_DOWNLOAD_URL=http://download.sonatype.com/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz
ARG NEXUS_DOWNLOAD_SHA256_HASH=$NEXUS_DOWNLOAD_SHA256_HASH

ENV SONATYPE_DIR=/opt/sonatype \
	NEXUS_HOME=/opt/sonatype/nexus \
	NEXUS_DATA=/opt/sonatype/sonatype-work/nexus3

RUN set -ex; \
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