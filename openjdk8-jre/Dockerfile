FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
	PATH=${PATH}:/usr/lib/jvm/java-8-openjdk-amd64/bin

RUN	set -ex; \
	if [ ! -d /usr/share/man/man1 ]; then \
		mkdir -p /usr/share/man/man1; \
	fi; \
	apt-get update && apt-get install -y --no-install-recommends \
		openjdk-8-jre-headless xz-utils vim busybox && busybox --install; \
	rm -rf /var/lib/apt/lists/*; \
	java -version
