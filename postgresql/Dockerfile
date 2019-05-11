FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

# https://github.com/docker-library/postgres/blob/master/11/Dockerfile

ENV PG_MAJOR=11 \
	PG_VERSION=11.3-1.pgdg90+1 \
	PGDATA=/opt/postgres/data \
	PATH=$PATH:/usr/lib/postgresql/11/bin/

RUN set -ex; \
	\
	echo "deb http://mirrors.tuna.tsinghua.edu.cn/postgresql/repos/apt/ stretch-pgdg main" >> /etc/apt/sources.list; \
	echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/postgresql/repos/apt/ stretch-pgdg main" >> /etc/apt/sources.list; \
	\
	wget --quiet -O - https://mirrors.tuna.tsinghua.edu.cn/postgresql/repos/apt/ACCC4CF8.asc | apt-key add -; \
	\
	groupadd -r postgres --gid=999; \
	useradd -r -g postgres --uid=999 --home-dir=/var/lib/postgresql --shell=/bin/bash postgres; \
	mkdir -p /var/lib/postgresql; \
	chown -R postgres:postgres /var/lib/postgresql; \
	\
	apt-get update; \
	apt-get install -y postgresql-common libnss-wrapper; \
	sed -ri 's/#(create_main_cluster) .*$/\1 = false/' /etc/postgresql-common/createcluster.conf; \
	apt-get install -y postgresql-$PG_MAJOR="$PG_VERSION"; \
	\
	rm -rf /var/lib/apt/lists/*; \
	mkdir -p $PGDATA

WORKDIR /opt/postgres

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["postgres"]