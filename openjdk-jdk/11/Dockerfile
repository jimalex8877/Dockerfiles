FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 \
	PATH=${PATH}:/usr/lib/jvm/java-11-openjdk-amd64/bin

# https://packages.debian.org/stretch-backports/java/openjdk-11-jdk

RUN	set -ex; \
	\
	JAVA_DEBIAN_VERSION=11.0.2+9-3~bpo9+1; \
	\
	if [ ! -d /usr/share/man/man1 ]; then \
		mkdir -p /usr/share/man/man1; \
	fi; \
	apt-get update && apt-get install -y --no-install-recommends \
		openjdk-11-jdk="$JAVA_DEBIAN_VERSION" bzip2 unzip xz-utils; \
	rm -rf /var/lib/apt/lists/*; \
	java -version
