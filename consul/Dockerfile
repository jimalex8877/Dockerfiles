FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

RUN set -ex; \
	\
	CONSUL_VERSION=1.3.0; \
	CONSUL_DOWNLOAD_SHA=a6896509b72fa229496b3adda51357c95d68a796ae3328d7d6a61195d6c68bac; \
	\
	apt-get update; \
	apt-get install -y unzip --no-install-recommends; \
	rm -rf /var/lib/apt/lists/*; \
	\
	wget -e "https_proxy=$HTTPS_PROXY" -O consul.zip \
		"https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip"; \
	echo "$CONSUL_DOWNLOAD_SHA *consul.zip" | sha256sum -c -; \
	unzip -d /bin consul.zip && rm consul.zip; \
	\
	mkdir -p /opt/consul; \
	groupadd -r consul && useradd -r -g consul consul

WORKDIR /opt/consul

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]