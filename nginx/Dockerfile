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
	ln -sf /dev/stdout /var/log/nginx/access.log;\
	ln -sf /dev/stderr /var/log/nginx/error.log

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
