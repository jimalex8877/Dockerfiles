#!/usr/bin/env bash

mkdir -p `pwd`/9091/logs `pwd`/9091/config
docker run --restart=always -d --name kafka-9091 \
	--add-host=kafka-9092:192.168.1.103 \
	--add-host=kafka-9093:192.168.1.103 \
	--hostname=kafka-9091 \
	--expose 9091 -p 9091:9091 \
	-v `pwd`/9091/logs:/opt/kafka/logs \
	\
	-e KAFKA_PORT=9091 \
	-e KAFKA_LISTENERS=PLAINTEXT://:9091 \
	-e KAFKA_ZOOKEEPER_CONNECT=192.168.1.103:2181,192.168.1.103:2182,192.168.1.103:2183 \
	-e KAFKA_BROKER_ID=1 \
	\
	-e KAFKA_NUM_PARTITIONS=1 \
	-e KAFKA_INTERNAL_TOPIC_NUM=2 \
	\
	changmingjiang/kafka:latest

mkdir -p `pwd`/9092/logs `pwd`/9092/config
docker run --restart=always -d --name kafka-9092 \
	--add-host=kafka-9091:192.168.1.103 \
	--add-host=kafka-9093:192.168.1.103 \
	--hostname=kafka-9092 \
	--expose 9092 -p 9092:9092 \
	-v `pwd`/9092/logs:/opt/kafka/logs \
	\
	-e KAFKA_PORT=9092 \
	-e KAFKA_LISTENERS=PLAINTEXT://:9092 \
	-e KAFKA_ZOOKEEPER_CONNECT=192.168.1.103:2181,192.168.1.103:2182,192.168.1.103:2183 \
	-e KAFKA_BROKER_ID=2 \
	\
	-e KAFKA_NUM_PARTITIONS=1 \
	-e KAFKA_INTERNAL_TOPIC_NUM=2 \
	\
	changmingjiang/kafka:latest

mkdir -p `pwd`/9093/logs `pwd`/9093/config
docker run --restart=always -d --name kafka-9093 \
	--add-host=kafka-9091:192.168.1.103 \
	--add-host=kafka-9092:192.168.1.103 \
	--hostname=kafka-9093 \
	--expose 9093 -p 9093:9093 \
	-v `pwd`/9093/logs:/opt/kafka/logs \
	\
	-e KAFKA_PORT=9093 \
	-e KAFKA_LISTENERS=PLAINTEXT://:9093 \
	-e KAFKA_ZOOKEEPER_CONNECT=192.168.1.103:2181,192.168.1.103:2182,192.168.1.103:2183 \
	-e KAFKA_BROKER_ID=3 \
	\
	-e KAFKA_NUM_PARTITIONS=1 \
	-e KAFKA_INTERNAL_TOPIC_NUM=2 \
	\
	changmingjiang/kafka:latest
