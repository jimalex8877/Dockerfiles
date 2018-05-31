#!/bin/bash

chown -R zookeeper:zookeeper "${ZOOKEEPER_HOME}"

#-------------

sed -i 's|ZOO_LOG4J_PROP="INFO,CONSOLE"|ZOO_LOG4J_PROP="INFO,ROLLINGFILE"|g' "$ZOOKEEPER_HOME"/bin/zkEnv.sh
sed -i "s|ZOO_LOG_DIR=\".\"|ZOO_LOG_DIR=\"$ZOOKEEPER_HOME/logs\"|g" "$ZOOKEEPER_HOME"/bin/zkEnv.sh

#-------------

if [ ! -f "$ZOOKEEPER_HOME/conf/zoo.cfg" ]; then
	mv "$ZOOKEEPER_HOME"/conf/zoo_sample.cfg "$ZOOKEEPER_HOME"/conf/zoo.cfg
fi

sed -i "s|dataDir=/tmp/zookeeper|dataDir=$ZOOKEEPER_HOME/data|g" "$ZOOKEEPER_HOME"/conf/zoo.cfg

if [ "$ZOOKEEPER_PORT" ]; then
	sed -i "s|clientPort=2181|clientPort=$ZOOKEEPER_PORT|g" "$ZOOKEEPER_HOME"/conf/zoo.cfg
fi

if [[ -n $ZOOKEEPER_SERVERS ]]; then
	echo -e "\n" >> "$ZOOKEEPER_HOME"/conf/zoo.cfg
    IFS=','; for server in $ZOOKEEPER_SERVERS; do
		echo $server >> "$ZOOKEEPER_HOME"/conf/zoo.cfg
	done
fi

if [ "$ZOOKEEPER_MAX_CLIENT_CNXNS" ]; then
	sed -i "s|#maxClientCnxns=60|maxClientCnxns=$ZOOKEEPER_MAX_CLIENT_CNXNS|g" "$ZOOKEEPER_HOME"/conf/zoo.cfg
fi

if [ "$ZOOKEEPER_SYNC_LIMIT" ]; then
	sed -i "s|syncLimit=5|syncLimit=$ZOOKEEPER_SYNC_LIMIT|g" "$ZOOKEEPER_HOME"/conf/zoo.cfg
fi

if [ "$ZOOKEEPER_INIT_LIMIT" ]; then
	sed -i "s|initLimit=10|initLimit=$ZOOKEEPER_INIT_LIMIT|g" "$ZOOKEEPER_HOME"/conf/zoo.cfg
fi

if [ "$ZOOKEEPER_TICK_TIME" ]; then
	sed -i "s|tickTime=2000|tickTime=$ZOOKEEPER_TICK_TIME|g" "$ZOOKEEPER_HOME"/conf/zoo.cfg
fi

if [ "$ZOOKEEPER_AUTOPURGE_SNAPRETAINCOUNT" ]; then
	sed -i "s|#autopurge.snapRetainCount=3|autopurge.snapRetainCount=$ZOOKEEPER_AUTOPURGE_SNAPRETAINCOUNT|g" "$ZOOKEEPER_HOME"/conf/zoo.cfg
fi

if [ "$ZOOKEEPER_AUTOPURGE_PURGEINTERVAL" ]; then
	sed -i "s|#autopurge.purgeInterval=1|autopurge.purgeInterval=$ZOOKEEPER_AUTOPURGE_PURGEINTERVAL|g" "$ZOOKEEPER_HOME"/conf/zoo.cfg
fi

#-------------

sed -i "s|log.dir=.|log.dir=$ZOOKEEPER_HOME/log|g" "$ZOOKEEPER_HOME"/conf/log4j.properties
sed -i "s|zookeeper.root.logger=INFO, CONSOLE|zookeeper.root.logger=INFO, ROLLINGFILE|g" "$ZOOKEEPER_HOME"/conf/log4j.properties

if [ "$ZOOKEEPER_LOG4J_DATEFORMAT" ]; then
	sed -i "s|%d{ISO8601}|%d{$ZOOKEEPER_LOG4J_DATEFORMAT}|g" "$ZOOKEEPER_HOME"/conf/log4j.properties
fi

if [ "$ZOOKEEPER_LOG4J_MAXFILESIZE" ]; then
	sed -i "s|MaxFileSize=10MB|MaxFileSize=${ZOOKEEPER_LOG4J_MAXFILESIZE}MB|g" "$ZOOKEEPER_HOME"/conf/log4j.properties
fi

if [ "$ZOOKEEPER_LOG4J_MAXBACKUPINDEX" ]; then
	sed -i "s|#log4j.appender.ROLLINGFILE.MaxBackupIndex=10|log4j.appender.ROLLINGFILE.MaxBackupIndex=$ZOOKEEPER_LOG4J_MAXBACKUPINDEX|g" "$ZOOKEEPER_HOME"/conf/log4j.properties
fi

#-------------

exec gosu zookeeper "$@"