#!/bin/sh
if [ ! -f "/var/log/nginx/access.log" ]; then
	touch /var/log/nginx/access.log
	touch /var/log/nginx/error.log
fi

chown -R nginx:nginx /etc/nginx/conf.d/

exec gosu nginx "$@"
