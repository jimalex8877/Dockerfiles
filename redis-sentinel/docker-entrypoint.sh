#!/bin/sh

echo 1024 > /proc/sys/net/core/somaxconn
echo 'never' > /sys/kernel/mm/transparent_hugepage/enabled

if [ ! -f "/opt/redis/sentinel.conf" ]; then
	wget -c -O /opt/redis/sentinel.conf http://download.redis.io/redis-stable/sentinel.conf

	sed -i "s|dir /tmp|dir /opt/redis|" /opt/redis/sentinel.conf
	{ echo "logfile /opt/redis/sentinel.log"; echo; } >> /opt/redis/sentinel.conf

	if [ "$SENTINEL_PORT" ]; then
		sed -i "s|port 26379|port $SENTINEL_PORT|" /opt/redis/sentinel.conf
	fi

	if [ "$SENTINEL_MONITOR_IP" ] && [ "$SENTINEL_MONITOR_PORT" ]; then
		sed -i "s|# sentinel announce-ip 1.2.3.4|sentinel announce-ip $SENTINEL_MONITOR_IP|" /opt/redis/sentinel.conf
		sed -i "s|sentinel monitor mymaster 127.0.0.1 6379 2|sentinel monitor mymaster $SENTINEL_MONITOR_IP $SENTINEL_MONITOR_PORT 2|" /opt/redis/sentinel.conf
	fi

	if [ "$SENTINEL_AUTH_PASS" ]; then
		sed -i "s|# sentinel auth-pass mymaster MySUPER--secret-0123passw0rd|sentinel auth-pass mymaster $SENTINEL_AUTH_PASS|" /opt/redis/sentinel.conf
	fi

	if [ "$SENTINEL_BIND" ]; then
		sed -i "s|# bind 127.0.0.1 192.168.1.1|bind $SENTINEL_BIND|" /opt/redis/sentinel.conf
	fi
fi

chown -R redis:redis /opt/redis

exec gosu redis "$@"
