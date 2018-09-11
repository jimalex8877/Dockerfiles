#!/bin/bash

if [ "$ERLANG_COOKIE" ]; then
	rm -f /var/lib/rabbitmq/.erlang.cookie
	echo $ERLANG_COOKIE > /var/lib/rabbitmq/.erlang.cookie
	chmod 400 /var/lib/rabbitmq/.erlang.cookie
	chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
	unset $ERLANG_COOKIE
fi

chown -R rabbitmq:rabbitmq $RABBITMQ_BASE

#-------------

if [ -z "$(ls -A "$RABBITMQ_MNESIA_BASE")" ]; then

	cp /etc/rabbitmq/rabbitmq.conf "$RABBITMQ_CONFIG_FILE.conf"

	gosu rabbitmq rabbitmq-server &
	gosu rabbitmq rabbitmqctl wait "$RABBITMQ_MNESIA_BASE/rabbit@$HOSTNAME.pid"

	if [ "$RABBIT_USER" ] && [ "$RABBIT_USER_PASSWORD" ]; then
		gosu rabbitmq rabbitmqctl add_user $RABBIT_USER $RABBIT_USER_PASSWORD
		gosu rabbitmq rabbitmqctl set_user_tags $RABBIT_USER administrator
		gosu rabbitmq rabbitmqctl set_permissions -p / $RABBIT_USER '.*' '.*' '.*'
		unset $RABBIT_USER
		unset $RABBIT_USER_PASSWORD
	fi

	if [ "$MANAGEMENT_LISTENER_IP" ]; then
		sed -i "s|# management.listener.ip = 127.0.0.1|management.listener.ip = $MANAGEMENT_LISTENER_IP|" "$RABBITMQ_CONFIG_FILE.conf"
	fi

	if [ "$MANAGEMENT_LISTENER_SSL" ]; then
		sed -i "s|# management.listener.ssl = true|management.listener.ssl = $MANAGEMENT_LISTENER_SSL|" "$RABBITMQ_CONFIG_FILE.conf"
	fi

	rabbitmq-plugins -n $HOSTNAME list -m -e rabbitmq_management

	rabbitmq-plugins enable --offline rabbitmq_management

	gosu rabbitmq rabbitmqctl stop_app

	if [ "$JOIN_CLUSTER_NODE" ]; then
		gosu rabbitmq rabbitmqctl join_cluster $JOIN_CLUSTER_NODE
	fi

	if [ "$JOIN_CLUSTER_NODE_RAM" ]; then
		gosu rabbitmq rabbitmqctl join_cluster $JOIN_CLUSTER_NODE_RAM --ram
	fi

	gosu rabbitmq rabbitmqctl shutdown
fi

exec gosu rabbitmq "$@"