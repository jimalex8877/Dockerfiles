#!/bin/sh

echo 1024 > /proc/sys/net/core/somaxconn
echo 1 > /proc/sys/vm/overcommit_memory
echo 'never' > /sys/kernel/mm/transparent_hugepage/enabled

if [ ! -f "/opt/redis/redis.conf" ]; then
	wget -c -O /opt/redis/redis.conf https://gitee.com/mirrors/redis/raw/5.0/redis.conf

	sed -i "s/daemonize yes/daemonize no/" /opt/redis/redis.conf
	sed -i "s|dir /var/lib/redis/|dir /opt/redis|" /opt/redis/redis.conf
	sed -i "s|pidfile /var/run/redis/redis.pid|pidfile /opt/redis/redis.pid|" /opt/redis/redis.conf
	sed -i "s|logfile /var/log/redis/redis.log|logfile /opt/redis/redis.log|" /opt/redis/redis.conf

	if [ "$REDIS_PORT" ]; then
		sed -i "s|port 6379|port $REDIS_PORT|" /opt/redis/redis.conf
	fi

	if [ "$REDIS_REQUIRE_PASS" ]; then
		sed -i "s|# requirepass foobared|requirepass $REDIS_REQUIRE_PASS|" /opt/redis/redis.conf
	fi

	if [ "$REDIS_MASTER_AUTH_PASS" ]; then
		sed -i "s|# masterauth <master-password>|masterauth $REDIS_MASTER_AUTH_PASS|" /opt/redis/redis.conf
	fi

	if [ "$REDIS_MASTER_IP" ] && [ "$REDIS_MASTER_PORT" ]; then
		sed -i "s|# replicaof <masterip> <masterport>|replicaof $REDIS_MASTER_IP $REDIS_MASTER_PORT|" /opt/redis/redis.conf
	fi

	if [ "$REDIS_BIND" ]; then
		sed -i "s|bind 127.0.0.1|bind $REDIS_BIND|" /opt/redis/redis.conf
	fi
fi

chown -R redis:redis /opt/redis

exec gosu redis "$@"
