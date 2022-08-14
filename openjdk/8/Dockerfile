FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV JAVA_HOME=/opt/java/openjdk \
	PATH=${PATH}:/opt/java/openjdk/bin

ARG JAVA_BINARY_ESUM=$JAVA_BINARY_ESUM
ARG DOWNLOAD_URL=$DOWNLOAD_URL

RUN	set -ex; \
	\
	wget --progress=dot:giga -O /tmp/openjdk.tar.gz $DOWNLOAD_URL; \
	echo "${JAVA_BINARY_ESUM} */tmp/openjdk.tar.gz" | sha256sum -c -; \
	mkdir -p $JAVA_HOME && cd $JAVA_HOME; \
	tar -xf /tmp/openjdk.tar.gz --strip-components=1; \
	rm -rf /tmp/openjdk.tar.gz; \
	\
	apt-get update && apt-get install -y --no-install-recommends \
		fontconfig bzip2 unzip xz-utils tcpdump; \
	rm -rf /var/lib/apt/lists/*; \
	\
	java -version
