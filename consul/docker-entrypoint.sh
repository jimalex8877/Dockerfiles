#!/usr/bin/dumb-init /bin/bash
set -e

chown -R consul:consul ${CONSUL_DATA_DIR}

# 如果$@为空则运行consul agent
if [ -z "$@" ]; then
	if [ "$BOOTSTRAP_EXPECT" ]; then
		jq '.bootstrap_expect = '$BOOTSTRAP_EXPECT ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	if [ "$CLIENT_ADDR" ]; then
		jq '.client_addr = "'$CLIENT_ADDR'"' ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	if [ "$ADVERTISE_ADDR" ]; then
		jq '.advertise_addr = "'$ADVERTISE_ADDR'"' ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	if [ "$BIND_ADDR" ]; then
		jq '.bind_addr = "'$BIND_ADDR'"' ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	if [ "$ENABLE_SCRIPT_CHECKS" ]; then
		jq '.enable_script_checks = '$ENABLE_SCRIPT_CHECKS ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	if [ "$ENCRYPT" ]; then
		jq '.encrypt = "'$ENCRYPT'"' ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	if [ "$LEAVE_ON_TERMINATE" ]; then
		jq '.leave_on_terminate = '$LEAVE_ON_TERMINATE ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	if [ "$REJOIN_AFTER_LEAVE" ]; then
		jq '.rejoin_after_leave = '$REJOIN_AFTER_LEAVE ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	if [ "$SERVER" ]; then
		jq '.server = '$SERVER ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	if [ "$UI" ]; then
		jq '.ui = '$UI ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	if [ "$DNS_CONFIG_ENABLE_TRUNCATE" ]; then
		jq '.dns_config.enable_truncate = '$DNS_CONFIG_ENABLE_TRUNCATE ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	if [ "$DNS_CONFIG_ONLY_PASSING" ]; then
		jq '.dns_config.only_passing = '$DNS_CONFIG_ONLY_PASSING ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	if [ "$RETRY_JOIN" ]; then
		jq '.retry_join = [ '$RETRY_JOIN' ]' ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	if [ "$PORTS_GRPC" ]; then
		jq '.ports.grpc = '$PORTS_GRPC ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	if [ "$PORTS_HTTPS" ]; then
		jq '.ports.https = '$PORTS_HTTPS ${CONSUL_CONFIG_DIR}/config.json | sponge ${CONSUL_CONFIG_DIR}/config.json
	fi

	exec gosu consul consul agent \
		-config-dir="$CONSUL_CONFIG_DIR"
fi

exec gosu consul "$@"
