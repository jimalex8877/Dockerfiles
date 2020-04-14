#!/bin/sh
if [ ! -f "/opt/nginx/logs/access.log" ]; then
	touch /opt/nginx/logs/access.log
	touch /opt/nginx/logs/error.log
fi

chown -R nginx:nginx /opt/nginx/conf.d/
chown -R nginx:nginx /opt/nginx/logs/

exec gosu nginx "$@"
