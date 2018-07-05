#!/bin/bash

chown -R kafka:kafka "${KAFKA_HOME}"

sed -i "s|log.dirs=/tmp/kafka-logs|log.dirs=$KAFKA_HOME/logs|" "$KAFKA_HOME"/config/server.properties;

if [ "$KAFKA_BROKER_ID" ]; then
	sed -i "s|broker.id=0|broker.id=$KAFKA_BROKER_ID|" "$KAFKA_HOME"/config/server.properties;
fi

if [ "$KAFKA_LISTENERS" ]; then
	sed -i "s|#listeners=PLAINTEXT://:9092|listeners=$KAFKA_LISTENERS|" "$KAFKA_HOME"/config/server.properties;
fi

if [ "$KAFKA_ZOOKEEPER_CONNECT" ]; then
	sed -i "s|zookeeper.connect=localhost:2181|zookeeper.connect=$KAFKA_ZOOKEEPER_CONNECT|" "$KAFKA_HOME"/config/server.properties;
	sed -i "s|zookeeper.connect=localhost:2181|zookeeper.connect=$KAFKA_ZOOKEEPER_CONNECT|" "$KAFKA_HOME"/config/consumer.properties;
fi

if [ "$KAFKA_GROUP_ID" ]; then
	sed -i "s|group.id=test-consumer-group|group.id=$KAFKA_GROUP_ID|" "$KAFKA_HOME"/config/consumer.properties;
fi

if [ "$KAFKA_NUM_PARTITIONS" ]; then
	sed -i "s|num.partitions=1|num.partitions=$KAFKA_NUM_PARTITIONS|" "$KAFKA_HOME"/config/server.properties;
fi

if [ "$KAFKA_INTERNAL_TOPIC_NUM" ]; then
	sed -i "s|offsets.topic.replication.factor=1|offsets.topic.replication.factor=$KAFKA_INTERNAL_TOPIC_NUM|" "$KAFKA_HOME"/config/server.properties;
	sed -i "s|transaction.state.log.replication.factor=1|transaction.state.log.replication.factor=$KAFKA_INTERNAL_TOPIC_NUM|" "$KAFKA_HOME"/config/server.properties;
	sed -i "s|transaction.state.log.min.isr=1|transaction.state.log.min.isr=$KAFKA_INTERNAL_TOPIC_NUM|" "$KAFKA_HOME"/config/server.properties;
fi

sed -i "s|log4j.rootLogger=INFO, stdout, kafkaAppender|log4j.rootLogger=INFO,kafkaAppender|" "$KAFKA_HOME"/config/log4j.properties;

if [ "$KAFKA_PORT" ]; then
	sed -i "s|bootstrap.servers=localhost:9092|bootstrap.servers=localhost:$KAFKA_PORT|" "$KAFKA_HOME"/config/connect-distributed.properties;
	sed -i "s|bootstrap.servers=localhost:9092|bootstrap.servers=localhost:$KAFKA_PORT|" "$KAFKA_HOME"/config/connect-standalone.properties;
	sed -i "s|bootstrap.servers=localhost:9092|bootstrap.servers=localhost:$KAFKA_PORT|" "$KAFKA_HOME"/config/producer.properties;
fi

exec gosu kafka "$@"
