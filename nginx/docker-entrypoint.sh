#!/bin/sh
mkdir -p /opt/nginx/conf.d/ /opt/nginx/logs/

if [ ! -f "/opt/nginx/logs/access.log" ]; then
	touch /opt/nginx/logs/access.log
	touch /opt/nginx/logs/error.log
fi

chown -R nginx:nginx /opt/nginx

exec gosu nginx "$@"
