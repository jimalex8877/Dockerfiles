#!/usr/bin/env bash
thisPath=$(pwd)

mkdir -p $thisPath/2181/data $thisPath/2181/logs
echo "1" > $thisPath/2181/data/myid
docker run --restart=always -d --name zookeeper-2181 \
	--expose 2181 -p 2181:2181 \
	--expose 3181 -p 3181:3181 \
	--expose 4181 -p 4181:4181 \
	-v $thisPath/2181/data:/opt/zookeeper/data \
	-v $thisPath/2181/logs:/opt/zookeeper/logs \
	-e ZOOKEEPER_PORT=2181 \
	-e ZOOKEEPER_SERVERS="server.1=0.0.0.0:3181:4181,server.2=192.168.1.103:3182:4182,server.3=192.168.1.103:3183:4183" \
	-e ZOOKEEPER_LOG4J_MAXBACKUPINDEX=20 \
	-e ZOOKEEPER_LOG4J_DATEFORMAT="yyyy-MM-dd HH:mm:ss" \
	-e ZOOKEEPER_LOG4J_MAXFILESIZE=100 \
	changmingjiang/zookeeper:latest

mkdir -p $thisPath/2182/data $thisPath/2182/logs
echo "2" > $thisPath/2182/data/myid
docker run --restart=always -d --name zookeeper-2182 \
	--expose 2182 -p 2182:2182 \
	--expose 3182 -p 3182:3182 \
	--expose 4182 -p 4182:4182 \
	-v $thisPath/2182/data:/opt/zookeeper/data \
	-v $thisPath/2182/logs:/opt/zookeeper/logs \
	-e ZOOKEEPER_PORT=2182 \
	-e ZOOKEEPER_SERVERS="server.1=192.168.1.103:3181:4181,server.2=0.0.0.0:3182:4182,server.3=192.168.1.103:3183:4183" \
	-e ZOOKEEPER_LOG4J_MAXBACKUPINDEX=20 \
	-e ZOOKEEPER_LOG4J_DATEFORMAT="yyyy-MM-dd HH:mm:ss" \
	-e ZOOKEEPER_LOG4J_MAXFILESIZE=100 \
	changmingjiang/zookeeper:latest

mkdir -p $thisPath/2183/data $thisPath/2183/logs
echo "3" > $thisPath/2183/data/myid
docker run --restart=always -d --name zookeeper-2183 \
	--expose 2183 -p 2183:2183 \
	--expose 3183 -p 3183:3183 \
	--expose 4183 -p 4183:4183 \
	-v $thisPath/2183/data:/opt/zookeeper/data \
	-v $thisPath/2183/logs:/opt/zookeeper/logs \
	-e ZOOKEEPER_PORT=2183 \
	-e ZOOKEEPER_SERVERS="server.1=192.168.1.103:3181:4181,server.2=192.168.1.103:3182:4182,server.3=0.0.0.0:3183:4183" \
	-e ZOOKEEPER_LOG4J_MAXBACKUPINDEX=20 \
	-e ZOOKEEPER_LOG4J_DATEFORMAT="yyyy-MM-dd HH:mm:ss" \
	-e ZOOKEEPER_LOG4J_MAXFILESIZE=100 \
	changmingjiang/zookeeper:latest