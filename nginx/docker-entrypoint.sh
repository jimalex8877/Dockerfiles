#!/bin/sh -e

chown -R nginx:nginx /etc/nginx/conf.d/

sed -i "s|sendfile        on|sendfile        off|g" /etc/nginx/nginx.conf

sed -i "s|error_log  /var/log/nginx/error.log warn|error_log  /etc/nginx/logs/error.log warn|g" /etc/nginx/nginx.conf
sed -i "s|access_log  /var/log/nginx/access.log  main|access_log  /etc/nginx/logs/access.log  main|g" /etc/nginx/nginx.conf

if [ "$WORKER_PROCESSES" ]; then
	sed -i "s|worker_processes  1|worker_processes  $WORKER_PROCESSES|g" /etc/nginx/nginx.conf
	sed -i "s|worker_processes  auto|worker_processes  $WORKER_PROCESSES|g" /etc/nginx/nginx.conf
fi

if [ "$WORKER_CONNECTIONS" ]; then
	sed -i "s|worker_connections  10000|worker_connections  $WORKER_CONNECTIONS|g" /etc/nginx/nginx.conf
	sed -i "s|worker_connections  1024|worker_connections  $WORKER_CONNECTIONS|g" /etc/nginx/nginx.conf
fi

if [ "$GZIP" ]; then
	sed -i "s|#gzip  on|gzip  $GZIP|g" /etc/nginx/nginx.conf
fi

#ln -sf /dev/stdout /etc/nginx/logs/access.log
#ln -sf /dev/stderr /etc/nginx/logs/error.log

grep -q 'worker_rlimit_nofile' /etc/nginx/nginx.conf && echo '' || echo "worker_rlimit_nofile 65535;" >> /etc/nginx/nginx.conf;

exec "$@"
