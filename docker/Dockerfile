FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

RUN set -ex; \
	\
	DOCKER_CE_VERSION=5:18.09.6~3-0~debian-stretch; \
	\
	curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -; \
	echo "deb [arch=amd64] http://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian stretch stable" >> /etc/apt/sources.list; \
	apt update && apt install -y docker-ce=$DOCKER_CE_VERSION; \
	\
	rm -rf /var/lib/apt/lists/*