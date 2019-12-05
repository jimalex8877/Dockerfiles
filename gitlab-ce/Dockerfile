FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

RUN set -ex; \
	\
	GITLAB_CE_VERSION=11.11.3-ce.0; \
	\
	echo "deb http://mirrors.aliyun.com/gitlab-ce/debian buster main" >> /etc/apt/sources.list; \
	\
	wget --quiet -O - https://packages.gitlab.com/gpg.key | apt-key add -; \
	apt update && apt-get install -yq --no-install-recommends \
		debian-archive-keyring \
		apt-transport-https \
		postfix \
		tzdata \
		gitlab-ce=$GITLAB_CE_VERSION \
	; \
	rm -rf /var/lib/apt/lists/* \
