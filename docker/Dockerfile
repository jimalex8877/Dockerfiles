FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ARG DOCKER_CE_VERSION=$DOCKER_CE_VERSION

RUN set -ex; \
	\
	curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -; \
	echo "deb http://mirrors.aliyun.com/docker-ce/linux/debian buster stable" >> /etc/apt/sources.list; \
	apt update && apt install -y docker-ce=$DOCKER_CE_VERSION; \
	\
	rm -rf /var/lib/apt/lists/*