FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV OPENRESTY_HOME=/usr/local/openresty/nginx \
	PATH=$PATH:/usr/local/openresty/bin \
	OPENRESTY_VERSION=1.15.8.1 \
	OPENRESTY_GPG_KEY=B550E09EA0E98066

RUN buildDeps=' \
		libssl-dev \
		libpcre3-dev \
		zlib1g-dev \
		libxslt-dev \
		libxml2-dev \
		libgd-dev \
		libpam0g-dev \
		libgeoip-dev \
		libperl-dev \
		gcc make \
	'; \
	envDeps=' \
		ca-certificates gnupg \
		dirmngr unzip \
		\
		geoip-bin geoip-database \
		zlib1g \
		libgd3 \
		gettext \
		openssl \
		libpcre3 \
		perl \
		build-essential \
	'; \
	configureDeps=' \
		--with-luajit \
		--with-file-aio \
		--with-http_addition_module \
		--with-http_auth_request_module \
		--with-http_dav_module \
		--with-http_flv_module \
		--with-http_geoip_module=dynamic \
		--with-http_gunzip_module \
		--with-http_gzip_static_module \
		--with-http_image_filter_module=dynamic \
		--with-http_mp4_module \
		--with-http_random_index_module \
		--with-http_realip_module \
		--with-http_secure_link_module \
		--with-http_slice_module \
		--with-http_ssl_module \
		--with-http_stub_status_module \
		--with-http_sub_module \
		--with-http_v2_module \
		--with-http_xslt_module=dynamic \
		--with-ipv6 \
		--with-mail \
		--with-mail_ssl_module \
		--with-md5-asm \
		--with-pcre-jit \
		--with-sha1-asm \
		--with-stream \
		--with-stream_ssl_module \
		--with-threads \
	'; \
	\
	set -ex; \
	\
	apt-get update && apt-get install -y $buildDeps $envDeps; \
	\
	wget -c -q -O openresty.tar.gz.asc	"https://openresty.org/download/openresty-$OPENRESTY_VERSION.tar.gz.asc"; \
	wget -c -q -O openresty.tar.gz		"https://openresty.org/download/openresty-$OPENRESTY_VERSION.tar.gz"; \
	\
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "$OPENRESTY_GPG_KEY"; \
	gpg --batch --verify openresty.tar.gz.asc openresty.tar.gz; \
	rm -rf "$GNUPGHOME"; \
	\
	mkdir -p /opt/openresty/; \
	tar -xzf openresty.tar.gz -C /opt/openresty/ --strip-components=1; \
	\
	cd /opt/openresty/; \
	cpuNum="$(nproc)"; \
	./configure -j$cpuNum $configureDeps; \
	make -j $cpuNum; \
	make install; \
	\
	cd / && rm -rf /var/lib/apt/lists/* openresty.tar.gz* /opt/openresty/*; \
	apt-get purge -y --auto-remove $buildDeps

CMD ["openresty", "-g", "daemon off;"]

STOPSIGNAL SIGQUIT