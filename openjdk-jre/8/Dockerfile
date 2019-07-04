FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
	PATH=${PATH}:/usr/lib/jvm/java-8-openjdk-amd64/bin

# https://packages.debian.org/stretch/openjdk-8-jre-headless

RUN	set -ex; \
	\
	JAVA_DEBIAN_VERSION=8u212-b03-2~deb9u1; \
	\
	if [ ! -d /usr/share/man/man1 ]; then \
		mkdir -p /usr/share/man/man1; \
	fi; \
	apt-get update && apt-get install -y --no-install-recommends \
		openjdk-8-jre-headless="$JAVA_DEBIAN_VERSION" bzip2 unzip xz-utils tcpdump; \
	rm -rf /var/lib/apt/lists/*; \
	java -version
