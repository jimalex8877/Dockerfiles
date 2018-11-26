FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

RUN set -ex; \
	\
	CONSUL_VERSION=1.4.0; \
	CONSUL_GPG_KEYS=91A6E7F85D05C65630BEF18951852D87348FFC4C; \
	\
	apt-get update; \
	apt-get install -y unzip --no-install-recommends; \
	rm -rf /var/lib/apt/lists/*; \
	\
	wget -c -q "https://releases.hashicorp.com/consul/$CONSUL_VERSION/consul_${CONSUL_VERSION}_linux_amd64.zip"; \
	wget -c -q "https://releases.hashicorp.com/consul/$CONSUL_VERSION/consul_${CONSUL_VERSION}_SHA256SUMS"; \
	wget -c -q "https://releases.hashicorp.com/consul/$CONSUL_VERSION/consul_${CONSUL_VERSION}_SHA256SUMS.sig"; \
	\
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --no-tty --keyserver keyserver.ubuntu.com --recv-keys $CONSUL_GPG_KEYS; \
	gpg --export $CONSUL_GPG_KEYS > /etc/apt/trusted.gpg.d/consul.gpg; \
	gpg --batch --verify consul_${CONSUL_VERSION}_SHA256SUMS.sig consul_${CONSUL_VERSION}_SHA256SUMS; \
	grep consul_${CONSUL_VERSION}_linux_amd64.zip consul_${CONSUL_VERSION}_SHA256SUMS | sha256sum -c; \
	unzip -d /bin consul_${CONSUL_VERSION}_linux_amd64.zip; \
	rm -r "$GNUPGHOME" consul_*; \
	\
	mkdir -p /opt/consul/data /opt/consul/config; \
	groupadd -r consul && useradd -r -g consul consul; \
	consul version

WORKDIR /opt/consul

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["agent", "-dev", "-client", "0.0.0.0"]