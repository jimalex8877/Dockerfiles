FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

RUN set -ex; \
	echo "deb http://nginx.org/packages/debian/ stretch nginx" > /etc/apt/sources.list; \
	echo "deb-src http://nginx.org/packages/debian/ stretch nginx" >> /etc/apt/sources.list; \
	\
	wget --quiet -O - http://nginx.org/keys/nginx_signing.key | apt-key add -; \
	apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*; \
	mkdir -p /opt/nginx

WORKDIR /opt/nginx/

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-c", "/opt/nginx/nginx.conf", "-g", "daemon off;"]
