#!/usr/bin/env bash
docker exec -it kafka-9091 bash;
$KAFKA_HOME/bin/kafka-topics.sh	\
	--create --zookeeper $KAFKA_ZOOKEEPER_CONNECT \
	--replication-factor 3 --partitions 1 --topic "test" \
	--config cleanup.policy="compact" --if-not-exists;
