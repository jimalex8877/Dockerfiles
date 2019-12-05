FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

RUN set -ex; \
	\
	DOCKER_CE_VERSION=5:19.03.1~3-0~debian-buster; \
	\
	curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -; \
	echo "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/debian buster stable" >> /etc/apt/sources
	.list; \
	apt update && apt install -y docker-ce=$DOCKER_CE_VERSION; \
	\
	rm -rf /var/lib/apt/lists/*