FROM debian:stretch-slim

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV LANG=zh_CN.UTF-8 \
	LC_ALL=zh_CN.UTF-8 \
	LANGUAGE=zh_CN.UTF-8

RUN set -ex; \
	GOSU_VERSION=1.10; \
	GOSU_GPG_KEY=B42F6819007F00F88E364FD4036A9C25BF357DD4; \
	\
	apt update && apt upgrade -y && apt install -y locales wget curl gnupg; \
	echo $LANG > /usr/share/locale/locale.alias; \
	localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias $LANG; \
	echo "Asia/Shanghai" > /etc/timezone && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
	\
	dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget -c -e "https_proxy=${HTTPS_PROXY}" -O /usr/local/bin/gosu \
		"https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	wget -c -e "https_proxy=${HTTPS_PROXY}" -O /usr/local/bin/gosu.asc \
		"https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --keyserver ha.pool.sks-keyservers.net --recv-keys $GOSU_GPG_KEY; \
	gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
	rm -rf "$GNUPGHOME" /usr/local/bin/gosu.asc /var/lib/apt/lists/*; \
	chmod +x /usr/local/bin/gosu
