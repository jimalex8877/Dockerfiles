FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

RUN set -ex; \
	NGINX_VERSION=1.14.0-1~stretch; \
	NJS_VERSION=1.14.0.0.2.3-1~stretch; \
	nginxPackages=" \
		nginx=${NGINX_VERSION} \
		nginx-module-xslt=${NGINX_VERSION} \
		nginx-module-geoip=${NGINX_VERSION} \
		nginx-module-image-filter=${NGINX_VERSION} \
		nginx-module-njs=${NJS_VERSION} \
	"; \
	echo "deb http://nginx.org/packages/debian/ stretch nginx" >> /etc/apt/sources.list; \
	echo "deb-src http://nginx.org/packages/debian/ stretch nginx" >> /etc/apt/sources.list; \
	\
	wget --quiet -O - http://nginx.org/keys/nginx_signing.key | apt-key add -; \
	apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
		$nginxPackages \
		gettext-base; \
	rm -rf /var/lib/apt/lists/*; \
	mkdir -p /opt/nginx

WORKDIR /opt/nginx/

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-c", "/opt/nginx/nginx.conf", "-g", "daemon off;"]
