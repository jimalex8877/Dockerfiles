FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

# https://github.com/nginxinc/docker-nginx/blob/master/stable/buster/Dockerfile

ARG NGINX_VERSION=$NGINX_VERSION
ARG NJS_VERSION=$NJS_VERSION
ARG PKG_RELEASE=$PKG_RELEASE

RUN set -ex; \
	\
	addgroup --system --gid 101 nginx; \
	adduser --system --disabled-login --ingroup nginx --no-create-home --home /nonexistent --gecos "nginx user" \
		--shell /bin/false --uid 101 nginx; \
	\
	nginxPackages=" \
		nginx=${NGINX_VERSION}-${PKG_RELEASE} \
		nginx-module-xslt=${NGINX_VERSION}-${PKG_RELEASE} \
		nginx-module-geoip=${NGINX_VERSION}-${PKG_RELEASE} \
		nginx-module-image-filter=${NGINX_VERSION}-${PKG_RELEASE} \
		nginx-module-njs=${NGINX_VERSION}.${NJS_VERSION}-${PKG_RELEASE} \
	"; \
	echo "deb http://nginx.org/packages/debian/ buster nginx" >> /etc/apt/sources.list; \
	echo "deb-src http://nginx.org/packages/debian/ buster nginx" >> /etc/apt/sources.list; \
	\
	wget --quiet -O - http://nginx.org/keys/nginx_signing.key | apt-key add -; \
	apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
		$nginxPackages \
		gettext-base; \
	rm -rf /var/lib/apt/lists/*; \
	\
	mkdir -p /opt/nginx/logs/ && mv -f /etc/nginx/* /opt/nginx/ && mv -f /var/log/nginx/* /opt/nginx/logs/; \
	\
	sed -i "s|/var/run/nginx.pid|/opt/nginx/nginx.pid|g" /opt/nginx/nginx.conf; \
	sed -i "s|/var/log/nginx|/opt/nginx/logs|g" /opt/nginx/nginx.conf; \
	sed -i "s|/etc/nginx|/opt/nginx|g" /opt/nginx/nginx.conf; \
	\
	chown -R nginx:nginx /opt/nginx/; \
	chown -R nginx:nginx /var/log/nginx; \
	chown -R nginx:nginx /var/cache/nginx

WORKDIR /opt/nginx/

COPY docker-entrypoint.sh /

STOPSIGNAL SIGTERM

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-c", "/opt/nginx/nginx.conf", "-g", "daemon off;"]
