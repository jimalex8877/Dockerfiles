FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV  CONSUL_DATA_DIR=/opt/consul/data \
     CONSUL_CONFIG_DIR=/opt/consul/config

# https://github.com/hashicorp/docker-consul/blob/master/0.X/Dockerfile

RUN set -ex; \
	\
	CONSUL_VERSION=1.6.0; \
	CONSUL_GPG_KEYS=91A6E7F85D05C65630BEF18951852D87348FFC4C; \
	\
	apt-get update; \
	apt-get install -y unzip iproute2 dumb-init jq moreutils --no-install-recommends; \
	rm -rf /var/lib/apt/lists/*; \
	\
	wget -e "https_proxy=${HTTPS_PROXY}" -c -q "https://releases.hashicorp.com/consul/$CONSUL_VERSION/consul_${CONSUL_VERSION}_linux_amd64.zip"; \
	wget -e "https_proxy=${HTTPS_PROXY}" -c -q "https://releases.hashicorp.com/consul/$CONSUL_VERSION/consul_${CONSUL_VERSION}_SHA256SUMS"; \
	wget -e "https_proxy=${HTTPS_PROXY}" -c -q "https://releases.hashicorp.com/consul/$CONSUL_VERSION/consul_${CONSUL_VERSION}_SHA256SUMS.sig"; \
	\
	export GNUPGHOME="$(mktemp -d)"; \
	gpg  --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys $CONSUL_GPG_KEYS; \
	gpg --export $CONSUL_GPG_KEYS > /etc/apt/trusted.gpg.d/consul.gpg; \
	gpg --batch --verify consul_${CONSUL_VERSION}_SHA256SUMS.sig consul_${CONSUL_VERSION}_SHA256SUMS; \
	grep consul_${CONSUL_VERSION}_linux_amd64.zip consul_${CONSUL_VERSION}_SHA256SUMS | sha256sum -c; \
	\
	unzip -d /bin consul_${CONSUL_VERSION}_linux_amd64.zip; \
	rm -rf "$GNUPGHOME" consul_*; \
	\
	mkdir -p ${CONSUL_DATA_DIR} ${CONSUL_CONFIG_DIR}; \
	echo '{"data_dir":"'${CONSUL_DATA_DIR}'"}' > ${CONSUL_CONFIG_DIR}/config.json; \
	\
	groupadd -r consul && useradd -r -g consul consul; \
	consul version

WORKDIR /opt/consul

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]