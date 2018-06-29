FROM changmingjiang/debian:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

ENV PGDATA=/opt/postgres/data \
	PATH=${PATH}:/usr/lib/postgresql/10/bin/

RUN set -ex; \
	PG_VERSION=10.4-2.pgdg90+1; \
	echo "deb http://mirrors.tuna.tsinghua.edu.cn/postgresql/repos/apt/ stretch-pgdg main 10" >> /etc/apt/sources.list; \
	echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/postgresql/repos/apt/ stretch-pgdg main 10" >> /etc/apt/sources.list; \
	\
	wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -; \
	apt-get update && apt-get install -y postgresql-10="$PG_VERSION" postgresql-common; \
	rm -rf /var/lib/apt/lists/*; \
	mkdir -p $PGDATA

WORKDIR /opt/postgres

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["postgres"]