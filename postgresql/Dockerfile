FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ARG PG_MAJOR=$PG_MAJOR
ARG PG_VERSION=$PG_VERSION

ENV PGDATA=/opt/postgres/data \
	PATH=$PATH:/usr/lib/postgresql/${PG_MAJOR}/bin/

RUN set -ex; \
	\
	echo "deb http://apt.postgresql.org/pub/repos/apt/ bullseye-pgdg main" >> /etc/apt/sources.list; \
	#echo "deb-src http://apt.postgresql.org/pub/repos/apt/ bullseye-pgdg main" >> /etc/apt/sources.list; \
	\
	wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -; \
	\
	groupadd -r postgres --gid=999; \
	useradd -r -g postgres --uid=999 --home-dir=/var/lib/postgresql --shell=/bin/bash postgres; \
	mkdir -p /var/lib/postgresql; \
	chown -R postgres:postgres /var/lib/postgresql; \
	\
	apt-get update; \
	apt-get install -y postgresql-common; \
	sed -ri 's/#(create_main_cluster) .*$/\1 = false/' /etc/postgresql-common/createcluster.conf; \
	apt-get install -y postgresql-$PG_MAJOR="$PG_VERSION"; \
	find /usr -name '*.pyc' -type f -exec bash -c 'for pyc; do dpkg -S "$pyc" &> /dev/null || rm -vf "$pyc"; done' -- '{}' +; \
	\
	rm -rf /var/lib/apt/lists/*; \
	mkdir -p $PGDATA

WORKDIR /opt/postgres

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

STOPSIGNAL SIGINT

CMD ["postgres"]